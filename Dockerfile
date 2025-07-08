FROM debian:bullseye

# Set environment to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
  curl \
  ffmpeg \
  python3 \
  ca-certificates \
  gnupg \
  build-essential \
  && apt-get clean

# Install Node.js (v18 LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
  apt-get install -y nodejs

# Install N8N globally
RUN npm install -g n8n

# Set working directory
WORKDIR /data

# Environment variables
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin123
ENV N8N_DIAGNOSTICS_ENABLED=false

EXPOSE 5678

CMD ["n8n"]
