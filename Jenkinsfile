def builderDocker
def CommitHash

pipeline {

    agent any

            triggers {
                pollSCM('')
            }

    parameters {
        booleanParam(name: 'RUNTEST', defaultValue: true, description: 'Toggle this value from testing')
        booleanParam(name: 'DEPLOY', defaultValue: true, description: 'Toggle this value from testing')
        choice(name: 'CICD', choices: ['CI', 'CICD Deployment', 'CICD Production'], description: 'Pick one')
    }

    stages {

        stage('Build Project') {
            steps {
                nodejs("node12") {
                    sh 'npm install'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    CommitHash = sh (script : "git log -n 1 --pretty=format:'%H'", returnStdout: true)
                    builderDocker = docker.build("silverstack19/frontend:${CommitHash}")
                }
            }
        }

        stage('Run Testing') {
            when {
                expression {
                    params.RUNTEST
                }
            }
            steps {
                script {
                    builderDocker.inside {
                        sh 'echo passed'
                    }
                }
            }
        }

        stage('Push Image') {
            when {
                expression {
                    params.RUNTEST
                }
            }
            steps {
                script {
                        builderDocker.push()
                    }       
                }
            }
        }
    }

    stage('Deploy on development') {
            when {
                expression {
                    params.DEPLOY
                }
            }
            steps {
                script {
                    sshPublisher(
                        publishers: [
                            sshPublisherDesc(
                                configName: 'Development',
                                verbose: false,
                                transfers: [
                                    sshTransfer(
                                        sourceFiles: 'docker-compose.yml',
                                        remoteDirectory: 'frontend',
                                        execCommand: 'cd frontend && docker-compose up -d',
                                        execTimeout: 120000,
                                    )
                                ]
                            )
                        ]
                    )
                }
            }
        }
        
        stage('Deploy on production') {
            when {
                expression {
            BRANCH_NAME == 'prod'
                }
            }
            steps {
                script {
                    sshPublisher(
                        publishers: [
                            sshPublisherDesc(
                                configName: 'production-server',
                                verbose: false,
                                transfers: [
                                    sshTransfer(
                                        sourceFiles: 'docker-compose.yml',
                                        remoteDirectory: 'frontend',
                                        execCommand: 'cd frontend && docker-compose up -d',
                                        execTimeout: 120000,
                                    )
                                ]
                            )
                        ]
                    )
                }
            }
        }
