pipeline {
    agent any

    tools {
        maven 'Maven-3.9.11'
        jdk 'jdk-21'
    }

    stages {
        stage('Build Maven') {
            steps {
                checkout scmGit(
                    branches: [[name: '*/main']],
                    extensions: [],
                    userRemoteConfigs: [[url: 'https://github.com/Eustachekamala/devops-automation']]
                )
                sh 'mvn clean install'
            }
        }

        stage('Build Docker image') {
            steps {
                script {
                    sh 'docker build -t eustachekamala/devops-integration .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(
                        credentialsId: 'dockerhub_credentials',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )]) {
                        sh '''
                            echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                            docker push eustachekamala/devops-integration
                        '''
                    }
                }
            }
        }
    }
}
