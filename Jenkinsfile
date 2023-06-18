pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh './mkdockerize.sh /path/to/project produce'
            }
        }

        stage('Test') {
            steps {
                sh './mkdockerize.sh /path/to/project serve'
                sh 'curl -sSf http://localhost:8000' // Basic check to see if server is responding
            }
        }
    }
}
