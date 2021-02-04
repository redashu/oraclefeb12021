# Application deployment using K8s

## k8s deploy container images by creating Pod 

<img src="pod1.png">

## Pod more close 

<img src="pod2.png">

## checking minikube based k8s cluster status 

```
❯ kubectl  get  no
NAME           STATUS   ROLES                  AGE   VERSION
minikube       Ready    control-plane,master   17h   v1.20.2
minikube-m02   Ready    <none>                 24m   v1.20.2
❯ kubectl  get  nodes
NAME           STATUS   ROLES                  AGE   VERSION
minikube       Ready    control-plane,master   17h   v1.20.2
minikube-m02   Ready    <none>                 24m   v1.20.2
❯ 
❯ kubectl  get  pods
No resources found in default namespace.

```

## Pod Design format 

<img src="poddes.png">

## FIrst pod design

```
apiVersion: v1
kind: Pod
metadata:
 name: ashu-pod-1 # name of my pod
spec: # info about application
 containers:
 - image: nginx # image from docker hub 
   name: ashuc1 # name of container 
   ports: # default port of application 
   - containerPort: 80
   
```

## checking syntax 

```
❯ kubectl  apply -f ashupod1.yaml --dry-run=client
pod/ashu-pod-1 created (dry run)

```
## deploying pod 

```
❯ kubectl  apply -f ashupod1.yaml
pod/ashu-pod-1 created
❯ kubectl get po
NAME         READY   STATUS              RESTARTS   AGE
ashu-pod-1   0/1     ContainerCreating   0          15s
❯ kubectl get po
NAME         READY   STATUS    RESTARTS   AGE
ashu-pod-1   1/1     Running   0          36s
❯ kubectl get pod
NAME         READY   STATUS    RESTARTS   AGE
ashu-pod-1   1/1     Running   0          38s

```

## More info about POD 

```
❯ kubectl  describe  pod  ashu-pod-1
Name:         ashu-pod-1
Namespace:    default
Priority:     0
Node:         minikube-m02/192.168.49.3
Start Time:   Thu, 04 Feb 2021 10:31:30 +0530
Labels:       <none>
Annotations:  <none>
Status:       Running
IP:           172.17.0.2
IPs:
  IP:  172.17.0.2
Containers:
  ashuc1:
    Container ID:   docker://9fb312d9087729c1562489f04e84985cd9dc49edbccf3584dcbf2c5b626c2f1f
    Image:          nginx
    Image ID:       docker-pullable://nginx@sha256:10b8cc432d56da8b61b070f4c7d2543a9ed17c2b23010b43af434fd40e2ca4aa
    Port:           80/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Thu, 04 Feb 2021 10:32:02 +0530
    Ready:          True
    Restart Count:  0

```

## check host schedule

```
❯ kubectl get pod -o wide
NAME         READY   STATUS    RESTARTS   AGE     IP           NODE           NOMINATED NODE   READINESS GATES
ashu-pod-1   1/1     Running   0          6m13s   172.17.0.2   minikube-m02   <none>           <none>


```

## accessing container of a Pod

```
❯ kubectl  exec -it  ashu-pod-1  -- bash
root@ashu-pod-1:/# 
root@ashu-pod-1:/# cat /etc/os-release 
PRETTY_NAME="Debian GNU/Linux 10 (buster)"
NAME="Debian GNU/Linux"
VERSION_ID="10"
VERSION="10 (buster)"
VERSION_CODENAME=buster
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
root@ashu-pod-1:/# cd  /usr/share/nginx/html/
root@ashu-pod-1:/usr/share/nginx/html# ls
50x.html  index.html

```

## connecting to a particular container inside pod 

```
kubectl  exec -it  ashu-pod-1 -c ashuc1  -- bash

```

## pod delete 

```
 kubectl delete pod  ashu-pod-1
pod "ashu-pod-1" deleted

```

## auto generation of POD yaml 

```
❯ kubectl run hellopod1  --image=nginx --port 80 --dry-run=client  -o yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: hellopod1
  name: hellopod1
spec:
  containers:
  - image: nginx
    name: hellopod1
    ports:
    - containerPort: 80
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}

```

## POd generate into json format 

```
 kubectl run hellopod1  --image=nginx --port 80 --dry-run=client  -o json
{
    "kind": "Pod",
    "apiVersion": "v1",
    "metadata": {
        "name": "hellopod1",
        "creationTimestamp": null,
        "labels": {
            "run": "hellopod1"
        }
    },
    "spec": {
        "containers": [
            {
                "name": "hellopod1",
                "image": "nginx",
                "ports": [
                    {
                        "containerPort": 80
                    }
                ],
                "resources": {}
            }
        ],

```

## generate pod yaml/json and store in a file 

```
kubectl run hellopod1  --image=nginx --port 80 --dry-run=client  -o yaml  >ashupod2.yaml

```

