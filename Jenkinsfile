pipeline {
    agent any

    environment {
        DEV_REPO = "jagadishhak/dev"
        PROD_REPO = "jagadishhak/prod"
        IMAGE_NAME = "final-project"
        IMAGE_TAG = "latest"
    }

    stages{
        stage('checkout'){
            steps{
                git url: 'https://github.com/THeInfinityPro/Devops-Final-Project.git', branch: "${BRANCH_NAME}", credentialsId: 'github-creds'
            
            }
        }

        stage('build the image'){
            steps{
                sh 'chmod +x build.sh'
                sh './build.sh'
            }
        }

        stage('pushing to dockerhub'){
            steps{
                script{
                    withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"

                        if(env.BRANCH_NAME == 'dev'){
                            sh 'docker tag final-project $DEV_REPO:$IMAGE_TAG'
                            sh 'docker push $DEV_REPO:$IMAGE_TAG'
                        }
                        else if(env.BRANCH_NAME == 'main'){
                            sh 'docker tag final-project $PROD_REPO:$IMAGE_TAG'
                            sh 'docker push $PROD_REPO:$IMAGE_TAG'
                        }
                        else{
                            echo 'branch not found in this repo'
                        }
                    }
                }
            }
        }

        stage('deploying the project'){
            steps{
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
            }
        }
    }
}


