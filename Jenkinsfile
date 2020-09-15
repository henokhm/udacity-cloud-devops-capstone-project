pipeline {
    agent any
    stages {
        stage('Lint HTML') {
              steps {
                  sh 'tidy -q -e app/sample.html'
              }
         }
         stage('Build Docker Image') {
              steps {
                  sh 'docker build -t cloud-devops-capstone .'
              }
         }
         stage('Push Docker Image') {
              steps {
                  withDockerRegistry([url: "", credentialsId: "dockerhub"]) {
                      sh 'docker tag cloud-devops-capstone henokhm/cloud-devops-capstone'
                      sh 'docker push henokhm/cloud-devops-capstone'
                  }
              }
         }
         stage('Deploying to AWS EKS') {
              steps{
                  withAWS(credentials: 'aws-static', region: 'us-east-2') {
                      sh 'aws eks --region us-east-2 update-kubeconfig --name cloud-devops-capstone'
                      sh 'kubectl config use-context arn:aws:eks:us-east-2:269815686180:cluster/cloud-devops-capstone'
                      sh 'kubectl apply -f k8s.yml'
                      sh 'kubectl get nodes'
                      sh 'kubectl get deployments'
                      sh 'kubectl get pod -o wide'
                      sh 'kubectl get service/capstone-project'
                  }
              }
        }
    }
}