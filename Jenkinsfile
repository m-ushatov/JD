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
		       ssh docker@192.168.0.104 cd /home/docker/myproject2/JD/ | docker build -t jd .
                       ssh docker@192.168.0.104 docker images
                       ssh docker@192.168.0.104 docker run --restart unless-stopped -d -p 5000:5000 jd
                       ssh docker@192.168.0.104 docker ps
               '''
		  }
			    }
	    }
}
