#!/usr/bin/env bash

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=henokhm/cloud-devops-capstone

# Step 2:  
# Authenticate & tag
docker login
docker tag a4c95b9f5a88 henokhm/cloud-devops-capstone
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
docker push henokhm/cloud-devops-capstone
