pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
               git branch: "main", 
                credentialsId: 'd24121e7-c5e6-413f-a8c4-890f7eeee1fc', 
                url: 'https://github.com/SaiRamya15/simple-webapp.git'
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
