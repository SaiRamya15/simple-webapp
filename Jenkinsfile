pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git clone 'https://github.com/SaiRamya15/simple-webapp.git'
            }
        }

        stage('Build') {
            steps {
                echo 'No build step needed for a static website.'
            }
        }

        stage('Deploy') {
            steps {
                script {
                    def workspace = env.WORKSPACE
                    sh "mkdir -p ${workspace}/deploy"
                    sh "cp -r html/* ${workspace}/deploy/"
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment successful! View files in Jenkins workspace.'
            echo "URL: http://localhost:8080/job/samplehtml/ws/deploy/"
        }
    }
}
