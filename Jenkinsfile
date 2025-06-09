pipeline {

    agent any // Указываем, что пайплайн может выполняться на любом доступном агенте (пока это сам Jenkins)


    environment {

        DOCKER_HUB_USERNAME = 'твой_логин_dockerhub' // Замени на свой логин Docker Hub

        DOCKER_IMAGE_NAME = 'insurance-app'

        DOCKER_TAG = "${BUILD_NUMBER}" // BUILD_NUMBER - это встроенная переменная Jenkins, номер сборки

    }


    stages {

        stage('Checkout Code') { // Шаг 1: Получаем код из Git

            steps {

                git branch: 'main', url: 'https://github.com/твоё_имя_пользователя/my-insurance-app.git' // Замени на свой URL и ветку

            }

        }


        stage('Build Docker Image') { // Шаг 2: Собираем Docker-образ

            steps {

                sh '''

                    echo "Building Docker image ${DOCKER_IMAGE_NAME}:${DOCKER_TAG}..."

                    docker build -t ${DOCKER_HUB_USERNAME}/${DOCKER_IMAGE_NAME}:${DOCKER_TAG} .

                '''

            }

        }


        stage('Publish Docker Image') { // Шаг 3: Публикуем Docker-образ в Docker Hub

            steps {

                // Необходимо настроить учетные данные Docker Hub в Jenkins

                // Manage Jenkins -> Manage Credentials -> Add Credentials

                // Type: Username with password, ID: 'docker-hub-credentials'

                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {

                    sh '''

                        echo "Logging into Docker Hub..."

                        docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}


                        echo "Publishing Docker image ${DOCKER_USERNAME}/${DOCKER_IMAGE_NAME}:${DOCKER_TAG} to Docker Hub..."

                        docker push ${DOCKER_USERNAME}/${DOCKER_IMAGE_NAME}:${DOCKER_TAG}


                        echo "Logging out from Docker Hub..."

                        docker logout

                    '''

                }

            }

        }

    }


    post {

        always {

            sh '''

                echo "Cleaning up local Docker image..."

                docker rmi ${DOCKER_HUB_USERNAME}/${DOCKER_IMAGE_NAME}:${DOCKER_TAG} || true

            '''

        }

        success {

            echo 'Pipeline completed successfully! Docker image pushed to Docker Hub.'

        }

        failure {

            echo 'Pipeline failed! Check logs for errors.'

        }

    }

}
