FROM n8nio/n8n:latest

USER root

# Instalar Python y dependencias
RUN apk add --no-cache \
    python3 \
    py3-pip \
    libxml2-dev \
    libxslt-dev \
    zlib-dev

# Instalar music21 y dependencias con flag de sistema
RUN pip3 install --no-cache-dir --break-system-packages \
    music21 \
    numpy \
    matplotlib \
    lxml \
    pretty_midi

USER node

# Verificación final
RUN python3 -c "import music21; print('music21 installed successfully')"
