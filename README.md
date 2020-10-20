# gmuswe645 
#Taseef Rahman & Mahbubul Alam Palash

 Google Kubernetes Engine (GKE) is used to create kuberenete cluster and the war file of assignment2 is deployed in the cluster. Then a webhook of the github repository of \
 assignment2 is created in jenkins which is configured to automatically build docker image, push built image to docker hub and the newly created docker image is deployed in 
 kubernete cluster.
 
 The step by step procedure is described below:\
 1.At first the source file is pushed to a github repository and an account in dockerhub is also created. \
 2. An amazon ec2 instance is created and docker is installed in the instance.\
 3. Then the source file of assignment2 is uploaded into ec2 instance and a docker image is created by exrending an image of tomcat server 
 4. A service account is created in google kubernete engine and a cluster has been created there and appropriate access has been given to the IAM user\
 5. Then kubectl is installed in the amazon ec2 instance. kubeconfig and security credentials files have been retrieved from GKE cluster and kept in the home directory of the\
 amazon ec2 instance.\
 6. Then deployment and serive  yaml file has been written and these two files have been used to deploy the app in the gke cluster.\
 7. Then jenkins was installed and a pipeline with github webhook was created to automotacially build and deploy application after every commit.\
 
 
A detailed guideline to install and setup has been attached in the submission namned setupinstructions.pdf 


Links of the project:

Link of the application in kubernete cluster: http://34.72.239.68/studentsurvey/

Home Page of Mahbubul Alam Palash:https://s3.us-east-2.amazonaws.com/palashgmu.com/index.html

Home page of Taseef Rahman:https://s3.amazonaws.com/trahman2.com/index.html

Project Video Link :https://drive.google.com/file/d/1c0HLNh_OV8WF899iM1Ks-0qwshDavfhO/view?usp=sharing
