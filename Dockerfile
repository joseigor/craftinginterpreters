FROM ubuntu:22.04

# Set the working directory
WORKDIR /craftinginterpreters

# Install dependencies
RUN apt-get update && apt-get install -y \
    make \
    gpg \
    wget

# Install C compiler
RUN apt-get update && apt-get install gcc -y

# Install Java sdk
RUN apt-get update && apt-get install openjdk-17-jdk -y

# Install dart sdk
RUN apt-get update && apt-get install apt-transport-https -y
RUN wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub \
    | gpg  --dearmor -o /usr/share/keyrings/dart.gpg
RUN echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' \
    | tee /etc/apt/sources.list.d/dart_stable.list
RUN apt-get update && apt-get install 'dart=2.19.6-1' -y