pipeline {
	agent any
	stages {
		stage('Compile') {
			steps {
				sh 'dotnet build'
			}
		}
		stage('Unit Test') {
			steps {
				sh 'dotnet test'
			}
		}
        stage('Package') {
            steps {
                sh 'pwd'
            }
        }
	}
}	
