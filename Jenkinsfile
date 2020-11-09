pipeline {
    agent any
    environment {
         DOCKER_VERSION = getVersion()
        }

    stages{
        stage("Git clone"){
             steps {
                 checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/sathishkumarusk/cicdpythonapp-k8s.git']]])
             }
        }
        stage("Build Mvn package"){
            steps{
                sh 'echo building'
                sh 'mvn clean package'
            }
        }
        stage("Build Docker image"){
            steps{
                sh 'docker build . -t webapp:${DOCKER_VERSION}'
            }
    
        }
        stage("run docker"){
            steps{
                sh 'docker run -d -p 80:8080 webapp:${DOCKER_VERSION}'
            }
        }
    }
}

def getVersion(){    
        sh 'git rev-parse --verify --short HEAD'
        return imgVersion 
}