pipeline {
    agent any
    
	environment {
		DOCKERHUB_CREDENTIALS=credentials('mosesdock-dockerhub')
    }
 
stages {
 	stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}
	stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t nginxtest:latest .' 
                sh 'docker tag nginxtest mosesdock/nginxtest:latest'
                sh 'docker tag nginxtest mosesdock/nginxtest:$BUILD_NUMBER'
               
          }
        }
     
  	stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "mosesdock-dockerHub", url: "" ]) {
          sh  'docker push mosesdock/nginxtest:latest'
          sh  'docker push mosesdock/nginxtest:$BUILD_NUMBER' 
        }
                  
          }
        }
   
 }
}
