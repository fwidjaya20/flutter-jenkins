pipeline {
    agent any

    stages {
        stage ('Doctor') {
            steps {
                sh "flutter doctor"
            }
        }
        stage ('Test') {
            steps {
                sh "echo futter test"
            }
        }
        stage ('Clean') {
            steps {
                sh "echo CLEAN_BUILD"
            }
        }
        stage ('Build') {
            steps {
                sh "echo CHECKOUT_BUILD"
            }
        }
        stage ('Publish') {
            steps {
                sh "echo CHECKOUT_PUBLISH"
            }
        }
    }
}