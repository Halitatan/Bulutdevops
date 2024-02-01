pipeline {
    agent any

    tools {
        python 'Python-3.x'  // Specify the exact Python version if needed
    }

    stages {
        stage('Install Snyk') {
            steps {
                script {
                    // Install Snyk using appropriate Python commands
                    bat 'pip install snyk'  // Assuming Snyk is available on PyPI
                }
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    // Python code to delete the 'demo' directory if it exists
                    if (fileExists('demo')) {
                        bat 'rmdir /s /q demo'  // Can be replaced with a Python equivalent if needed
                    }
                }
            }
        }

        stage('Checkout') {
            steps {
                script {
                    git branch: 'main', credentialsId: 'github', url: 'https://github.com/yildirayocal/Bulutdevops.git'
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    // Python commands for building your project
                    bat 'python setup.py install'  // Assuming a typical Python project structure
                }
            }
        }

        stage('Snyk Scan') {
            steps {
                script {
                    // Run Snyk scan using Python commands
                    def snykResult = bat(script: 'snyk test --json', returnStatus: true).trim()  // Adjusted for Python-based Snyk
                    def snykJson = readJSON text: snykResult

                    if (snykJson.issues.length > 0) {
                        echo "Security vulnerabilities found! Please check Snyk for details."
                        snykJson.issues.each { issue ->
                            echo "Issue: ${issue.title}"
                            echo "Severity: ${issue.severity}"
                            echo "URL: ${issue.url}"
                        }
                        error "Security vulnerabilities found! See above for details."
                    } else {
                        echo "No security vulnerabilities found."
                    }
                }
            }
        }

        stage('Check Security Issues') {
            // This stage is redundant as it performs the same actions as the 'Snyk Scan' stage
        }
    }
}
