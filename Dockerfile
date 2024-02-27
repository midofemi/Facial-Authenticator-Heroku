FROM python:3.8

# Install system dependencies for OpenCV
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
 && rm -rf /var/lib/apt/lists/*

COPY . /app
WORKDIR /app

# Install Python dependencies
RUN pip install -r requirements.txt

EXPOSE $PORT

CMD uvicorn --workers=1 --host 0.0.0.0 --port $PORT app:app



