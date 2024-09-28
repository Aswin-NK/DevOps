Kubernetes- Container Orchestration

Drawbacks of Docker
1.Docker->It is short life cycle as it is hosted on single host (container impacts each another due to various reason such as memory, kernal scheduling, etc....)

2.If Container got killed then Application cannot run because container doest not come up automatically it may be various reason --Auto healing) Devops Engineer cannnot monitor every time of Docker run (Docker PS)

3.Auto Scaling- to act upon increasing high load->Manual increase container or Automatically but it should support Load Balancer 

4.Docker is simple and minimal configuration which is not best suitable for big enterprise standards support.


Kubenetes basically work on concepts of Cluster- Group of Nodes 

Multi Node- Solves 1st problem of Docker if one node affect the application ie fault node then kubernetes will automatically push to seperate node.

Kubenetes controll and fix the damage - Autohealing It resolves via API Server if container goes down then new container will rollout new with unknow of enduser.

Replicaiton Controller/Deployment Controller  - YAML file normally we can mention as increase the replicas from 1 to 10 for requried usecase.
If load increase to threshold  then spin up one node (Replica) Horizontal Scaling.

Kubenetes solves the enterprise support ie containerization Orchestration platform. Normally for application in production we use Kubenetes. 100 % resolves the problem but it has community and supports which can be extended to any level and improving everyday --- Advanced loadbalancer,network.


Kubernetes Architect

Components
Control Plane---API server/etcd/scheduler/CCM
Data Plane--Kubelet/Kube Proxy/Container Runtime

One Master---Multiple Worker----Request through Master to others 

Componets of Worker nodes (Data Plane)Executing the Actions -----We will have all three components in every worker nodes in Kubernets 

1.Kubelet---->Pods (Similar to Docker Container with Advanced) in worker/Master and it is monitored by Kuberlet ie runtime responsible for pod running and informed to control plane
2.KubeProxy--->Kubernetes take care of networks (Generating IP's and Load Balancer when we have multiple replicas)
3.Container Runtime---> It will create Kubernetes interface 

Componets of Master nodes (Control Plane) Controlling the Actions
1.API Server--->Core Components- Set of instruction and incoming request handling and it is exposes to outworld other are within kubernets which is data plane.
2.Scheduler---> To schedule the pods/resources in kubernetes which are decided by API Server and accordingly scheduler will take action and run pods in which nodes.
3.etcd-----> Backup of entire cluster information as key-value.
4.Cloud Control Manager CCM----->Controller Managers (Multiple)---->Replica set---- we should have 2 compentents running and ensure running.
  Open source utility -- If kubernetes into multiple cloud platform ------ We will be writing logic in CCM 

Kubenetes in on-permsis then CCM is not required

EKS----> Kubernetes in Cloud Platform ( We have load balancer and these configuration will maintain in CCM)

Minikube,K3s,MicroK8s,Kind etc..only for development 

Kubernets in Production system and life cycle

Lifecycle ----Creation/Upgrades/Modificaiton/Deletion

Kubernets is open source and it has many disturbution like Amazon EKS, Redhat Openshift, VMware Tanzo seeking support if requried - Managed Kubernets based on license

Below Populer list 
Kubernets in Production directly seeking no support from anyone because no disturbution
Kubernets in openshift
Kubernets in Tanzo 
Kubernets in Amazon EKS----Managed and support from Amazon
AKS
GKS


KOPS & Kubeadm -----Kubernets Operations Real time projects where 100's of cluster 

Deployments 

Kubectl---->Kube config which is command line for kubernets like docker we have docker command.
eg to get nodes details : kubectl get nodes


Pods.yaml file-> command line configuration like we have in docker/ api server details/specification of containers----Standardized manner->declaration

Pods (wrapper)- can be a Single container/Multiple contianer-dependency of another container to overcome of multiple pods we can have pods with multiple container(Shared Networks,Shared storage, on local host)

Pods.yaml from Git Repo and we can come to know how kubernetes configured like cluster ip which is by kubeproxy and its specification things like volume mounts and networks ------things come easy by this manner.

For demo purpose it will create cluster on single node configuration which also be small resource like 2 GB CPU RAM 
minikube 

install Kubectl & kind for 100 cluster 

minikube start --memory=4096 --driver=hypersit default docker driver but we should not use in production as we move to advanced

Basic

minikube start Kubectl-------------->single node kubernetes cluster

Kubectl get all -A------get all details 

kubectl get nodes

Kubectl get nodes -o wide

kubectl create -f pod.yml

kubectl delete pod name 

kubectl log podname

kubectl apply -f pod.yml 

kubectl apply -f deployment.yml 

kubectl describe podname

kubectl get rs-------replica set

ssh -i <Identifier> <node ip > for cluster login.



Deployment 
Auto scaling and Auto healing are acheieved through deploy (Pod cannnot control these features) however it will create pods but not direct (via Deployment->Replica set which will be Kubernetes controller)

Pod->Deployment->Replica set->Pod------------------->Replica set which denotes no of replica based on these it will create pods automatically like auto scaling,load balancer and auto healing even pods are deleted by user unfortunetly.
Replica can be changed based on usecase to increase load or downgrade.

Deploy play major contribution in kubernetes.

Kubectl get deploy
Kubectl delete deploy <name> ------If deploy gets deleted then pods are deleted.

deployment.yml--------just like pod.yml and also it has replica details.

kubectl apply -f deployment.yml---------It will create pods and deploy.

In deployment file with replica as 2---if we try to delete pod (kubectl delete pod <name>) pod will be creating by time of terminating parallely. 

If we have multiple pods as per replica ---Request will based on no of request or user ---no of connection can pod handle.

Auto healing ->>if one pods is down then before down we will have another pod with different IP's to avoid descripency we have introduced service in Kubernetes(SVC)

Deployment->SVC (Load balancer) by kubeproxy which will forward the request to pods  -------------access the application on specific IP 

Service discovery --Labels and selectors instead of track of IP's because ip will change but labels will created according to yaml file mentioned in pod so it will keep track easily -------Metadata

Devopler can SSH into cluster then SSH into Master node and Worker node to accceess the application but for enduser service will be exposes to outerworld (outside the cluster)

Services in kubernetes inform of yml 
Type 1: Cluster IP mode ------inside the kubernetes-----cluster access (whoever can able to login Kubernetes cluster)
Type 2: Node Port mode -------inside the organization like VPC/nodes---whoever have worker node1,node2 access they can able to access the appplication.
Type 3: Loadbalancer mode-----service will be exposed to external world--->Elastic Public IP 

Application Access based on service:
Kubernetes-> Master Node -->Worker Node1-->Deploy(replica set,Pod)/SVC
                         -->Worker Node2-->Deploy(replica set,Pod)/SVC