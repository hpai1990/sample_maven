node('kratos'){
    
	stage 'Checkout'
 		checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '1ab09c9e-36aa-4285-b73c-7e4d36675372', url: 'https://github.com/hpai1990/sample_maven/']]])

	stage 'Build'
  		sh 'mvn clean install'
  		
	stage 'Docker Publish Approval'
		timeout(time:5, unit:'DAYS') {
    	input message:'Approve Docker publish?'
	}
	stage 'Build & publish Docker image'
   		step([$class: 'DockerBuilderPublisher', cleanImages: false, cleanupWithJenkinsJobDelete: false, cloud: 'Docker Colony 2', dockerFileDirectory: '', pullCredentialsId: '', pushCredentialsId: '', pushOnSuccess: false, tagsString: 'realpipeline:latest'])
}