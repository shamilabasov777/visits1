pipeline {
    agent any
    triggers {
        pollSCM '* * * * *'
        }
    stages {
        stage("build image") {
            steps {
		withCredentials([usernamePassword(credentialsId: 'docker-hub1', passwordVariable: 'password', usernameVariable: 'username')]) {
                    sh "docker build -t shamil777/$JOB_NAME:$BUILD_NUMBER ."
		    sh "docker login -u $username -p $password"
		    sh "docker push shamil777/$JOB_NAME:$BUILD_NUMBER"
                } 
	    }
        }
        stage("deploy container"){
            steps{
                sh "docker run -d --name web$BUILD_NUMBER -p 80$BUILD_NUMBER:8080 shamil777/$JOB_NAME:$BUILD_NUMBER"
       
            }
        }
    }   
}
