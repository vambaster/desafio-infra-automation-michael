# Use a base image with Ubuntu
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-venv \
    sshpass \
    sudo \
    openssh-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a virtual environment
RUN python3 -m venv /opt/venv

# Activate the virtual environment and install Ansible
RUN /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install ansible

# Copy the Ansible playbook and related files
COPY playbook.yaml /playbook.yaml

# Set the PATH to include the virtual environment bin directory
ENV PATH="/opt/venv/bin:$PATH"

# Run the Ansible playbook as the default command
CMD ["ansible-playbook", "/playbook.yaml"]