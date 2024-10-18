FROM python:3.8-alpine

# Install only the necessary packages
RUN apk add --no-cache gcc g++ make libffi-dev musl-dev linux-headers

# Install Python dependencies
RUN pip install torch torchvision torchaudio flask

# Clone only the necessary files from the min-dalle repo
WORKDIR /app
RUN git clone --depth 1 https://github.com/kuprel/min-dalle.git
WORKDIR /app/min-dalle

# Copy the Flask app
COPY app.py /app/min-dalle/

EXPOSE 5000
CMD ["python", "app.py"]
