FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt && \
    pip install uvicorn

COPY train.py .
COPY app.py .
COPY config.json .
COPY dataset/ ./dataset/

# Training step - har build par chalega
RUN python train.py

EXPOSE 8000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
