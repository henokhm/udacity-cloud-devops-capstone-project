# Udacity Cloud DevOps Engineer Nanodegree Program - Capstone Project

## Scope of Project

The primary purspose of this project is to create a Continuous Deployment Pipeline for a simple NodeJS web application and deploy it to a Kubernetes Cluster on AWS. The following is a short summary of the tools and services I have had to use to achive this result.

1. **Jenkins:** Used to setup CI/CD Pipeline
2. **Docker:** Used to containerize the NodeJS app
3. **DockerHub:** Used as container registry
4. **AWS Elastic** Kubernetese Service (EKS): Used to deploy containerized application

TODO: Other important points to include in README:

- Jenkins plugins and summary of build stages
  Jenknins server AWS t2.micro EC2 instance.
  Here are the Jenkins plugins I installed and used for this project:
  **Blue Ocean:** for cleaner Jenkins user experience
  **Pipeline: AWS Steps:** to enable Jenkins pipeline steps to interact with the AWS API

- Zero downtime rolling updates
- NodeJS app used https://github.com/heroku/node-js-getting-started
