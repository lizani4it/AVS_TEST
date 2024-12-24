pipeline {
    agent {
        docker {
            image 'gcc:latest'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    sh 'apt-get update && apt-get install -y git'
                }
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    sh 'chmod +x ./scripts/BuildAndRunTests.sh'
                    sh 'chmod +x ./main.c'
                    def buildResult = sh(script: 'make all', returnStatus: true)
                    if (buildResult != 0) {
                        error 'Build failed!'
                    }
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    sh 'chmod +x ./scripts/BuildAndRunTests.sh'
                    sh 'chmod +x ./main.c'
                    sh 'ls -l ./scripts/BuildAndRunTests.sh'
                    def testResult = sh(script: 'make test', returnStatus: true)
                    if (testResult != 0) {
                        error 'Tests failed!'
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Build and tests succeeded!'
        }
        failure {
            echo 'Build or tests failed!'
        }
    }
}
