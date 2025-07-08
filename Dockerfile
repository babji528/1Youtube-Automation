FROM node:18

# Install ffmpeg
RUN apt-get update && apt-get install -y ffmpeg

# Install n8n
RUN npm install -g n8n

WORKDIR /data

# Set environment variables
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin123
ENV N8N_DIAGNOSTICS_ENABLED=false

EXPOSE 5678

CMD ["n8n"]
