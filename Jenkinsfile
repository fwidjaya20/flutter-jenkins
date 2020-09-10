pipeline {
    agent any

    stages {
        stage ('Checkout') {
            steps {
                sh "echo CHECKOUT_STAGE"
            }
        }
        stage ('Test') {
            steps {
                sh "echo CHECKOUT_TEST"
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