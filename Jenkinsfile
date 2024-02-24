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
        stage('Package and Release') {
            steps {
				script {
                    def packageOutput = sh(returnStdout: true, script: 'package')
                    if (!packageOutput.contains("Path:")) {
						error("An exception occurred while packaging: " + packageOutput)
					}

					def path = packageOutput.substring(packageOutput.indexOf(" "))

					def version = input(
                        message: 'Please enter the version for the release:',
                        parameters: [
                                [$class: 'ValidatingStringParameterDefinition',
                                name: 'version',
                                defaultValue: 'v',
                                regex: '^(v[0-9]+.[0-9]+||v[0-9]+.[0-9]+.[0-9]+)$']
                    ])

                    def releaseOutput = sh(returnStdout: true, script: "release --r csharp-test --k /var/jenkins/keys/csharp-test/private.pem --v ${version} --p ${path}")
					if (!releaseOutput.contains("success")) {
						error("An exception occurred while releasing:\n" + releaseOutput)
					}
				}
            }
        }
	}
}	
