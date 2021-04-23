properties([disableConcurrentBuilds()])

pipeline {
    agent {
	label 'docker||jid'
	  }
    environment {
        CONTAINER_NAME = 'docker_flask'
        IMAGE_NAME = 'jd'
    		}
    options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
        timestamps()
            }
    stages {
	stage("killing") {
            steps {
                echo " ============== killing old container =================="
                sh 'docker ps -a --filter "name=${CONTAINER_NAME}" | grep -q . && docker stop ${CONTAINER_NAME} && docker rm ${CONTAINER_NAME} && docker rmi \$(docker images -a)'
                  }
                          }
	stage("create docker image") {
            steps {
                echo " ============== start building image =================="
                sh 'docker build -t ${IMAGE_NAME} .'
                  }
                                     }
	stage("run") {
	    steps {
		echo "================run build======================"
		sh 'docker images'
		sh 'docker run --name ${CONTAINER_NAME} --restart unless-stopped -d -p 5000:5000 ${IMAGE_NAME}'
		sh 'docker ps -a'
	          }
                     }
	    }
}
