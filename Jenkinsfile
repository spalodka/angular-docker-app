pipeline {
    agent any
    environment {
        NETLIFY_AUTH_TOKEN = credentials('nfp_tgeYUodECkGLRZrqHwhS5rB32UTZWkYr1e4d')  // You can set this in Jenkins credentials
        NETLIFY_SITE_ID = '0052fc7b-3176-4493-96cf-404c8c523cc9'  // Replace with your Netlify site ID
    }
    stages {
        stage('Checkout') {
            steps {
                echo 'Starting the checkout process...'
                // Checkout your Angular project from the repository
                git branch: 'master', url: 'https://github.com/spalodka/angular-docker-app.git'
                // credentialsId:'464d97b6-bda6-4d7c-a219-2c4a70fd3129'
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
                sh 'ng build --prod'
            }
        }

        stage('Install Netlify CLI') {
            steps {
                echo 'installing netlify cli..............'
                // Install Netlify CLI locally (if not installed globally)
                sh 'npm install -g netlify-cli'
            }
        }

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
                    --auth $NETLIFY_AUTH_TOKEN \
                    --site $NETLIFY_SITE_ID \
                    --dir dist/angular-app
                '''
            }
        }
    }
}
