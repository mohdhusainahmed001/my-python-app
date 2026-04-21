pipeline {
    agent {
        docker {
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
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Test') {
            steps {
                sh 'PYTHONPATH=. pytest'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'sonar-scanner'
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 15, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        stage('Build') {
            steps {
                // Example: package your app into a zip
                sh 'zip -r demo-app.zip .'
            }
        }

        stage('Upload to Nexus') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'nexus-creds', usernameVariable: 'NEXUS_USER', passwordVariable: 'NEXUS_PASS')]) {
                    sh '''
                        curl -v -u $NEXUS_USER:$NEXUS_PASS \
                        --upload-file demo-app.zip \
                        http://<NEXUS_HOST>:8081/repository/my-generic-repo/demo-app/demo-app-${BUILD_NUMBER}.zip
                    '''
                }
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

