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

CMD unicorn --workers=1 --bind 0.0.0.0:$PORT app:app


