FROM python:3.10-slim-bullseye

WORKDIR /app

# Copy requirements from analytics folder
COPY analytics/requirements.txt .

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential libpq-dev && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy full app
COPY analytics/ .

EXPOSE 5153

CMD ["python", "app.py"]
