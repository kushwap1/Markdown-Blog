node {
    checkout scm
    stage('Build') {
	sh './dockerbuild'
	    // This step should not normally be used in your script. Consult the inline help for details.
	  withDockerRegistry(credentialsId: 'dockerhub', url: 'https://hub.docker.com') {
            sh './dockerpush'
		  // some block
	}
    } 
}
