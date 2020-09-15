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
                      sh "docker tag cloud-devops-capstone henokhm/cloud-devops-capstone"
                      sh 'docker push henokhm/cloud-devops-capstone'
                  }
              }
         }
    }
}