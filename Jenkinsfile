properties([disableConcurrentBuilds()])

pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
        timestamps()
            }
    stages {
	stage("connecting") {
	    steps {
		echo "================connecting to DockerVM=================="
		sh '''
		       ssh docker@192.168.43.57 cd /home/docker/myproject2/JD
                       ssh docker@192.168.43.57 docker build -t jd .
                       ssh docker@192.168.43.57 docker images
                       ssh docker@192.168.43.57 docker run --restart unless-stopped -d -p 5000:5000 jd
                       ssh docker@192.168.43.57 docker ps
               '''
		  }
			    }
	    }
}
