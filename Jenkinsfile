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
					def sout = new StringBuilder()
                    def serr = new StringBuilder()
                    
                    def command = 'package'
                    def process = command.execute()
                    
                    process.consumeProcessOutput(sout, serr)
                    process.waitForOrKill(1000)
                    
                    def standardOutput = sout.toString()
                    def file = new File(standardOutput)

                    if (!file.exists()) {
						error("An exception occurred while packaging: " + standardOutput)
					}

					def version = input(
                        message: 'Please enter the version for the release:',
                        parameters: [
                                [$class: 'ValidatingStringParameterDefinition',
                                name: 'version',
                                defaultValue: 'v',
                                regex: '^(v[0-9]+.[0-9]+||v[0-9]+.[0-9]+.[0-9]+)$']
                    ])

                    sh "release --v ${version} --p ${standardOutput} --r csharp-test" 
				}
            }
        }
	}
}	
