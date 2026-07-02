# multi stage docker file 
# Stage 1 - Builder
FROM python:3.12-slim AS builder

WORKDIR /app
COPY requirements.txt .

# Install dependencies into /install
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# Stage 2 - Runtime
FROM python:3.12-slim

WORKDIR /app

# Copy installed dependencies from builder
COPY --from=builder /install /usr/local

# Copy application code
COPY app.py .

EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
