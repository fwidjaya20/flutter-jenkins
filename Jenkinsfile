pipeline {
    agent any

    stages {
        stage ('Checkout') {
            steps {
                checkout scm
            }
        }
        stage ('Doctor') {
            steps {
                sh "flutter doctor"
            }
        }
        stage ('Download lcov converter') {
            steps {
                sh "curl -O https://raw.githubusercontent.com/eriwen/lcov-to-cobertura-xml/master/lcov_cobertura/lcov_cobertura.py"
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
                sh "flutter clean"
            }
        }
        stage ('Build') {
            steps {
                sh '''
                #!/bin/sh
                flutter build apk --release
                '''
            }
        }
        stage ('Publish') {
            steps {
                slackSend channel: '#development', message: 'Testing 1', tokenCredentialId: '75a952a2-c884-4bb1-b857-a46ca2971406'
            }
        }
    }
}