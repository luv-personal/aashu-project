FROM python:3.11-slim

# Create a user named deployuser
RUN useradd -m deployuser

# Set working directory
WORKDIR /home/deployuser

# Copy and install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the app code
COPY app.py .

# Set user to deployuser
USER deployuser

# Expose the Flask app port
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]