pipeline {
  agent any
  tools {
     maven 'M2_HOME'
  }
  environment {
     registry = "atabonglefac/devops_pipeline"
     registryCredential = 'DockerID'
    withCredentials([usernamePassword(credentialsId: '828c6691-e942-4211-a1c5-d2724a5474ac', passwordVariable: 'Fagicngo12345', usernameVariable: 'atabonglefac')]) {
    // some block
}
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
  }
}
