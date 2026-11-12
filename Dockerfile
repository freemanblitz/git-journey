# 1. Use the standard image (which has arm64 support)
FROM jenkins/agent:jdk17

# 2. Switch to root to install packages
USER root

# 3. Install Python3 and Pip
# Note: Debian-based images (like the standard agent) use apt-get, not apk.
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 4. Switch back to the jenkins user for security
USER jenkins
