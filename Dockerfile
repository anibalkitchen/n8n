FROM n8nio/n8n:latest

# Cambiar a root para instalar paquetes
USER root

# Instalar Python y dependencias
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

# Volver al usuario original (n8n usa 'node')
USER node

# Verificación final
RUN python3 -c "import music21; print('music21 installed successfully')"
