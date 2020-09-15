#!/usr/bin/env bash

# Step 1:
# Build image and add a descriptive tag
docker build  --tag cloud-devops-capstone .

# Step 2: 
# List docker images
docker container ls

# Step 3: 
# Run flask app
docker run -p 5000:5000 cloud-devops-capstone

