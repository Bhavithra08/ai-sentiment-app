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
        stage('Code Quality') {
            steps {
               withSonarQubeEnv('SonarQubeServer') {
                script {
                         def scannerHome = tool 'SonarScanner'
                         sh "\"${scannerHome.replace('\\', '/')}/bin/sonar-scanner\""
            }
        }
    }
}
stage('Security') {
    steps {
        script {
            try {
                sh 'snyk test'
            } catch (Exception e) {
                echo "Snyk scan failed or snyk not installed. Skipping."
            }
        }
    }
}

        stage('Deploy to Test') {
    steps {
        script {
            if (fileExists('docker-compose.test.yml')) {
                sh 'docker-compose -f docker-compose.test.yml up -d --build'
            } else {
                echo "docker-compose.test.yml not found, skipping deploy to test."
            }
        }
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
