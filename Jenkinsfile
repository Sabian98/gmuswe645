pipeline{
	agent any 
	environment{
		registry = "gmu645/studentsurvey"
		DOCKERHUB_PASS = "soulmate.com"
		 unique_Id = UUID.randomUUID().toString()
		//GOOGLE_APPLICATION_CREDENTIALS    = 'gsa-key.json'
		//env.GOOGLE_APPLICATION_CREDENTIALS=GOOGLE_APPLICATION_CREDENTIALS
	}
	stages{
		stage("Building jar"){
			steps{
				script{
					checkout scm
					sh 'rm -rf *.war'
					sh 'jar -cvf studentsurvey.war -C studentssurvey/WebContent/ .'
					sh 'echo ${BUILD_TIMESTAMP}'
					sh 'docker login  -u gmu645 --password-stdin < ~/my_password '
					def customimage=docker.build("gmu645/studentsurvey:${BUILD_ID}")
					//sh 'export GOOGLE_APPLICATION_CREDENTIALS=gsa-key.json'
					 //env.GOOGLE_APPLICATION_CREDENTIALS=GOOGLE_APPLICATION_CREDENTIALS
					sh '$pwd '
					
			}

		}

	}
	stage("Pushing image to DockerHub"){
		steps{
			script{
				sh 'docker push gmu645/studentsurvey:${BUILD_ID}'
			}
		}
	}
		
	/*stage(' Deploying to GKE as single pod'){
		steps{
			//sh ' kubectl set image  container/student student=gmu645/studentsurvey645:${BUILD_ID} -n swe645'
			sh  "chmod +x deploy.sh"
			sh "./deploy.sh :${BUILD_ID} "
			sshagent(['kubectl']){
			sh "scp -o StrictHostKeyChecking=no deployment.yaml ubuntu@3.133.95.91:/home/ubuntu/"
				script{
				
					try{
						sh "ssh ubuntu@3.133.95.91 kubectl apply -f ."
					}
					catch(error){
						sh "ssh ubuntu@3.133.95.91 kubectl create -f ."
					}
				
				}
				
			}
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
