#!/usr/bin/env bash
# Sets up a new docker swarm

echo "Do you want to continue with the new docker swarm setup?(yes/no)"
read -r input
if [ "$input" != "yes" ]; then
	echo "Exiting setup."
	exit 1
fi

echo "Enter the IP address of the node:"
read -r NODE_IP
# Improved regex for basic IP address validation
if [[ ! $NODE_IP =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
	echo "Invalid IP address. Please ensure it is in the format x.x.x.x where x is between 0 and 255."
	exit 1
fi

# initialize swarm
if ! docker swarm init --advertise-addr "$NODE_IP"; then
	echo "Failed to initialize Docker Swarm. Please check if Docker is installed and running."
	exit 1
fi

# Display join tokens
docker swarm join-token worker
docker swarm join-token manager
