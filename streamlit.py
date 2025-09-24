import streamlit as st
import requests
from PIL import Image

# -------------------------------
# CONFIG
# -------------------------------
# Directly set the API URL (local Flask server)
API_URL = "http://127.0.0.1:5000"   # <-- no secrets needed
st.set_page_config(page_title="Brain Tumor Detector", layout="centered")

# -------------------------------
# UI
# -------------------------------
st.title("🧠 Brain Tumor Detector")
st.write("Upload an MRI image and get a prediction from the model.")

# Upload image
uploaded = st.file_uploader("Choose an MRI image...", type=["png", "jpg", "jpeg", "bmp"])

if uploaded:
    # Show uploaded image
    img = Image.open(uploaded).convert("RGB")
    st.image(img, caption="Uploaded image", use_column_width=True)

    if st.button("Predict"):
        try:
            # Send to Flask API
            resp = requests.post(
                f"{API_URL}/predict",
                files={"file": ("image.jpg", uploaded.getvalue(), "image/jpeg")}
            )

            if resp.status_code == 200:
                data = resp.json()
                st.success(f"Prediction: **{data['prediction_label']}**")
                st.write(f"Confidence score: `{data['probability']:.4f}`")
            else:
                st.error(f"Error {resp.status_code}: {resp.text}")

        except Exception as e:
            st.error(f"Request failed: {e}")

# -------------------------------
# Placeholder for future metrics
# -------------------------------
st.markdown("---")
st.header("📊 Training metrics")
st.info("Metrics visualization will be added later once logs are available.")
