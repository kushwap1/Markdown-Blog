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
        sshagent (credentials: ['Kube_master']) {
          sh 'ssh -o StrictHostKeyChecking=no -l cloud_user 172.31.29.238 kubectl set image deployment blog-nodejs-deployment blog-v1=kushwap1/blog-v1.0:$BUILD_NUMBER'
         }
       }
    }
}
