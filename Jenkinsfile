pipeline {
    agent any

    parameters {
    // add these parameters under string parameters This project is parameterized section
    string(name: 'container-name', defaultValue: 'mywebapp-container', description: 'Name of the Docker container')
    string(name: 'host-port', defaultValue: '2222', description: 'Host port to map to Tomcat')
    }


    tools {
        maven 'Maven01'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Shivasai-21/MyApp.git', branch: 'main'
            }
        }

        stage('Build WAR') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t mywebapp:latest .'
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    sh """
                    docker rm -f ${params.'container-name'} || true
                    docker run -d --name ${params.'container-name'} -p ${params.'host-port'}:8080 mywebapp:latest
                    """
                }
            }
        }
    }

    post {
        success {
            echo "✅ Deployment successful! Access app at http://<jenkins-host>:2222/"
            echo "Access your app at: http://${env.NODE_NAME}:${params.'host-port'}/"
        }
        failure {
            echo "❌ Deployment failed. Check logs."
        }
    }
}

