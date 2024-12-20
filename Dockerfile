# Use an official Python runtime as the base image
FROM python:3.12-slim-buster

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose the port that Flask will run on
EXPOSE 5000

# Command to run the application using Gunicorn (production-ready server)
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
