import requests

url = "http://127.0.0.1:5000/predict"
file_path = "Y1.jpg"  # path to your image

with open(file_path, "rb") as f:
    files = {"file": f}
    response = requests.post(url, files=files)

print(response.json())
