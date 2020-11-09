pipeline{
    agent any
    stages{
        stage("Git clone"){
            git 'https://github.com/sathishkumarusk/cicdpythonapp-k8s.git' 
        }
        stage("Build Mvn package"){
            sh 'echo building'
            sh 'mvn clean package'
            
        }
    }
}