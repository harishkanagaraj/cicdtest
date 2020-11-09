pipeline {
    agent any
    stages{
        stage("Git clone"){
             steps {
                 git 'https://github.com/sathishkumarusk/cicdpythonapp-k8s.git' 
             }
        }
        stage("Build Mvn package"){
            steps{
                sh 'echo building'
                sh 'mvn clean package'
            }
        }
    }
}