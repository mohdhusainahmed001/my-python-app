FROM python:3.10-bullseye

# Switch to root
USER root

# Install required tools
RUN apt-get update && \
    apt-get install -y \
    wget \
    curl \
    unzip \
    zip \
    git \
    openjdk-17-jdk-headless \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install SonarScanner
RUN curl -sSLo /tmp/sonar-scanner.zip \
    https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-5.0.1.3006-linux.zip && \
    unzip /tmp/sonar-scanner.zip -d /opt && \
    ln -s /opt/sonar-scanner-*/bin/sonar-scanner /usr/local/bin/sonar-scanner && \
    rm /tmp/sonar-scanner.zip

# Upgrade pip and install testing tools
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir pytest

# Set working directory
WORKDIR /workspace

# Default command
CMD ["bash"]
