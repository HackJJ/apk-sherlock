# Start with an Alpine Linux base image
FROM alpine:latest

# Install OpenJDK 11 and other necessary tools
RUN apk update && \
    apk add --no-cache openjdk11-jre curl unzip bash

# Arguments for specifying the versions of apktool and jadx
ARG APKTOOL_VERSION=2.10.0
ARG JADX_VERSION=1.5.0

# Download and set up apktool

RUN mkdir /opt/apktool && \
    curl -L -o /opt/apktool/apktool.jar "https://github.com/iBotPeaches/Apktool/releases/download/v${APKTOOL_VERSION}/apktool_${APKTOOL_VERSION}.jar" && \
    chmod +x /opt/apktool/apktool.jar && \
    echo -e '#!/bin/sh\njava -jar /opt/apktool/apktool.jar "$@"' > /usr/local/bin/apktool && \
    chmod +x /usr/local/bin/apktool

# Download and set up jadx
RUN curl -L -o /opt/jadx.zip "https://github.com/skylot/jadx/releases/download/v${JADX_VERSION}/jadx-${JADX_VERSION}.zip" && \
    unzip /opt/jadx.zip -d /opt/jadx && \
    rm /opt/jadx.zip && \
    chmod +x /opt/jadx/bin/jadx /opt/jadx/bin/jadx-gui

# Adding jadx to PATH
ENV PATH="/opt/jadx/bin:${PATH}"

# Set the work directory
WORKDIR /workspace

# Copy the decompilation script into the container
COPY run-decompilation.sh /usr/local/bin/run-decompilation.sh
RUN chmod +x /usr/local/bin/run-decompilation.sh

# Start with a shell
CMD ["/usr/local/bin/run-decompilation.sh"]

# docker build -t apktool-jadx-image .
# docker run -it --rm -e APK_FILE=/data/unitree.apk -v /Users/jj/Documents/ranges/APAC:/data -v /Users/jj/Documents/test:/workspace apktool-jadx-image

