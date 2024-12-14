pipeline {
    agent any

    stages {
        stage('Build') {
        agent {dockerfile true}
            steps {
                echo 'Building image...'
                sh 'docker build -t $DOCKERID/cw2-server:1.0 .'
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