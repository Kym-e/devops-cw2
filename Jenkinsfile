pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
        agent {dockerfile true}
            steps {
                script {
                    echo ' Building Docker Image...'
                    sh 'node --version'
                    
                }
            }
        }
        stage('Test Container runs') {
            steps {
                script {
                    echo 'Running tests...'
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    echo 'Pushing Docker Image to Docker Hub...'
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    echo 'Deploying to Kubernetes...'
                }
            }
        }
    }
}