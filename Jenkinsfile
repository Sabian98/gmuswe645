/* Submitted by #Taseef Rahman & Mahbubul Alam Palash
Jenkins file for building application using Docker & Deploying them in Google Kubernete Engine Cluster
*/
pipeline{
	agent any 
	environment{
		registry = "gmu645/studentsurvey"
		DOCKERHUB_PASS = "soulmate.com"
		 unique_Id = UUID.randomUUID().toString()
		GOOGLE_APPLICATION_CREDENTIALS    = 'gsa-key.json'
		
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
					def customimage=docker.build("gmu645/studentsurvey:${BUILD_ID}.${unique_Id}")
					

					
			}

		}

	}
	stage("Pushing image to DockerHub"){
		steps{
			script{
				sh 'docker push gmu645/studentsurvey:${BUILD_ID}.${unique_Id}'
			}
		}
	}
		
	stage(' Deploying updated image to GKE'){
		steps{
			sh ' kubectl set image  deployment/swe645final student=gmu645/studentsurvey:${BUILD_ID}.${unique_Id}'
			
		}

	}

}




}
