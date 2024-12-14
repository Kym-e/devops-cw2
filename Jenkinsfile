pipeline {
    agent any

    stages {
        stage('Build') {
            app = docker.build("echo $DOCKERID/cw2-server:1.1 .")
            steps {
                echo 'Building image...'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing.. TO BE IMPLEMENTED'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying.... TO BE IMPLEMENTED'
            }
        }
        stage('Notify') {
            steps {
                echo 'Notifying.... TO BE IMPLEMENTED'
            }
        }
    }
}