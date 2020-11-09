pipeline {
    agent any
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
                sh 'pwd'
                sh 'docker build . -t webapp:latest'
            }
    
        }
        stage("run docker"){
            steps{
                sh 'docker run -d -p 80:8080 webapp:latest'
            }
        }
    }
}