# Panther Web Docker
The Docker file can be used to dockerize  your Panther Web applications. Also included are samples of a Panther Docker image  that can  be pulled directly using the docker pull command from [Docker Hub](https://hub.docker.com/repository/docker/prolificspanther/pantherweb).

### Usage
* Panther Web 5.53

# Prerequisites: (Required)
  * Install Docker Engine from  https://docs.docker.com/get-docker/ 
  
  Provided in Container
  * Panther 5.53
  * JDK 8
  * Linux Server(Ubuntu 20.04)
  * Tomcat.zip(included)
  * TestMigration.zip(included)
  * lynx.rpm (character mode browser, suited for Linux systems)
  * docker-entrypoint.sh (keeps Catalina and Panther App running)
  
 # Prerequisites: (Optional)
   Enable port 8080 from your host machine to access the Panther Web application from other clients.
    
 # Download the Panther Docker image:
    
   docker pull prolificspanther/pantherweb  
   
  [Deploying Panther Web Docker Image on OpenShift (video)] https://www.youtube.com/watch?v=sd8FwzTQZm4&list=PLqs5lOxsEMidwKXCOec5d_f6UXsZtuYhf&index=5)
  
 # Contents of the container:
 * JDK 8
 * Ubuntu 20.04
 * Panther Web 5.53.07 (License Incuded)
 * Tomcat (Configured)
 * Panther Servlet
 * PantherDemo.ini file for Panther Web (Configured)
 
 # How to use this Image:
   This image is designed to be used in your Panther Web Enviroment on your Ubuntu server. Installing a Panther Web Docker image should take less than 10 minutes to setup. Once    complete you will be able to run our sample testcases.
 
* Creating the container:
  docker run --name=pantherweb -p8080:8080 -d prolificspanther/pantherweb

* Enter the container:
  docker exec -ti pantherweb bash
 
  ### Panther Editor: 
  * Open the Panther Editor using the command > prodev
  
  * To Run a sample Panther client application use command > prorun mgmt (Name of Panther screen)

  ### Web Samples:
  * You may run the character mode browser to serve up a Panther html screen like this
    
    lynx localhost:8080/PantherDemo/login

  * You may access the Panther Web application from a UI browser like this. IPAddress:8080/PantherDemo/PantherDemo/login

Note: Port 8080 on your host system must be enabled to communicate externally.

# To access the image from Red Hat OpenShift:
* Create a Project
* Click on Deploy an image
* Enter image name "prolificspanther/pantherclient", specify the name of componenet.
* Click "Create".
* In Pods section, select your Pod. A new Pod window will open.
* Enter into the Pod by clicking on its name and switch to "Terminal" tab.
* Run the command( to test prodev): > "prodev"
* Run the command (to test sample Panther client app):>prorun mgmt (Name of Panther screen).
  * To serve up a Panther html sample screen  use the command below. Lynx is a character mode browser
    lynx localhost:8080/PantherDemo/login
    

## Issues
If you face any issues with this image, report them [here](https://github.com/ProlificsPanther/Docker-Panther/issues)

## Contribution
You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you begin to code, we recommend discussing your plans through a [GitHub issue](https://github.com/ProlificsPanther/Docker-Panther/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.

How to set up a Panther Servlet Web Application? [Click Here](https://github.com/ProlificsPanther/PantherWeb/releases "Named link title")

Read our Documentation [here](https://docs.prolifics.com)
