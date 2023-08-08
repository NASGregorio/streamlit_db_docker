FROM python:3.11-bullseye

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

CMD git clone https://github.com/Shabba7/LunchAssistant.git . && \
    pip3 install -r requirements.txt && \
    streamlit run homepage.py
