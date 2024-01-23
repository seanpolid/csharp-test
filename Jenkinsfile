pipeline {
	agent any
	stages {
		stage('Compile) {
			sh 'dotnet build'
		}
		stage('Unit Test') {
			sh 'dotnet test'
		}
	}
}	
