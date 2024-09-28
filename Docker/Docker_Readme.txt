Containerization -----Docker --DockerStim (Runtime)

To overcome of VM we introduced Docker such as images,container

Advantage: Lightweight,Workflow reduction,Efficiency 

VM is shared resources of physical server i.e host operation system to avoid more amount of wastage resources such as RAM,Storage,CPU etc.... [VM has Seperate OS as guest operating system and Apps]
It is has security as they have seperate OS but has some drawbacks because OS consume some resources (Dependency) to overcome we get into Docker (Minimal base configuration+System configuration+Libiaries for applications)

We can have Docker platform over VM and Physical server as well.

Docker is very lightweight,easy to ship to different platform but SPOF due to large amount of layers to make container then our all container fails to overcome it we have Buildah (commands). Docker will not have seperate OS guest OS but they will share from Host Operation system.It does not have seperarte file system .

Docker file(Set of commands,instruction) ---->Images ---->Containers (Application)--->Docker Engine --------Registry 

We create docker file using commands and execute the file to build images and run those to get Containers, executes in Docker Platform Engine


Logical Isolation -> System dependency 

As we have minimal configuration for all application which will shared from Docker, Kernal(OS) should have logical isolation 
Eg : App 1 should not have communication to App 2 even both are in seperate container (Security violation) 

Seperate Contianer Base Images 

### Files and Folders in containers base images

```
    /bin: contains binary executable files, such as the ls, cp, and ps commands.
    /sbin: contains system binary executable files, such as the init and shutdown commands.
    /etc: contains configuration files for various system services.
    /lib: contains library files that are used by the binary executables.
    /usr: contains user-related files and utilities, such as applications, libraries, and documentation.
    /var: contains variable data, such as log files, spool files, and temporary files.
    /root: is the home directory of the root user.


### Files and Folders that containers use from host operating system
    The host's file system: Docker containers can access the host file system using bind mounts, which allow the container to read and write files in the host file system.
    Networking stack: The host's networking stack is used to provide network connectivity to the container. Docker containers can be connected to the host's network directly or through a virtual network.
    System calls: The host's kernel handles system calls from the container, which is how the container accesses the host's resources, such as CPU, memory, and I/O.
    Namespaces: Docker containers use Linux namespaces to create isolated environments for the container's processes. Namespaces provide isolation for resources such as the file system, process ID, and network.
    Control groups (cgroups): Docker containers use cgroups to limit and control the amount of resources, such as CPU, memory, and I/O, that a container can access.
    
```

Lightweight 

Ubuntu base machine- aroung 2.5 GB
Ubuntu Docker Base Image - 28 MB which Linux amd64 24 MB which is linux arm v

Instead of one VM we can run around 100 containers just an exaample and it is based on configuration of Container usecase 


#### What is a container ?

A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. A Docker container image is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries and settings.

Ok, let me make it easy !!!
A container is a bundle of Application, Application libraries required to run your application and the minimum system dependencies.

#### What is Docker ?

Docker is a containerization platform that provides easy way to containerize your applications, which means, using Docker you can build container images, run the images to create containers and also push these containers to container regestries such as DockerHub, Quay.io and so on.

In simple words, you can understand as `containerization is a concept or technology` and `Docker Implements Containerization`.

#### Docker LifeCycle 

There are three important things,
1. docker build -> builds docker images from Dockerfile
2. docker run   -> runs container from docker images
3. docker push  -> push the container image to public/private regestries to share the docker images.

#### Docker daemon

The Docker daemon (dockerd) listens for Docker API requests and manages Docker objects such as images, containers, networks, and volumes. A daemon can also communicate with other daemons to manage Docker services.

#### Docker client

The Docker client (docker) is the primary way that many Docker users interact with Docker. When you use commands such as docker run, the client sends these commands to dockerd, which carries them out. The docker command uses the Docker API. The Docker client can communicate with more than one daemon.

#### Docker Desktop

Docker Desktop is an easy-to-install application for your Mac, Windows or Linux environment that enables you to build and share containerized applications and microservices. Docker Desktop includes the Docker daemon (dockerd), the Docker client (docker), Docker Compose, Docker Content Trust, Kubernetes, and Credential Helper. For more information, see Docker Desktop.

#### Docker registries

A Docker registry stores Docker images. Docker Hub is a public registry that anyone can use, and Docker is configured to look for images on Docker Hub by default. You can even run your own private registry.

When you use the docker pull or docker run commands, the required images are pulled from your configured registry. When you use the docker push command, your image is pushed to your configured registry.
Docker objects

When you use Docker, you are creating and using images, containers, networks, volumes, plugins, and other objects. This section is a brief overview of some of those objects.

#### Dockerfile  Set of instruction using commands 

Dockerfile is a file where you provide the steps to build your Docker Image. 

#### Images

An image is a read-only template with instructions for creating a Docker container. Often, an image is based on another image, with some additional customization. For example, you may build an image which is based on the ubuntu image, but installs the Apache web server and your application, as well as the configuration details needed to make your application run.

You might create your own images or you might only use those created by others and published in a registry. To build your own image, you create a Dockerfile with a simple syntax for defining the steps needed to create the image and run it. Each instruction in a Dockerfile creates a layer in the image. When you change the Dockerfile and rebuild the image, only those layers which have changed are rebuilt. This is part of what makes images so lightweight, small, and fast, when compared to other virtualization technologies.

# Docker Commands

Some of the most commonly used docker commands are 

### docker images

Lists docker images on the host machine.

### docker build

Builds image from Dockerfile.

### docker run-----------------------> -it - interactive with tags/-p port mapping/-v mount volume/-network in command line 

