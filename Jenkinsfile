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
                sh "flutter test --coverage"
            }
            post {
                always {
                    sh "python3 lcov_cobertura.py coverage/lcov.info --output coverage/coverage.xml"
                    step([$class: 'CoberturaPublisher', coberturaReportFile: 'coverage/coverage.xml'])
                }
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