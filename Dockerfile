FROM n8nio/n8n:latest

# Instalar Python 3.10 desde el repo oficial
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y python3.10 python3.10-pip \
    && rm -rf /var/lib/apt/lists/*

# Crear alias
RUN ln -s /usr/bin/python3.10 /usr/bin/python

# Instalar music21
RUN pip3.10 install music21 numpy matplotlib lxml pretty_midi
