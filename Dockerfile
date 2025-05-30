# Use an official Python base image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory inside container
WORKDIR /app

# Copy all files from local dir to container's /app
COPY . .

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Create the database (optional: could also be done via entrypoint or Flask migration tool)
# RUN python -c "import app.database as db; db.log_prediction('Init', 'Setup')"


# Expose Flask's default port
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]
