# Use the official n8n image as the base
FROM n8nio/n8n:latest

# Switch to root user to install additional packages
USER root

# Update package lists and install FFmpeg
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Revert to the n8n user
USER node

# Set the working directory
WORKDIR /data

# Expose the default n8n port
EXPOSE 5678

# Define the command to run n8n
CMD ["n8n"]
