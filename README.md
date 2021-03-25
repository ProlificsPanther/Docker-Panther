# Panther Web Docker
Provided is a Docker file that can be used to dockerize  your Panther Client application. Also included are samples of a Panther Docker image  that can  be pulled directly using the docker pull command from [Docker Hub](https://hub.docker.com/repository/docker/prolificspanther/pantherweb).

### Usage
* Panther Web 5.5*

# Prerequisites: (Required)
  * Install Docker Engine from  https://docs.docker.com/get-docker/ 
  
  Provided in Container
  * Panther 5.5*
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
   
 # Contents of the container:
 * JDK 8
 * Ubuntu 20.04
 * Panther Web 553.07 (License Inclusive)
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
  * Open the Panther Editor using the command
  prodev

  ### Web Samples:
  * You may run the character mode browser to serve up a Panther html screen like this
  
    lynx localhost:8080/PantherDemo/login
    OR
    lynx localhost:8080/PantherDemo/orders
    OR
    lynx localhost:8080/PantherDemo/customer
  
  * You may accees the Panther Web application from a UI browser like this. <IP>:8080/PantherDemo/PantherDemo/login

Note: Port 8080 on your host system must be enabled to communicate externally.

# To access the image from Openshift:
1) Create a Project
2) Click on Deploy an image
3) Search for "prolificspanther/pantherweb", specify the name.
4) Click "Deploy".
5) Go to the Pods section, as soon as it changes from "Creating container" to "Running", enter into the Pod and switch to "Terminal" tab.
6) Open the Panther Editor using the command
  prodev
7) To serve up a Panther html screen   use the command below. Lynx is a character mode browser
lynx localhost:8080/PantherDemo/PantherDemo/login
OR
lynx localhost:8080/PantherDemo/PantherDemo/orders
OR
lynx localhost:8080/PantherDemo/PantherDemo/customer

## Issues
If you face any issues with this image, report them [here](https://github.com/ProlificsPanther/Docker-Panther/issues)

## Contribution
You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you begin to code, we recommend discussing your plans through a [GitHub issue](https://github.com/ProlificsPanther/Docker-Panther/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.

How to set up a Panther Servlet Web Application? [Click Here](https://github.com/ProlificsPanther/PantherWeb/releases "Named link title")

Read our Documentation [here](https://docs.prolifics.com)
