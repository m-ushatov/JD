properties([disableConcurrentBuilds()])

pipeline {
    agent {
	label 'docker||jid'
	  }
    options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
        timestamps()
            }
    stages {
	stage("killing") {
            steps {
                echo " ============== killing old container =================="
                sh """
			if [ docker ps | wc -l == 1 ]
  				then
   	 			docker kill docker_flask
			fi
		"""
		sh 'docker rm docker_flask'
		sh 'docker rmi jd'
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
		sh 'docker run --name docker_flask --restart unless-stopped -d -p 5000:5000 jd'
		sh 'docker ps -a'
	          }
                     }
	    }
}
