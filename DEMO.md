# ⏱️ PlateWise 3-Minute Hackathon Judge Evaluation Script

Welcome, judges! Follow this exact 3-minute click-through script to test and verify every core feature, safety guarantee, and Google technology integration.

---

### 🚀 Minute 0:00 - 0:30: One-Click Demo Seeding & Smart Intake
1. Open the application at `http://localhost:3000`.
2. Notice the top **Judge Guided Tour banner**. Click **"One-Click Re-Seed Demo Data"**.
3. Go to the **Smart Intake** tab.
4. Click the demo preset: **"Priya's Dairy & Produce"** (`1.5L cow milk, 300g spinach, 200g paneer, 1 loaf bread`).
5. Click **"Analyze with Gemini Flash"**.
6. **Observe**:
   - Items are extracted in `< 500 ms` with confidence scores and storage recommendations.
   - The **Human-In-The-Loop Review** dialog pops up. Click **"Confirm & Add to Inventory"**.

---

### 🛡️ Minute 0:30 - 1:15: Deterministic AllergenGuard & Near-Expiry Planning
1. Navigate to the **Kitchen Inventory** tab.
   - **Observe**: Fresh milk and spinach are flagged with red **"Use First"** badges (expiring in $\le 2$ days).
2. Switch to the **Safe Meal Planner** tab.
3. Select **Priya Sharma** from the top persona dropdown (her family profile has a severe **peanut and tree nut allergy**, plus **Type 2 diabetes**).
4. Click **"Plan Meals with AllergenGuard"**.
5. **Observe**:
   - The recipe strictly prioritizes the near-expiry spinach, milk, and paneer.
   - **Zero nuts or high-glycemic sugars are permitted**.
   - Notice the green **"100% Allergen-Guard Approved"** badge and the prominent **"Not Medical Advice"** disclosure.

---

### 🔬 Minute 1:15 - 1:50: Science-Backed Food Safety Checker (RAG)
1. Switch to the **Food Safety** tab.
2. Click the test case: **"Chicken Left Out 6h (Danger Zone)"** (*"Cooked chicken curry left on counter for 6 hours. Safe if reheated?"*).
3. Click **"Evaluate Safety"**.
4. **Observe**:
   - Immediate **`DISCARD IMMEDIATELY`** verdict.
   - Grounded in USDA FSIS Danger Zone rules: explains that bacterial enterotoxins are heat-stable and cannot be eliminated by boiling.
   - Official USDA & FSSAI citations rendered.

---

### 🤝 Minute 1:50 - 2:30: Surplus Donation & Atomic Claim Lock
1. Switch top persona dropdown to **Vikram (Cafe Annapurna Manager)**.
2. Go to the **Surplus Donations** tab.
   - Vikram has posted 15 loaves of fresh artisanal sourdough and 40 lunch trays.
3. Switch persona to **Sister Anjali (Annapurna Trust NGO)**.
4. Sister Anjali sees the available listing (with distance in km).
5. Click **"Claim Pickup"** on the bread listing.
6. **Observe**:
   - Atomic Firestore transaction locks the listing.
   - Unique pickup authorization code generated: `PW-XXXX`.
   - If another NGO tries to claim the same listing, the race condition is blocked with an explicit conflict warning!

---

### 📊 Minute 2:30 - 3:00: BigQuery ESG Dashboard & 94% Cost Reduction
1. Switch persona to **Rajesh (Admin)**.
2. Navigate to the **ESG Dashboard** tab.
   - **Live Sustainability Metrics**: 142.5 kg food saved, 356.3 kg CO2e avoided, ₹19,237 saved.
   - **AI Model Routing Cost Chart**: Visual bar comparison showing **94% cost reduction** of Gemini Flash + caching vs a naive Always-Pro baseline.
   - Click **"Download ESG Report (CSV)"** to inspect the real exported ESG file.
3. Navigate to **Admin Console** to inspect the real-time OpenTelemetry trace audit trail of every agent action!
