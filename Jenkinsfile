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
                    sh 'docker login'
                    sh 'docker image push kymmie/cw2-server:1.1'
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

        stage('Remove Image') {
            steps {
                echo 'Removing image...'
                sh 'docker rmi kymmie/cw2-server:1.1'
            }
        }
    }
}