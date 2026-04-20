pipeline {
    agent any

    stages {

        stage('Clone Code') {
            steps {
                git url: 'https://github.com/mohdhusainahmed001/my-python-app', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                echo "Building application..."
            }
        }

        stage('Test') {
            steps {
                echo "Running tests..."
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    docker.build("my-app:latest")
                }
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying application..."
            }
        }
    }
}
