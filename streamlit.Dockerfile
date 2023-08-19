FROM python:3.11-bullseye

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential curl software-properties-common git && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/Shabba7/LunchAssistant.git . && \
    pip3 install -r requirements.txt

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

ARG STREAMLIT_PRD_PORT
ENV STREAMLIT_PRD_PORT ${STREAMLIT_PRD_PORT}

CMD git pull && \
    streamlit run homepage.py --server.port=$STREAMLIT_PRD_PORT
