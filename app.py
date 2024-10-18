from flask import Flask, request, jsonify, send_file
from min_dalle import MinDalle
from PIL import Image
import io
import os

app = Flask(__name__)

# Load model
model = MinDalle(is_mega=True, is_reusable=True)

@app.route('/generate', methods=['POST'])
def generate_image():
    prompt = request.json.get('prompt', '')
    
    if not prompt:
        return jsonify({'error': 'No prompt provided'}), 400
    
    # Generate image
    image = model.generate_image(prompt)
    
    # Save image locally
    image_filename = 'generated_image.png'
    image.save(image_filename)
    
    # Return the image as a response
    return send_file(image_filename, mimetype='image/png')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
  
