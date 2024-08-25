# Use the official Ubuntu 20.04 (Focal Fossa) as the base image
FROM ubuntu:focal

# Set the environment variable to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    sudo vim curl wget git build-essential \
    && rm -rf /var/lib/apt/lists/*

# Create a new user named 'praisegod' with sudo privileges
RUN useradd -m -s /bin/bash praisegod && \
    echo 'praisegod ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Set 'praisegod' as the default user
USER praisegod

# Set the working directory to the user's home directory
WORKDIR /home/praisegod

# Switch to bash shell by default
CMD ["bash"]
