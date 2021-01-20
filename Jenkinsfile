node {
    checkout scm
    stage('Build') {
	sh './dockerbuild'
	    // This step should not normally be used in your script. Consult the inline help for details.
	  docker.withRegistry('', 'dockerhub') {
            sh "docker push kushwap1/blog-v1.0:$BUILD_NUMBER"
	    sh "docker image rm -f kushwap1/blog-v1.0:$BUILD_NUMBER"
	    sh "kubectl set image deployment blog-nodejs-deployment blog-v1="
		  // some block
		  sshagent(['cloud_user']) {
                    //To run a remote ssh command you will need to setup ssh keys (https://www.digitalocean.com/community/tutorials/how-to-configure-ssh-key-based-authentication-on-a-linux-server)
                    sh "ssh -o StrictHostKeyChecking=no cloud_user@172.31.27.92 -C \"kubectl set image deployment blog-nodejs-deployment blog-v1=kushwap1/blog-v1.0:$BUILD_NUMBER --record\""
                }
	}
    }
}
