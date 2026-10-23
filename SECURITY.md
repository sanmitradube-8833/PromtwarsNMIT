# PlateWise Security Policy & Threat Model

**Standard**: OWASP Top 10 • OWASP LLM Top 10 • STRIDE Threat Model  
**Status**: ACTIVE & ENFORCED

---

## 1. STRIDE Threat Model & Mitigations

| Threat Category | Potential Attack Vector | PlateWise Architectural Mitigation |
| :--- | :--- | :--- |
| **Spoofing Identity** | Fake NGO attempting to claim surplus food or unverified users modifying inventory. | Firebase Authentication with custom claims (`user`, `business`, `ngo`, `admin`). NGO role requires admin verification checkmark. Firebase App Check (reCAPTCHA Enterprise) blocks automated bot traffic. |
| **Tampering with Data** | Concurrent double-claiming of donation listings or tampering with expiration dates. | Atomic Firestore database transactions on surplus claims. Server-side validation of all shelf-life calculations. |
| **Repudiation** | User denies claiming surplus or posting bad food. | Centralized immutable audit log in Google BigQuery recording user ID, trace ID, agent action, and authorization claim codes. |
| **Information Disclosure** | Leakage of customer phone numbers, street addresses, or names to external LLMs. | Pre-LLM PII Redaction Layer (`PIIRedactor`) strips or masks phone numbers, emails, postal PIN codes, and names before any prompt leaves the gateway. |
| **Denial of Service** | Flooding intake endpoint with large images or LLM queries. | Token bucket rate limiting (60 req/min per IP), signed URL upload constraints (max 10MB image, strict MIME types), and Cloud Run auto-scaling caps. |
| **Elevation of Privilege** | Standard household user accessing admin audit console. | RBAC middleware (`require_role`) enforcing role checks on all privileged endpoints. Deny-by-default Firestore rules. |

---

## 2. OWASP LLM Top 10 Mitigations

1. **LLM01: Prompt Injection**:
   - Both direct (user chat) and indirect (OCR text on grocery receipts, malicious item names) prompt injections are scanned by `SecuritySanitizer`.
   - 20 red-team injection attacks tested in the benchmark harness achieved **100% containment**.
2. **LLM02: Insecure Output Handling**:
   - All agent outputs are constrained by typed Pydantic v2 schemas (`response_schema`).
   - LLM responses are never evaluated as executable code or raw unescaped HTML.
3. **LLM04: Model Denial of Service**:
   - Strict token caps enforced on every request (`max_tokens`).
   - Caching layer intercepts repeated identical queries with 0 LLM token cost.
4. **LLM06: Sensitive Information Disclosure**:
   - Automated regex and entity redaction layer sanitizes inputs before passing to Vertex AI.
5. **LLM08: Excessive Agency**:
   - All state-mutating actions (adding items to database, reserving donations) enforce a **Human-In-The-Loop (HITL)** confirmation dialog before committing.

---

## 3. Deterministic Allergen Safety Boundary
- Allergen screening is strictly governed by `AllergenGuard` (pure Python rule code).
- In the event of conflicting dietary profiles (e.g. nut allergy + vegan + diabetic), the rule engine computes the **strict union of all exclusions**.
- If any prohibited ingredient is detected, the recipe is immediately vetoed with replacement suggestions.
- Every meal suggestion renders a visible "Not Medical Advice" notice.
