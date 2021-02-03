# Container based application problems

<img src="cprob.png">

## COntainer orchestration engines 

<img src="corch.png">

## kubernetes 

<img src="hist.png">

## kubernetes deployment / services offering 

<img src="k8s.png">

## Simplest arch of k8s (L1)

<img src="karch1.png">

##  k8s Master node components (L2)

<img src="karch2.png">

## All required master node components. (L3)


<img src="karch3.png">


# Mininode Discussion 

## CNI (Container network interface)

[CNI](https://github.com/containernetworking/cni)

## Minion Node CNI [L1]

<img src="cni.png">

## Minion Node [kubelet & kube-proxy ]

<img src="kmin.png">


# K8s cluster setup options 

<img src="setup.png">

## INstalling minikube on Mac 

```
❯ curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
sudo install minikube-darwin-amd64 /usr/local/bin/minikube

  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 52.6M  100 52.6M    0     0  6200k      0  0:00:08  0:00:08 --:--:-- 7690k
Password:
❯ minikube version
minikube version: v1.17.1
commit: 043bdca07e54ab6e4fc0457e3064048f34133d7e


```

## MInikube download & install link 

[minikube](https://minikube.sigs.k8s.io/docs/start/)


## k8s cluster using minikube as docker driver 

```
❯ minikube start  --driver=docker
😄  minikube v1.17.1 on Darwin 11.2
✨  Using the docker driver based on user configuration
👍  Starting control plane node minikube in cluster minikube
🔥  Creating docker container (CPUs=2, Memory=1990MB) ...
🐳  Preparing Kubernetes v1.20.2 on Docker 20.10.2 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔎  Verifying Kubernetes components...
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default

```

## cluster status 

```
❯ minikube status
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
timeToStop: Nonexistent

```

## minikube more commands 

```
❯ minikube status
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
timeToStop: Nonexistent

❯ 
❯ minikube   ssh
docker@minikube:~$ 
docker@minikube:~$ 
docker@minikube:~$ exit
logout


```

## KUbectl (client of k8s )

## Install On mac 

```
5758  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl"
 5759  chmod +x ./kubectl
 5760  sudo mv ./kubectl /usr/local/bin/kubectl
 5761  kubectl version --client
 
```


## For windows client 

```
https://dl.k8s.io/release/v1.20.0/bin/windows/amd64/kubectl.exe

```

# Connecting to k8s master 

```
❯ kubectl version
Client Version: version.Info{Major:"1", Minor:"20", GitVersion:"v1.20.2", GitCommit:"faecb196815e248d3ecfb03c680a4507229c2a56", GitTreeState:"clean", BuildDate:"2021-01-13T13:28:09Z", GoVersion:"go1.15.5", Compiler:"gc", Platform:"darwin/amd64"}
Server Version: version.Info{Major:"1", Minor:"20", GitVersion:"v1.20.2", GitCommit:"faecb196815e248d3ecfb03c680a4507229c2a56", GitTreeState:"clean", BuildDate:"2021-01-13T13:20:00Z", GoVersion:"go1.15.5", Compiler:"gc", Platform:"linux/amd64"}
❯ 
❯ kubectl cluster-info
Kubernetes control plane is running at https://127.0.0.1:55016
KubeDNS is running at https://127.0.0.1:55016/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.

```


##. 

