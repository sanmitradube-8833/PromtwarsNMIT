# PlateWise Disclosures & Open-Source Licenses

Every line of application code in PlateWise was authored freshly for this project. Below is the exhaustive disclosure of all third-party open-source libraries, pre-trained AI foundation models, and regulatory datasets utilized.

---

## 1. AI Models & Cloud APIs

| Resource Name | Provider / Author | Purpose | License / Terms |
| :--- | :--- | :--- | :--- |
| **Gemini 2.5 Flash** | Google Cloud / Vertex AI | High-frequency multimodal extraction, OCR, classification, and safety advice | Google Cloud Platform Terms of Service |
| **Gemini 2.5 Pro** | Google Cloud / Vertex AI | Complex multi-day culinary planning and nutritional constraint solving | Google Cloud Platform Terms of Service |
| **Google Cloud Run** | Google Cloud Platform | Serverless container execution with auto-scaling | GCP Commercial Terms |
| **Google Cloud Firestore** | Google Cloud Platform | Real-time NoSQL database with atomic transactions | GCP Commercial Terms |
| **Google BigQuery** | Google Cloud Platform | Analytical event sink, ESG calculations, and ML forecasting | GCP Commercial Terms |
| **Google Secret Manager** | Google Cloud Platform | Zero-secrets runtime key and credential store | GCP Commercial Terms |
| **Firebase Auth & App Check** | Google Firebase | Zero-trust authentication, RBAC custom claims, and reCAPTCHA | Firebase Terms of Service |

---

## 2. Regulatory Knowledge Bases & Datasets

| Knowledge Base | Sponsoring Body | Application in PlateWise | Terms / Access |
| :--- | :--- | :--- | :--- |
| **FoodKeeper App Guidance** | USDA FSIS & Cornell University | Safe storage temperature durations and Danger Zone rules | Public Domain / US Government Work |
| **Safe Food Practices Manual** | FSSAI (Govt of India) | Regional food hygiene and dairy storage standards | Open Government Data (OGD) India |
| **OpenFoodFacts Taxonomy** | Open Food Facts | Regional Indian ingredient synonyms and staple lookups | Open Database License (ODbL) |

---

## 3. Backend Dependencies (Python)

| Package Name | Version | Purpose | License |
| :--- | :--- | :--- | :--- |
| **`fastapi`** | ^0.115.0 | Async web framework | MIT License |
| **`uvicorn`** | ^0.32.0 | ASGI web server | BSD-3-Clause |
| **`pydantic`** | ^2.9.0 | Data validation & JSON schema enforcement | MIT License |
| **`google-genai`** | ^0.1.1 | Official Google Gen AI Python SDK | Apache 2.0 |
| **`pytest`** | ^8.3.0 | Automated testing framework | MIT License |
| **`hypothesis`** | ^6.115.0 | Property-based testing for AllergenGuard | Mozilla Public License 2.0 |
| **`httpx`** | ^0.27.0 | Async HTTP client | BSD-3-Clause |
| **`python-jose`** | ^3.3.0 | JWT verification | MIT License |

---

## 4. Frontend Dependencies (Node.js / React)

| Package Name | Version | Purpose | License |
| :--- | :--- | :--- | :--- |
| **`next`** | ^15.1.0 | React framework for web | MIT License |
| **`react`** | ^19.0.0 | User interface library | MIT License |
| **`tailwindcss`** | ^3.4.16 | Utility-first CSS styling | MIT License |
| **`lucide-react`** | ^0.468.0 | Accessible UI icons | ISC License |
| **`clsx`** | ^2.1.1 | Conditional classnames | MIT License |
