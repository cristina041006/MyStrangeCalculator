#!groovy
pipeline {
   
   agent any
   
   stages {
      stage('Build'){
         steps {
            sh 'mvn clean package'
         }
      }
      stage('Test') {
         steps {
            sh 'mvn test'
         }
      }
      stage('Deploy') {
         steps {
            sh 'mvn install -Dmaven.test.skip=true'
         }
      }
   }
}
