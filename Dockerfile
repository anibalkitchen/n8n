FROM n8nio/n8n:latest

# Instalar Python y dependencias básicas
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Instalar music21 y dependencias necesarias
RUN pip3 install --no-cache-dir \
    music21 \
    numpy \
    matplotlib \
    lxml \
    pretty_midi

# Añadir Python al PATH
RUN ln -s /usr/bin/python3 /usr/bin/python

# Comando por defecto (n8n se encarga de esto, pero es bueno tenerlo)
CMD ["n8n"]
