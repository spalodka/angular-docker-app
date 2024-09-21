pipeline {
    agent any
    // environment {
    //     NETLIFY_AUTH_TOKEN = credentials('nfp_r4wZGgQPp6LNadd5tqMdJJHzovUBxo6gcf57')  // You can set this in Jenkins credentials
    //     NETLIFY_SITE_ID = '0052fc7b-3176-4493-96cf-404c8c523cc9' // Replace with your Netlify site ID
    // }
    stages {
        stage('Checkout') {
            steps {
                echo 'Starting the checkout process...'
                // Checkout your Angular project from the repository
                git branch: 'master', url: 'https://github.com/spalodka/angular-docker-app.git',
                credentialsId:'464d97b6-bda6-4d7c-a219-2c4a70fd3129'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'starting installing dependencies.............'
                // Install project dependencies
                sh 'npm install'
            }
        }

        stage('Build Angular App') {
            steps {
                echo 'starting  builiding angular app............'
                // Build the Angular app (production build)
                sh 'ng build --configuration production'
            }
        }

        // stage('Install Netlify CLI') {
        //     steps {
        //         echo 'installing netlify cli..............'
        //         // Install Netlify CLI locally (if not installed globally)
        //         sh 'npm install -g netlify-cli'
        //     }
        // }

        stage('Check Netlify CLI') {
    steps {
        echo 'check netlify cli version................'
        sh 'netlify --version'
    }
}

        stage('Deploy to Netlify') {
            steps {
                echo 'deploying to netlify ..................'
                // Deploy to Netlify using the CLI
                sh '''
                    netlify deploy --prod \
                    --auth 'nfp_r4wZGgQPp6LNadd5tqMdJJHzovUBxo6gcf57' \
                    --site '0052fc7b-3176-4493-96cf-404c8c523cc9' \
                    --dir dist/angular-docker-app
                '''
            }
        }
    }

    post {
        success {
            emailext(
                to: 'sandippalodkar7@gmail.com',
                subject: "SUCCESS: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                body: """<p>Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' succeeded.</p>"""
            )
        }
        failure {
            emailext(
                to: 'sandippalodkar7@gmail.com',
                subject: "FAILURE: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                body: """<p>Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' failed.</p>"""
            )
        }
    }
}




