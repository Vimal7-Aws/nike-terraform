// This shows a simple build wrapper example, using the AnsiColor plugin.

node {
  environment {
        echo 'Started loop in env'
        AWS_ID = credentials("default")
        AWS_ACCESS_KEY_ID = "${env.AWS_ID_USR}"
        AWS_SECRET_ACCESS_KEY = "${env.AWS_ID_PSW}"
        echo "vimal---> $AWS_ACCESS_KEY_ID"
    }   

}

pipeline {
    agent any 


    stages {
        stage('Initialze') {
            steps {
                echo 'Init'
            }
        }
        stage('Build') { 
            steps {
                echo 'Build' 
            }
        }
        stage('Test') { 
            steps {
                echo 'Test' 
            }
        }
        stage('Deploy') { 
            steps {
                echo 'Deploy' 
            }
        }
        stage('Aws') {
            steps {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'default']]) {
                        sh './test.sh'
                    }
            }
         }
    }
    
}