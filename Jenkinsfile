pipeline {
agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
    stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t mosesdock/nginxtest:$BUILD_NUMBER .' 
                // sh 'docker tag nginxtest mosesdock/nginxtest:latest'
                sh 'docker tag nginxtest mosesdock/nginxtest:$BUILD_NUMBER'
               
          }
        }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Publish image to Docker Hub') {
            steps {
          sh  'docker push mosesdock/nginxtest:latest'
          sh  'docker push mosesdock/nginxtest:$BUILD_NUMBER' 
        }
    }              
   }
    post {
    always {
      sh 'docker logout'
    }
  }
}
