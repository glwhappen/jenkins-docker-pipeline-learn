pipeline {
    agent any

    environment {
        // 定义镜像名称的基础部分
        NAME = "app_flask"
        IMAGE_NAME = "${NAME}_${env.BUILD_NUMBER}" // -${env.GIT_COMMIT}
        IMAGE_TAG = "jenkins"
        CONTAINER_NAME = "${IMAGE_NAME}_jenkins"
    }

    stages {
        stage('Build') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }
        stage('Deploy Docker Container') {
            steps {
                script {
                    // 停止旧容器并部署新容器
                    sh "docker stop ${CONTAINER_NAME} || true && docker rm ${CONTAINER_NAME} || true"
                    sh "docker run -d -p 0:5000 --name ${CONTAINER_NAME} ${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }
    }
}
