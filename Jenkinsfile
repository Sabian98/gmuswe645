pipeline{
	agent any 
	environment{
		registry = "gmu645/studentsurvey"
		DOCKERHUB_PASS = "soulmate.com"
		 unique_Id = UUID.randomUUID().toString()
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
					def customimage=docker.build("gmu645/studentsurvey:${BUILD_ID}")
			}

		}

	}
	stage("Pushing image to DockerHub"){
		steps{
			script{
				sh ' kubectl set image deploy/swe645final student=studentsurvey:${BUILD_ID}'
			}
		}
	}
		
	stage(' Deploying to GKE as single pod'){
		steps{
			sh ' kubectl set image -n swe645  student=gmu645/studentsurvey645:${BUILD_ID}'
		}

	}
		/*
	stage(' Deploying to GKE as with Load balancer'){
		steps{
			sh 'kubectl set image deployment/studentsurvey645-lb studentsurvey645-lb=hekme5/studentsurvey645:${BUILD_TIMESTAMP} -n jenkins-pipeline'
		}
	}
*/
}




}
