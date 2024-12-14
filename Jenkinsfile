pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    def image = docker.build("kymmie/cw2-server:1.1", ".")
                }
                echo 'Building image... '
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