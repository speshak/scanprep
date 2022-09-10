FROM python:3.9-bullseye

LABEL org.opencontainers.image.documentation="https://github.com/baltpeter/scanprep"
LABEL org.opencontainers.image.source="https://github.com/baltpeter/scanprep"
LABEL org.opencontainers.image.url="https://github.com/baltpeter/scanprep"
LABEL org.opencontainers.image.licenses="MIT"

WORKDIR /scanprep
COPY . .

RUN apt-get update && \
  apt-get install -y \
    libfreetype-dev \
    libjpeg-dev \
    libmupdf-dev \
    libpng-dev \
    libtiff-dev \
    libzbar0 \
    mupdf

RUN pip3 install --no-cache-dir -r requirements.txt && \
  mkdir /input /output

# Cleanup apt
RUN apt-get clean autoclean && \
  apt-get autoremove --yes && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/

VOLUME ["/input", "/output"]
ENTRYPOINT ./docker-entrypoint.sh
