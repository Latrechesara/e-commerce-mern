# flask_api.py

from flask import Flask, request, jsonify
import numpy as np
import cv2
import torch
from model import CNN  # import your CNN class

# -------------------------------
# CONFIG
# -------------------------------
MODEL_PATH = "brain_tumor_detector_weights.pth"  # weights-only
DEVICE = torch.device("cpu")  # CPU
LABELS = ["No Tumor", "Tumor"]

# -------------------------------
# INITIALIZE FLASK & LOAD MODEL
# -------------------------------
app = Flask(__name__)

# Create model instance
model = CNN().to(DEVICE)

# Load weights
model.load_state_dict(torch.load(MODEL_PATH, map_location=DEVICE))
model.eval()

# -------------------------------
# IMAGE PREPROCESSING
# -------------------------------
def preprocess_image(file_bytes):
    """
    Preprocess uploaded image to match training:
      - Decode bytes to BGR
      - Resize 128x128
      - Convert BGR -> RGB
      - Normalize 0-1
      - Convert to tensor (C,H,W)
      - Add batch dimension
    """
    file_bytes = np.frombuffer(file_bytes, np.uint8)
    img = cv2.imdecode(file_bytes, cv2.IMREAD_COLOR)
    img = cv2.resize(img, (128,128))
    b,g,r = cv2.split(img)
    img = cv2.merge([r,g,b])
    img = img.astype(np.float32)/255.0
    img = np.transpose(img, (2,0,1))  # HWC -> CHW
    img = torch.tensor(img).unsqueeze(0) # batch dim
    return img

# -------------------------------
# PREDICTION ROUTE
# -------------------------------
@app.route("/predict", methods=["POST"])
def predict():
    if "file" not in request.files:
        return jsonify({"error": "No file uploaded"}), 400

    file = request.files["file"]
    if file.filename == "":
        return jsonify({"error": "Empty filename"}), 400

    try:
        x = preprocess_image(file.read())
        with torch.no_grad():
            out = model(x.to(DEVICE))
            prob = out.item()                 # sigmoid output
            pred_idx = int(prob >= 0.5)       # threshold 0.5

        return jsonify({
            "prediction_index": pred_idx,
            "prediction_label": LABELS[pred_idx],
            "probability": prob
        })

    except Exception as e:
        return jsonify({"error": str(e)}), 500

# -------------------------------
# RUN FLASK APP
# -------------------------------
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
