**Pre-requisites**

1. Signup to Jfrog cloud free 14 days trail https://jfrog.com/start-free/
2. Create a remote maven repository to resolve dependencies
   a) use the repo url https://repo1.maven.org/maven2/ to download required maven dependecies
3. Create a docker local repository to push the docker image
4. Install Jenkins (https://learn.microsoft.com/en-us/azure/developer/jenkins/configure-on-linux-vm)
5. Configure Maven latest in the global settings
6. Configure docker for building and pushing the images

**Create Pipeline**

1. Create a declarative pipeline in Jenkins 
2. Select the ‘Pipeline Script SCM and leave the script path to default / Jenkinsfile
3. Save the pipeline and exit

**Update Maven global settings** 

1. Go to remote repository created in Jfrog and click on Set Me Up
2. Generate the token and settings
3. Go to Jenkins server then go to 'maven_home/conf' location and update the settings.xml based on the previous step
4. Now maven build is ready to pick the remote dependencies

**Results**

1. Run the pipeline
2. Pipeline will Clone —> Compile —> Test —> Package the jar
3. Once the Jar is created pipleline will continue to Build Docker Image —> Push that to JFrog Artificatory
4. Upon successfull run you will see the docker image uploaded to your JFrog Artifactory
   (**Image Name:** assesment1.jfrog.io/docket-petclinic-docker-local/docker-local:latest)
