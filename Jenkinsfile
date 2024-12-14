pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    def image = docker.build("kymmie/cw2-server:1.1", ".")
                }
                echo 'Building image... '
            }
        }

        stage('Run Container') {
            steps {
                echo 'Run the container'
                sh 'docker run -d -p 8081:8080 kymmie/cw2-server:1.1'
            }
        }

        stage('Test Container Is Running') {
            steps {
                echo 'Testing container is running...'
                sh 'docker image ls -a'
                sh 'docker ps -a'
                sh 'docker ps -l'
                sh 'curl -s http://localhost:8081'
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                echo 'Pushing image to Docker Hub...'
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                        sh 'docker login -u $dockerHubUser -p $dockerHubPassword'
                        sh 'docker image push kymmie/cw2-server:1.1'
                    }
                }
            }
        }

        stage('Remove Container') {
            steps {
                echo 'Removing container...'
                sh 'docker stop $(docker ps -a -q)'
                sh 'docker rm $(docker ps -a -q)'
            }
        }

        stage('Check Container Removed') {
            steps {
                echo 'Checking container has been removed...'
                sh 'docker ps -a'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo 'Deploying to Kubernetes...'
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    echo 'Deploying to Kubernetes step - TODO'
                }
            }
        }

        stage('Test: Connect to Production Server') {
            steps {
                echo 'Testing connection to production server...'
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    echo 'Testing connection to production server - TODO'
                    sshagent(['ProductionServer']) {
                        sh 'ls'
                    }
                }
            }
        }

        stage('Remove Image') {
            steps {
                echo 'Removing image...'
                sh 'docker rmi kymmie/cw2-server:1.1'
            }
        }

        stage('Check Image Removed') {
            steps {
                echo 'Checking image has been removed...'
                sh 'docker image ls -a'
            }
        }
    }
}