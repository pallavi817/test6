pipeline {
    agent { label 'slave1' }

    environment {
        DOCKERHUB = credentials('dockerhub-credentials')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'kit',
                    url: 'https://github.com/pallavi817/test6.git',
                    credentialsId: 'pallavi817-git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t your-dockerhub-username/test6:latest .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                sh "echo $DOCKERHUB_PSW | docker login -u $DOCKERHUB_USR --password-stdin"
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push your-dockerhub-username/test6:latest'
            }
        }
    }

    post {
        always {
            sh 'docker logout'
        }
    }
}


