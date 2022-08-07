pipeline {
  agent any
  tools {
     maven 'M2_HOME'
  }
  environment {
     registry = "atabonglefac/devops_pipeline"
     registryCredential = 'darinpope-dockerhub'
  }
  stages {
    stage('Build'){
      steps {
       sh 'mvn clean'
       sh 'mvn install'
       sh 'mvn package'
     }
   }
    stage('test'){
      steps {
       echo "test step"
       sh 'mvn test'
     }
   }
    stage('deploy'){
      steps {
      script {
       docker.build registry + ":$BUILD_NUMBER"
      }
     }
   }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        script {  
        sh docker.push  registry + ":$BUILD_NUMBER"
      }
    }
   }
  }
 }
}
