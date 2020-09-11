def uploadFileToSlack() {
    def file = "/var/jenkins_home/workspace/FlutterTestAppJenkins_master/build/app/outputs/flutter-apk/app-release.apk"
    def botAuthToken = "xoxb-1360101043748-1369947899601-BdygiEUJXYUeq7o2YBlX8wyF"
    def channelName = "#debug_jenkins"
    try {
        sh(script: """
                curl --request POST \
                --url https://slack.com/api/files.upload \
                --header 'content-type: multipart/form-data' \
                --form token=$botAuthToken \
                --form channels=$channelName \
                --form file="@${file}"
                """
                )
    } catch (Exception e) {}
 }

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
        // stage ('Download lcov converter') {
        //     steps {
        //         sh "curl -O https://raw.githubusercontent.com/eriwen/lcov-to-cobertura-xml/master/lcov_cobertura/lcov_cobertura.py"
        //     }
        // }
        // stage ('Test') {
        //     steps {
        //         sh "flutter test --coverage"
        //     }
        //     post {
        //         always {
        //             sh "python3 lcov_cobertura.py coverage/lcov.info --output coverage/coverage.xml"
        //             step([$class: 'CoberturaPublisher', coberturaReportFile: 'coverage/coverage.xml'])
        //         }
        //     }
        // }
        // stage ('Clean') {
        //     steps {
        //         sh "flutter clean"
        //     }
        // }
        // stage ('Build') {
        //     steps {
        //         sh '''
        //         #!/bin/sh
        //         flutter build apk --release
        //         '''
        //     }
        // }
        stage ('Publish') {
            steps {
                uploadFileToSlack()
            }
        }
    }
}