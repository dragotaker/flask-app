pipeline {
    agent any

    environment {
        // Указываем имя credentials, которое ты задал в Jenkins
        GIT_CREDENTIALS = 'github-dragotaker-token'
    }

    stages {
        stage('Checkout') {
            steps {
                // Используем credentials для доступа к репозиторию
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[
                        url: 'https://github.com/dragotaker/flask-app.git',
                        credentialsId: "${GIT_CREDENTIALS}"
                    ]]
                ])
            }
        }

        stage('Build') {
            steps {
                echo 'Build stage - add your build commands here'
                // Например, если у тебя Python-проект:
                // sh 'pip install -r requirements.txt'
            }
        }

        stage('Test') {
            steps {
                echo 'Test stage - add your test commands here'
                // Например:
                // sh 'pytest'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Docker build stage - add your docker build commands here'
                // Например:
                // sh 'docker build -t dragotaker/flask-app:latest .'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished'
        }
    }
}

