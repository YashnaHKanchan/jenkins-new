// pipeline {
//     agent any
 
//     environment {
 
//         // SCANNER_HOME = tool 'sonar-scanner'
       
//         DOCKERFILE_PATH = 'C:\\Users\\YashnaHKanchan\\Jenkins-new\\nginx\\Dockerfile' // Update this with your Dockerfile path
//         // DOCKER_IMAGE_TAG = 'keer:latest' // Update with your desired image name and tag
//         DOCKER_IMAGE_NAME = 'jenkins-new'
//         // DOCKER_IMAGE_TAG = 'latest'  
//         REGISTRY_IMAGE = "docker.io/yashnah/jenkins-new:v1"
//         SONAR_PROJECT_KEY = 'new-sonar-key'
//         // DOCKER_REGISTRY = 'https://hub.docker.com/r/rakshashenoy/keer'
//         registryCredential = 'docker-cred'
//         // ARGO_ADMIN = "credentials('argo-cred').username"
//         // ARGO_PASS = "credentials('argo-cred').password"
//         // ARGOSERVER = "http://localhost:9000"
     
//     }
 
//     stages {
//     //     stage('SonarQube Scan') {
//     //         steps {
//     //             script{
//     //                 // def props = readProperties file: 'sonar-project.properties'
//     //                 withSonarQubeEnv('sonar-scanner') {
//     //                     bat "${SCANNER_HOME}/bin/sonar-scanner -Dsonar.projectKey=${SONAR_PROJECT_KEY}"
 
//     //                 }
//     //             }
//     //         }
//     //     }
//         stage('Build Docker Image') {
//             steps {
//                 script {
//                     // Build Docker image using Docker Pipeline plugin
//                     // dockerImage = docker.build("${DOCKER_IMAGE_TAG}", "-f ${DOCKERFILE_PATH} .")
//                     bat "docker build -t ${DOCKER_IMAGE_NAME} ."
//                     bat "docker images"
//                     //docker.tag dockerImage:latest docker.io/rakshashenoy/keer:latest
//                     // docker.tag(dockerImage, 'rakshashenoy/samplerepo/keer:latest')
 
//                 }
//             }
//         }
 
//         stage('Push Docker Image') {
//             steps {
//                 script {
//                     // Build Docker image using Docker Pipeline plugin
//                     docker.withRegistry( 'https://docker.io', registryCredential) {
//                      // Tag the Docker image
//                     bat "docker tag ${DOCKER_IMAGE_NAME} ${REGISTRY_IMAGE}"
//                     // dockerImage.push()
//                     // bat "docker push rakshashenoy/keer:tagname"
//                     // bat "docker push ${dockerImage}"
//                     bat "docker push ${REGISTRY_IMAGE}"
//                     }
//                 }
//             }
//         }
//     }
// }


pipeline {
    agent any

    environment {
        DOCKERFILE_PATH = 'C:\\Users\\YashnaHKanchan\\Jenkins-new\\nginx\\Dockerfile' // Path to your Dockerfile
        DOCKER_IMAGE_NAME = 'jenkins-new'  // Name of your Docker image
        REGISTRY_IMAGE = "docker.io/yashnah/jenkins-new:v1"  // Full Docker registry image and tag
        registryCredential = 'docker-cred'  // ID of Docker registry credentials stored in Jenkins
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image using bat (Windows command) to run Docker CLI
                    bat "docker build -t ${DOCKER_IMAGE_NAME} -f ${DOCKERFILE_PATH} ."
                    bat "docker images"  // List Docker images for verification
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Use Docker credentials to log in and push the image
                    docker.withRegistry('https://docker.io', registryCredential) {
                        // Tag the Docker image with the full registry path
                        bat "docker tag ${DOCKER_IMAGE_NAME} ${REGISTRY_IMAGE}"
                        // Push the tagged image to Docker Hub
                        bat "docker push ${REGISTRY_IMAGE}"
                    }
                }
            }
        }
    }
}
