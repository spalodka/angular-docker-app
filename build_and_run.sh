#!/bin/bash

# Build the Docker image
docker build -t angular-docker-app .

# Stop and remove any existing container
docker stop angular-docker-app || true
docker rm angular-docker-app || true

# Run the Docker container
docker run -d -p 8080:80 --name my_running_app angular-docker-app
