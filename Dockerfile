FROM n8nio/n8n:latest

# Instalar Python y dependencias con apk
RUN apk add --no-cache \
    python3 \
    py3-pip \
    libxml2-dev \
    libxslt-dev \
    zlib-dev

# Instalar music21 y dependencias
RUN pip3 install --no-cache-dir \
    music21 \
    numpy \
    matplotlib \
    lxml \
    pretty_midi

# Crear alias para python3
RUN ln -s /usr/bin/python3 /usr/bin/python

# Verificación final
RUN python3 -c "import music21; print('music21 installed successfully')"
