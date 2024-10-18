# Base image
FROM python:3.8-slim

# Install dependencies
RUN apt-get update && apt-get install -y git
RUN pip install torch torchvision torchaudio
RUN pip install dalle-pytorch min-dalle flask

# Clone the repository
RUN git clone https://github.com/kuprel/min-dalle.git
WORKDIR /min-dalle

# Create an API using Flask
COPY app.py /min-dalle/

# Expose port
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
