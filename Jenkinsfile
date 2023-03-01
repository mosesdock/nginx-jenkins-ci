pipeline {
  environment {
    registry = "mosesdock/nginxtest"
    registryCredential = 'mosesdock-dockerhub'
    dockerImage = ''
  }
  
  agent any
  stages {
     stage('Initialize') {
            steps {
                script {
                    def dockerHome = tool 'mydocker'
                    env.PATH = "${dockerHome}/bin:${env.PATH}"
                }
            }
        }
     stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
   
  }
}
