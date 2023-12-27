pipeline {
    agent any
    tools {
         maven 'Maven3'
    }
    stages {
      stage ('Clone') {
            steps {
               git branch: 'main', url: 'https://github.com/prethivirajp/jfrog-assesment.git'
            }
        }
        stage ('Compile') {
            steps {
               sh 'mvn clean compile'
            }
        }
       stage ('Testing') {

            steps {
               sh 'mvn test'
            }
        }
        stage('Install Maven Package') {
            steps {
                sh 'mvn clean package'
                } 
        }
        stage('Build Docker Image') {
            steps {
                 sh 'docker build -t assesment1.jfrog.io/docket-petclinic-docker-local/docker-local:latest .'
            }
        }
        stage('Publish to Jfrog') {
            steps {
                 script {
                    docker.withRegistry( 'https://assesment1.jfrog.io/artifactory/docket-petclinic-docker-local', 'JFrog_Creds' ) { 
                      sh 'docker push assesment1.jfrog.io/docket-petclinic-docker-local/docker-local:latest'    
                    } 
                 }
            }
        }
    }
}
