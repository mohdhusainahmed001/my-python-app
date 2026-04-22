FROM python:3.10-bullseye

# Switch to root
USER root

# Install required tools including Docker CLI and kubectl
RUN apt-get update && \
    apt-get install -y \
    wget \
    curl \
    unzip \
    zip \
    git \
    openjdk-17-jdk-headless \
    ca-certificates \
    docker.io \
    apt-transport-https \
    gnupg \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Install SonarScanner
RUN curl -sSLo /tmp/sonar-scanner.zip \
    https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-5.0.1.3006-linux.zip && \
    unzip /tmp/sonar-scanner.zip -d /opt && \
    ln -s /opt/sonar-scanner-*/bin/sonar-scanner /usr/local/bin/sonar-scanner && \
    rm /tmp/sonar-scanner.zip

# Install kubectl (optional, for deploy stage)
RUN curl -sSLo /usr/local/bin/kubectl \
    https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl

# Upgrade pip and install testing tools
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir pytest

# Set working directory
WORKDIR /workspace

# Default command
CMD ["bash"]

