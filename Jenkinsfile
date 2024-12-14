pipeline {
    agent any

    stages {
        stage('Checkout code'){
            steps {
                echo 'Checking out code..'
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'GitHub', url: 'https://github.com/Kym-e/devops-cw2.git']])
            }
        }
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
        stage('Notify') {
            steps {
                echo 'Notifying....'
            }
        }
    }
}