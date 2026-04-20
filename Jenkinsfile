pipeline {
    agent any

    // This block tells Jenkins to look for a tool named 'docker' 
    // configured in Manage Jenkins > Global Tool Configuration
    tools {
        dockerTool 'docker' 
    }

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
                    // Using the Docker Pipeline Plugin syntax
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
