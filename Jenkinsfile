pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    def image = docker.build("kymmie/cw2-server:${env.BUILD_NUMBER}", ".")
                }
                echo 'Building image... '
            }
        }

        stage('Run Container') {
            steps {
                echo 'Run the container'
                sh "docker run -d -p 8081:8080 kymmie/cw2-server:${env.BUILD_NUMBER}"
            }
        }

        stage('Test Container') {
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
                        sh "docker image push kymmie/cw2-server:${env.BUILD_NUMBER}"
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo 'Testing connection to production server...'
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    echo 'Deploying to Kubernetes...'
                    sshagent(['ProductionServer']) {
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@100.28.192.123 kubectl set image deployments/cw2-server cw2-server=kymmie/cw2-server:${env.BUILD_NUMBER}"
                    }
                }
            }
        }

        stage('Remove Container and Image') {
            steps {
                echo 'Removing container...'
                sh 'docker stop $(docker ps -a -q)'
                sh 'docker rm $(docker ps -a -q)'
                sh 'docker ps -a'
                echo 'Removing image...'
                sh "docker rmi kymmie/cw2-server:${env.BUILD_NUMBER}"
                sh 'docker image ls -a'
            }
        }
    }
}