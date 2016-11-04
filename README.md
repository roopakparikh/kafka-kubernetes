# kafka-kubernetes
Running Kafka on Kubernetes as PetSet or DaemonSet with Zookeeper and KafkaManager 

The Following Repository is inspired (and contains source code) from  github.com/paulbrown/docker-kafka and github.com/paulbrown/docker-zookeeper respositories.

There are 3 applications:

## Zookeeper
The deploy and undeploy zookeeper files will deploy zookeeper as a 'PetSet' http://kubernetes.io/docs/user-guide/petset/
of 3 services
  
## Kafka Manager
Kafka Manager is based on https://github.com/sheepkiller/kafka-manager-docker and runs it as a service.
Use NodePort to export the service, without nodeport (9000) KafkaManager doesn't work correctly.
  
## Kafka
There are two ways you can deploy Kafka:

 DaemonSet: This way Kafka will scale horizontally with the clsuter (http://kubernetes.io/docs/admin/daemons/). Change the data directory in the DameonSet yaml file to map the host directory that you want to mount.
 
 a better way is to use PetSet. To setup PetSet for the production you will need to setup antiaffinity rules between Pods so that there is only one Pod per node.
 
 To test the applications simply download a KubeConfig and place under the root directory and run the corresponding bash scripts.



