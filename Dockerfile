FROM node:18-slim

# Install dependencies (FFmpeg)
RUN apt-get update && apt-get install -y \
  ffmpeg \
  python3 \
  curl \
  gnupg \
  && apt-get clean

# Create app directory
WORKDIR /app

# Install N8N
RUN npm install n8n -g

# Setup environment variables
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin123
ENV N8N_DIAGNOSTICS_ENABLED=false

EXPOSE 5678

# Start N8N
CMD ["n8n"]
