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
                sh '''
                curl -F file=@build/app/outputs/flutter-apk/app-release.apk -F channels=C01APBGQB2Q -H "Authorization: Bearer xoxb-1360101043748-1381038767568-ScsXMSy00J1riQlHLyLit9hn" https://slack.com/api/files.upload
                '''
            }
        }
    }
}