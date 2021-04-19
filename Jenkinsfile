properties([disableConcurrentBuilds()])

pipeline {
    agent { 
        label 'master'
          }
    options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
        timestamps()
            }
    stages {
	stage("create docker image") {
            steps {
                echo " ============== start building image =================="
                sh 'make build '
                  }
                                     }

	stage("run") {
	    steps {
		echo "================run build======================"
		sh 'make run'
	          }
                     }
	    }
}
