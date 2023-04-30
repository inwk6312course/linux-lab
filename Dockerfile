# Use a specific version of Ubuntu for reproducibility
FROM ubuntu:18.04

# Update package list and install necessary packages
RUN apt-get update && \
    apt-get install -y \
    sudo \
    bash \
    passwd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a new user called "cisco" with the password "cisco"
RUN useradd -m cisco \
    && echo 'cisco:cisco' | chpasswd \
    && usermod -aG sudo cisco

# Set the default user to be "cisco"
USER cisco

# Set the working directory to be the home directory of the "cisco" user
WORKDIR /home/cisco

# Start a bash shell as the default command
CMD ["/bin/bash"]