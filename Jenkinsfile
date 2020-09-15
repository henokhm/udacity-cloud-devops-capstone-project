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
                  sh 'sudo docker build -t cloud-devops-capstone .'
              }
         }
         stage('Push Docker Image') {
              steps {
                  withDockerRegistry([url: "", credentialsId: "dockerhub"]) {
                      sh 'sudo docker tag cloud-devops-capstone henokhm/cloud-devops-capstone'
                      sh 'sudo docker push henokhm/cloud-devops-capstone'
                  }
              }
         }
    }
}