# Use the official Node.js LTS image (version 18)
FROM node:18

# LABEL about the custom image
LABEL maintainer="benoit@alphatux.fr"
LABEL version=$VERSION
LABEL description="Massa node with massa-guard features"

# Set timezone and default cli
SHELL ["/bin/bash", "-c"]
ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/Paris"

# Install additional dependencies
RUN apt-get update && apt-get install -y python3 make g++

# Set the working directory
WORKDIR /usr/src/app

# Copy scripts into the container's working directory
COPY scripts/entrypoint.sh ./
COPY scripts/automate_rivalz.js ./

# Install node-pty locally
RUN npm install node-pty

# Install rivalz-node-cli globally (if needed)
RUN npm install -g rivalz-node-cli

# Make the entrypoint script executable
RUN chmod +x ./entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["./entrypoint.sh"]
