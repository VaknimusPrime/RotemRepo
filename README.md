# RotemRepo
artlist.io home assignment

Instructions: 

install a local k8s Cluster with mini kube.

Run: 
```
kubectl config view | grep server
```
from the result, take the address and add it to the host field on the provider.tf file

installing mysql DB.
```
docker run --name mysql -e MYSQL_ROOT_PASSWORD=RootPass -e MYSQL_DATABASE=rotem -e MYSQL_USER=rotem -e MYSQL_PASSWORD=RotemPass -p 3306:3306 -p 33060:33060 -d mysql:latest
```
Due to an issue on MySQL version 8.0 and above, we need to run the following queries on mysql container.  Please follow these instructions:  
Connect to Docker:
```
docker exec -it mysql sh
```

run:
```
mysql -u root -p
```
```
Enter password: RootPass
```
```
mysql> ALTER USER 'root' IDENTIFIED WITH mysql_native_password BY 'RootPass';
```
```
mysql> FLUSH PRIVILEGES;
```
Exit the docker


Running terraform.  Don't forget to add your machine's IP address
```
terraform apply -var="mysql_host=<your_machine's_IP_address>"
```