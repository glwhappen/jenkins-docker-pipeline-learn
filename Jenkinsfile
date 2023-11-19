pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t my-flask-app .'
            }
        }
        stage('Test') {
            steps {
                // 添加测试步骤
            }
        }
        stage('Deploy') {
            steps {
                // 添加部署步骤
            }
        }
    }
}
