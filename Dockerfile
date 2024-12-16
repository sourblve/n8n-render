# Use the official n8n image as the base
FROM n8nio/n8n:latest

# Switch to root user to install additional packages
USER root

# Update package lists and install required dependencies
RUN apt-get update && \
    apt-get install -y ffmpeg curl build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Node.js dependencies globally
RUN npm install -g ws express dotenv

# Revert to the n8n user
USER node

# Set the working directory
WORKDIR /data

# Expose the default n8n port
EXPOSE 5678
