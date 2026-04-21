FROM python:3.10-bullseye

# Switch to root automatically
USER root

# Install required tools (Java 17, git, curl, unzip, wget)
RUN apt-get update && \
    apt-get install -y wget curl unzip git openjdk-17-jdk-headless && \
    rm -rf /var/lib/apt/lists/*

# Install SonarScanner
RUN curl -sSLo /tmp/sonar-scanner.zip \
    https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-5.0.1.3006-linux.zip && \
    unzip /tmp/sonar-scanner.zip -d /opt && \
    ln -s /opt/sonar-scanner-*/bin/sonar-scanner /usr/local/bin/sonar-scanner && \
    rm /tmp/sonar-scanner.zip

# Upgrade pip and install pytest globally
RUN pip install --upgrade pip && \
    pip install pytest

# Set working directory
WORKDIR /workspace

# Default command
CMD ["bash"]

