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
	stage("killing old container") {
            steps {
                echo " ============== killing old container =================="
                sh '''docker kill ${CONTAINER_NAME} || true && docker rm ${CONTAINER_NAME} || true && docker rmi ${IMAGE_NAME} || true'''
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
		sh '''
			docker images
			docker run --name ${CONTAINER_NAME} --restart unless-stopped -d -p 5000:5000 ${IMAGE_NAME}
			docker ps -a
		   '''
		echo "==================YPA!========================"
	          }
                     }
	    }
}