Runs a Docker container. 

There are many arguments which you can pass to this command for example,

`docker run -d` -> Run container in background and print container ID
`docker run -p` -> Port mapping

use `docker run --help` to look into more arguments.

### docker ps

Lists running containers on the host machine.

### docker stop

Stops running container.

### docker start

Starts a stopped container.

### docker rm

Removes a stopped container.

### docker rmi

Removes an image from the host machine.

### docker pull

Downloads an image from the configured registry.

### docker push

Uploads an image to the configured registry.

### docker exec

Run a command in a running container.

### docker network

Manage Docker networks such as creating and removing networks, and connecting containers to networks.



We should have root permission which we can run docker limitation- as it is monolithic process

sudo apt update
sudo apt install docker.io -y

sudo usermod -aG docker ubuntu

sudo systemctl start docker

### Docker login 
docker login
docker run hello-world

### Docker Build 
docker build -t abhishekf5/my-first-docker-image:latest .

### Verify Docker Image is created
docker images


### Run your First Docker Container
docker run -it abhishekf5/my-first-docker-image

### Push the Image to DockerHub and share it with the world
docker push abhishekf5/my-first-docker-image

### Pull the Image from  DockerHub and save int local 
docker pull abhishekf5/my-first-docker-image

### Verify Docker Image is created
docker images

docker inspect <Container name>

###Docker Container Details 

docker volume ls ------Docker Volume Description
docker volume rm 

docker network ls ------Docker Networks
docker network rm 

Multi stage where stages will be countless to reduce image size (Final stage is with minimal configuration - main motive)

eg : 

Stage 1- Front end configuration (install the depenency and make entry point do not cmd )
Stage 2- Back end configuration (do copy from stage 1 and install the depenency and make another entry point do not cmd as well)
Stage 3- Final Stage (do copy from stage 2 and install the depenency and do cmd) -------final image

docker build -t abhishekf5/my-first-docker-image:latest . ---------------->creating the images
docker run -it abhishekf5/my-first-docker-image -------------------------->Creating the containers
docker push abhishekf5/my-first-docker-image
docker pull abhishekf5/my-first-docker-image


distroless images----->Very minimal configuration 

eg for python it requrie python run time environment where developer written code in python environment and normally we should have basic OS configuration
distroless images will have only final requirement ie only python environment even it will not have basic packages and it leads to very small in size and secuirty is high level does not expose to os vulerabiltiy and others .

Advanced 
Golang is static and do not require any run time environment


From Scratch ------->very minimal system dependency

Volumes and Bind Mounts- Persistance storage for docker

Problem
If container failes then we cannot able to get logs - details which are present in container as it verylight in nature hence it is empherial-short life cycle.

Backend container stores files and that will be served to Frontend container, if backend fails then frontend container cannnot retrieve the old data due to container failed. To overcome these we should have seperate file system.

Application cannot able to read files from host system - as docker container cannot able to interacts the directories in host system.

Bind Mounts & Volumes	
Bind Mounts - Binding the specific directories on the host to the container on specific directories.
Volume - Using Docker CLI we can play around volumes (Logical Partition on host) Create/Destroy andalso we can use same volume across multiple contianer. Better lifecycle and we have extra options on external sources such as s3,ec2,efs...Performance definition.

docker -v <source destination> , , with modes.
docker --mount ---->more verbose than volume easy understand

docker volumes ls 
docker volume create aswin ----Volume created as logical in host
docker volume inspect aswin----Volume description as were they created and its details---creation,drivers,mountpoints,name,scope
docker volume rm aswin---------Volume deletion and multiple volume deletion in single command and we should stop the container before deletion
docker run -d --mount source aswin target=/app <image details> -------- d represent container in deattach mode
docker inspect <Container name>	

Docker Networks--- create the networks by docker network command and pass the arguments while creating the container by docker run

Basically networking allow the interaction between the contianers and the host system. Contianer should have seperate isolation even they shared on single host.

Bridge Networking:By default Contianer itself will create Bridge network between contianer and host as virtually- they were separate networks for contianer and host - vetho

Host Networking: Container uses the host networking - it bind the container directly on host etho--same networks-----whoever having access on host can access the application as they fall in same networks. 

Overlay Networking: Kubernertes and docker swarm--------Container orhestation -----Multiple host.

Container 1 interacts with Container 2----->By default container creation it will create docker etho networks as vetho for both contianer.
Container 1 isolated from Container 2---> Own Custome Bridge Networks to communicate to host so we dont see common connection between both containers as etho (vetho) to host(Container 1 will interact with host by etho- veth & Container 2 will interact with host by Custome Bridge Network).

Examples:
docker run -d --name container1 image1
docker exec - it container1 /bin/bash--------To login the container.
apt update ////// apt-get install iputils-ping -y

docker run -d --name container2 image1

Above both contianer will have default bridge network etho - vetho so they can ping each other 

docker run -d --name container3 --network=secure-network image1---------> Bridge secure network passing  

Container 3 will create the seperate network as we create seperate bridge network for isolation.

docker run -d --name container4 --network=host image1--------------------> host network passing ----common networks between host and container--no custome ip.

Docker Compose ---Tools docker inc----yaml file->docker-compose.yaml
 Used to manage multi container application
   For eg: If we have E-Commerce Application we should have different container for Python Application,Python_login,Python_Logout,Database,Transactions..using docker run -----Seprate Container for each with dependency  as best practices 

Background information in compose file as standard platform. It will build and run the containers for build it looks for docker file so docker compose is not an alernate for docker.

docker-compose up
docker-compose down


Advantage

Local Developement
CICD Deployment
Testing


#######################################################################