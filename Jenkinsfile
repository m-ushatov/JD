properties([disableConcurrentBuilds()])

pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
        timestamps()
            }
    stages {
	stage("create docker image") {
            steps {
                echo " ============== start building image =================="
                sh 'docker build -t jd .'
                  }
                                     }

	stage("run") {
	    steps {
		echo "================run build======================"
		sh 'docker images'
		sh 'docker run --restart unless-stopped -d -p 5000:5000 jd'
		sh 'docker ps'
	          }
                     }
	    }
}
