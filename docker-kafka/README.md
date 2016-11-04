# Kafka in a Kubernetes PetSet

These are the things you need to run a Kafka cluster on Kubernetes. Its based on the Confluent version of Kafka.

For Kafka to work, it requires access to a zookeeper cluster. Currently in the onStart script this is set to a kubernetes zookeeper service called 'zookeeper'. You can take a look at the zookeeper kubernetes setup here (https://github.com/paulbrown/docker-zookeeper).

### Deployment
This example has been deployed and tested using a local Minikube setup.

Minikube is a tool that makes it easy to run Kubernetes locally. Minikube runs a single-node Kubernetes cluster inside a VM on your laptop for users looking to try out Kubernetes or develop with it day-to-day.

Minikube packages and configures a Linux VM, Docker and all Kubernetes components, optimized for local development. Minikube supports Kubernetes features such as:
- DNS
- NodePorts
- ConfigMaps and Secrets
- Dashboards

Deploying onto a Kubernetes cluster is fairly easy. There are example kubernetes Service and Pet Set files in the [kube/](kube/) directory.

A Pet Set is a group of stateful pods that require a stronger notion of identity. The goal of Pet Set is to decouple this dependency by assigning identities to individual instances of an application that are not anchored 
to the underlying physical infrastructure. 

A Pet Set requires there be {0..N-1} Pets. Each Pet has a deterministic name (PetSetName-Ordinal), and a unique identity. Each Pet has at most one pod, and each Pet Set has at most one Pet with a given identity.

A Pet Set ensures that a specified number of “pets” with unique identities are running at any given time. The identity of a Pet is comprised of:
- a stable hostname, available in DNS
- an ordinal index
- stable storage: linked to the ordinal & hostname

Clustered software like Kafka suits itself well for a Pet Set as it relies on stable DNS names for discovery of peers.

Please read Kubernetes Reference Documentation (http://kubernetes.io/docs/user-guide/petset/) regarding limitations for the Pet Set alpha release.

#### Deploy Persistent Volumes
Pet Sets require the backing of some persistent storage. This command creates some storage volumes for each of the “pets”. Normally persistent volumes would be provisioned automatically in your cloud environment, however here we're just using local HostPath directories. 

```bash
$ kubectl create -f kube/kafka-volumes.yaml
```
kafka-0 and kafka-1 persistent volumes should be created successfully. This will be enough the cater for 2 kafka replicas/brokers.

#### Deploy Services
Each Pet Set must expose a headless service.

```bash
$ kubectl create -f kube/kafka-service.yaml
```

#### Deploy PetSet
This command will create a PetSet and deploy the number of replicas specified. At present replicas can only be scaled through editing the PetSet configuration directly by changing the replicas field, or deleting and recreating the PetSet with an altered replica configuration value. Please be sure you have the required persistent storage volumes available to match the number of replica pods.

```
$ kubectl create -f kube/kafka-petset.yaml
```

### ToDo
- Make the population of the config value for the zookeeper service more dynamic and not hard coded in the onStart script. It could be as easy as passing in the service name as an environment variable as part of the kafka-petset kubernetes yaml file. This can then be set in the kafka properties file before start.
