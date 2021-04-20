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
	stage("connecting") {
	    steps {
		echo "================connecting to DockerVM=================="
		sh 'ssh docker@192.168.0.105'
		  }
			    }
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
