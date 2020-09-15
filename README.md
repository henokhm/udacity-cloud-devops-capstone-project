# Udacity Cloud DevOps Engineer Nanodegree Program - Capstone Project

## Scope of Project

The primary purspose of this project is to create a Continuous Deployment Pipeline for a simple NodeJS web application and deploy it to a Kubernetes Cluster on AWS. The following is a short summary of the tools and services I have had to use to achive this result.

1. **Docker:** Used to containerize the NodeJS app
1. **DockerHub:** Used as container registry
1. **AWS Elastic Kubernetese Service (EKS):** Used to deploy containerized application
1. **Jenkins:** Used to setup CI/CD Pipeline

## Docker and DockerHub

The next step was to _containerized_ my **NodeJS** application. For this, I had to create a **Dockerfile**. I used the official **NodeJS image from DockerHub**. After I built and run my container, I pushed it to DockerHub using a bash script.

## EKS and eksctl

I used an **AWS Cloud9** instance to run the following command that creates an **AWS EKS** (Elastic Kubernetes Service) Cluster.

<pre><b>eksctl create cluster</b> \
      --name <b>cloud-devops-capstone</b>\
      --version <b>1.16</b>\
      --nodegroup-name <b>workers</b>\
      --node-type <b>t2.medium</b>\
      --nodes <b>3</b>\
      --nodes-min <b>1</b>\
      --nodes-max <b>4</b>\
      --node-ami <b>auto</b>\
      --region <b>us-east-2</b>
</pre>

**_Note_**: **AWS Cloud9** didn't come with **eksctl** installed, and thus I had to install it myself.

## k8s.yml

This script deploys the **containerized** image of the **NodeJS app** to the **EKS cluster** created previously. Some important points about the script:

1. It creates the necessary resources such as **Elastic Load Balancer** and **Auto Scaling Group**.
1. It also specifies a **rolling** deployment strategy. This allows for zero downtime rolling updates to the application.
1. It exposes the necessary ports at varous levels (container, cluster and laod balancer) for the app to run successfully.

## Jenkins

I used an **AWS EC2 t2.micro** instance as my Jenkins server. I used several Jenkins plugins that were used at different build stages. First, I added my **AWS** and **DockerHub** user credentials. The **DockerHub** credential allowed the Jenkins server to pull an image from **DockerHub**. The AWS credential allowed it to do the deployment. The AWS credential needs permission to create clusters on AWS Elastic Kubernetes Service.

Here are the Jenkins plugins I installed and used for this project:

1. **Blue Ocean:** for cleaner Jenkins user experience
1. **Pipeline: AWS Steps:** to enable Jenkins pipeline steps to interact with the AWS API

Here are the Ubuntu packages that I installed that were used in the Jenkins Pipeline:

1. **tidy** Ubuntu package used for linting HTML
1. **docker** Ubuntu package used for building container

## Additional Notes

- The NodeJS app used for this project can be found at https://github.com/heroku/node-js-getting-started
