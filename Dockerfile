# Base image
FROM ubuntu:22.04
 
# Prevent interactive prompts
ARG DEBIAN_FRONTEND=noninteractive
 
# Install system dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common \
    sudo \
    openssl \
    sshpass \
    openssh-client \
    openssh-server \
    ssh \
    curl \
    ca-certificates \
    gnupg \
&& mkdir -p /var/run/sshd
 
# -------------------------
# Install Python 3.11 + pip
# -------------------------
RUN add-apt-repository ppa:deadsnakes/ppa \
&& apt-get update \
&& apt-get install -y \
       python3.11 \
       python3.11-venv \
       python3.11-dev \
       python3-pip
 
# Ensure pip is available for Python 3.11
RUN python3.11 -m ensurepip --upgrade
 
# -------------------------
# Install Java 21 (OpenJDK)
# -------------------------
RUN apt-get install -y openjdk-21-jdk
 
# -------------------------
# Environment variables
# -------------------------
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH
 
# Start SSH service
RUN service ssh start
 
# Expose SSH port
EXPOSE 22
 
# -------------------------
# Cleanup (important)
# -------------------------
RUN apt-get clean \
&& rm -rf /var/lib/apt/lists/*
 
# Keep container running
CMD ["sh", "-c", "sleep infinity"]
