pipeline {
    agent any

    environment {
        // 定义镜像名称的基础部分
        NAME = "app_flask"
        PORT = 30000
        IMAGE_NAME = "${NAME}_${env.JOB_NAME}" // ${env.BUILD_NUMBER} -${env.GIT_COMMIT}
        IMAGE_TAG = "jenkins"
        CONTAINER_NAME = "${IMAGE_NAME}_jenkins"
    }

    stages {
//         stage('Build') {
//             steps {
//                 sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
//             }
//         }
        stage('Deploy Docker Container') {
            steps {
                script {
                    // 停止并移除旧的服务
                    sh "docker-compose down"
                    // 启动服务
                    sh "docker-compose up --build -d"
                }
            }
        }
        stage('Get Port') {
            steps {
                script {
                    def assignedPort = sh(script: "docker port ${CONTAINER_NAME} 5000 | cut -d: -f2", returnStdout: true).trim()
                    echo "The container is running on port: ${assignedPort}"
                }
            }
        }
    }
}
