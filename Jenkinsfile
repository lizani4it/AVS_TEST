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
                    // Установка Git, если он не установлен
                    sh 'apt-get update && apt-get install -y git'
                    // Проверка версии Git
                    sh 'git --version'
                }
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    // Проверка текущего каталога и содержимого
                    sh 'pwd'
                    sh 'ls -la'
                    // Выполнение сборки
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
                    // Установка прав на выполнение
                    sh 'chmod +x ./scripts/BuildAndRunTests.sh'
                    // Проверка прав на файл
                    sh 'ls -l ./scripts/BuildAndRunTests.sh'
                    // Выполнение тестов
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
