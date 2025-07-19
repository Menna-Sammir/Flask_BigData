# Use official Python image
FROM python:3.11-slim

# Set working directory inside container
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt


# Copy your app code (assuming your app is in src/)
COPY src/ ./src

# Set environment variable for Flask
ENV FLASK_APP=src.app
ENV FLASK_RUN_HOST=0.0.0.0

# Expose the port Fly.io will use
EXPOSE 8080

# Use gunicorn to serve Flask app
CMD ["gunicorn", "src.app:app", "--bind", "0.0.0.0:8080"]
