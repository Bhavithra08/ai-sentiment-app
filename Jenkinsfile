pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t sentiment-app .'
            }
        }

        stage('Test') {
            steps {
                sh 'docker run sentiment-app pytest tests/ --junitxml=results.xml'
            }
        }
    }        
        stage('Code Quality') {
            steps {
                 withSonarQubeEnv('SonarQubeServer') {
                    sh "${SCANNER_HOME}/bin/sonar-scanner"
            }
        }

        stage('Security') {
            steps {
                sh 'snyk test || true'
            }
        }

        stage('Deploy to Test') {
            steps {
                sh 'docker-compose -f docker-compose.test.yml up -d --build'
            }
        }

        stage('Release to Production') {
            steps {
                sh 'docker-compose -f docker-compose.prod.yml up -d --build'
            }
        }

        stage('Monitoring') {
            steps {
                sh 'echo "Monitoring simulated"'
            }
        }
    }
}
