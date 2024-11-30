# Use the official Node.js LTS image (version 18)
FROM node:18

# Install additional dependencies
RUN apt-get update && apt-get install -y python3 make g++

# Set the working directory
WORKDIR /usr/src/app

# Copy scripts into the container's working directory
COPY entrypoint.sh ./
COPY automate_rivalz.js ./

# Install node-pty locally
RUN npm install node-pty

# Install rivalz-node-cli globally (if needed)
RUN npm install -g rivalz-node-cli

# Make the entrypoint script executable
RUN chmod +x ./entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["./entrypoint.sh"]
