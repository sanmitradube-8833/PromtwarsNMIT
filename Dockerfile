# Multi-stage Dockerfile for PlateWise Backend on Cloud Run
FROM python:3.12-slim AS builder

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install uv for fast, reliable dependency resolution
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Copy dependency definition
COPY pyproject.toml .

# Install dependencies into a virtual environment
RUN uv venv /opt/venv && \
    uv pip install --no-cache --python /opt/venv/bin/python \
    fastapi uvicorn pydantic pydantic-settings httpx python-multipart python-jose passlib

# Final production image
FROM python:3.12-slim AS runner

WORKDIR /app

# Create non-root security user
RUN groupadd -r platewise && useradd -r -g platewise -s /bin/false platewise

# Copy virtualenv and application code
COPY --from=builder /opt/venv /opt/venv
COPY app ./app

# Set environment variables
ENV PATH="/opt/venv/bin:$PATH" \
    PYTHONUNBUFFERED=1 \
    PORT=8000 \
    HOST=0.0.0.0

# Set ownership to non-root user
RUN chown -R platewise:platewise /app
USER platewise

# Health check
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD curl -f http://localhost:8000/healthz || exit 1

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
