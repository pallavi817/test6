pipeline {
    agent { label 'slave1' }

    environment {
        DOCKERHUB = credentials('ntr1505-docker')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/<your-username>/<your-repo>.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ntr1505/nodeapp:${BUILD_NUMBER} .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                sh 'echo "$DOCKERHUB_PSW" | docker login -u "$DOCKERHUB_USR" --password-stdin'
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push ntr1505/nodeapp:${BUILD_NUMBER}'
            }
        }
    }

    post {
        always {
            sh 'docker logout'
        }
    }
}

