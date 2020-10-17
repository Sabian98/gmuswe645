pipeline{
	agent any 
	environment{
		registry = "gmu645/studentsurvey"
		registryCredential = 'dockerhub'

	}
	stages{
		stage("Building jar"){
			steps{
				script{
					checkout scm
					sh 'rm -rf *.war'
					sh 'jar -cvf studentsurvey.war -C studentssurvey/WebContent/ .'
					sh 'echo ${BUILD_TIMESTAMP}'
					sh 'docker login  -u gmu645 -p ${DOCKERHUB_PASS} '
					def customimage=docker.build("gmu645/studentsurvey:${BUILD_TIMESTAMP}")
			}

		}

	}
/*	stage("Pushing image to DockerHub"){
		steps{
			script{
				sh 'docker push gmu645/studentsurvey:${BUILD_TIMESTAMP}'
			}
		}
	}
	stage(' Deploying to GKE as single pod'){
		steps{
			sh 'kubectl set image deployment/stusurvey-pipeline stusurvey-pipeline=hekme5/studentsurvey645:${BUILD_TIMESTAMP} -n jenkins-pipeline'
		}

	}
	stage(' Deploying to GKE as with Load balancer'){
		steps{
			sh 'kubectl set image deployment/studentsurvey645-lb studentsurvey645-lb=hekme5/studentsurvey645:${BUILD_TIMESTAMP} -n jenkins-pipeline'
		}
	}
*/
}




}
