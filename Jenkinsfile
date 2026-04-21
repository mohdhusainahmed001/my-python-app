pipeline {
    agent {
        docker {
            // Use the image from DockerHub
            image 'mohdhusainahmed001/my-jenkins-agent:latest'
            args '-u root'
        }
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/mohdhusainahmed001/my-python-app'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install project dependencies
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Test') {
            steps {
                // Run tests with PYTHONPATH set to workspace root
                sh 'PYTHONPATH=. pytest'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                // Ensure the SonarQube server name matches your Jenkins global configuration
                withSonarQubeEnv('SonarQube') {
                    sh 'sonar-scanner'
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 1, unit: 'HOURS') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        stage('Build') {
            steps {
                sh 'echo "Build stage placeholder"'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'echo "Docker build placeholder"'
            }
        }

        stage('Deploy') {
            steps {
                sh 'echo "Deploy stage placeholder"'
            }
        }
    }
}

