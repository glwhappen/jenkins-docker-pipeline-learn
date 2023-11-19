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
        stage('Update nginx config') {
            steps {
                // 删除容器内的现有nginx配置文件
                sh "docker exec ${CONTAINER_NAME}_nginx rm /etc/nginx/nginx.conf"
                // 复制新的nginx配置文件到容器
//                 sh "docker cp nginx.conf ${CONTAINER_NAME}_nginx:/etc/nginx/nginx.conf"
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
