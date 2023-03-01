pipeline {
  agent { 
    docker { 
      image 'docker:latest' 
      args '-v /var/run/docker.sock:/var/run/docker.sock' 
    } 
  }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('mosesdock-dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t mosesdock/nginxtest .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push mosesdock/nginxtest'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
