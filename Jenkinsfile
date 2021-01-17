node {
    checkout scm
    stage('Build') {
	sh './dockerbuild'
	    // This step should not normally be used in your script. Consult the inline help for details.
	  docker.withRegistry('', 'dockerhub') {
            dockerImage.push("$BUILD_NUMBER")
		  // some block
	}
    }
}
