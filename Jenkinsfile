pipeline {
    agent any

    tools {
        dockerTool 'docker'
    }

    stages {

        stage('Clone Code') {
            steps {
                git url: 'https://github.com/mohdhusainahmed001/my-python-app', branch: 'main'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip3 install -r requirements.txt || true'
            }
        }

        stage('Test') {
            steps {
                sh 'pytest || true'
            }
        }

        // ✅ SonarQube Analysis Stage
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'sonar-scanner'
                }
            }
        }

        // ✅ Quality Gate (very important)
        stage('Quality Gate') {
            steps {
                waitForQualityGate abortPipeline: true
            }
        }

        stage('Build') {
            steps {
                echo "Building application..."
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
