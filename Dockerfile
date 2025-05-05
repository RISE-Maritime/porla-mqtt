FROM ghcr.io/mo-rise/porla:v0.4.1

RUN apt-get update && apt-get install -y \
    mosquitto-clients \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt
