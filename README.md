# FInal Day workflow 

<img src="workflow.png">

## changing current namespace 

```
kubectl  config set-context  --current  --namespace=ashuproject1

```

## Deployment of RC 

```
❯ kubectl get  rc
No resources found in ashuproject1 namespace.
❯ kubectl apply -f  ashuapp1.yaml
replicationcontroller/ashuapp1 created
❯ kubectl get  rc
NAME       DESIRED   CURRENT   READY   AGE
ashuapp1   1         1         1       8s
❯ kubectl  get  po
NAME             READY   STATUS    RESTARTS   AGE
ashuapp1-p9gdn   1/1     Running   0          41s
❯ kubectl  get  po -o wide
NAME             READY   STATUS    RESTARTS   AGE   IP               NODE          NOMINATED NODE   READINESS GATES
ashuapp1-p9gdn   1/1     Running   0          55s   192.168.214.20   k8s-minion3   <none>           <none>
❯ kubectl delete  pod ashuapp1-p9gdn
pod "ashuapp1-p9gdn" deleted
❯ kubectl  get  po -o wide
NAME             READY   STATUS    RESTARTS   AGE   IP               NODE          NOMINATED NODE   READINESS GATES
ashuapp1-8gddh   1/1     Running   0          34s   192.168.214.21   k8s-minion3   <none>           <none>

```

## Explose RC to create service with auto matched label of pods

```
❯ kubectl get  rc
NAME       DESIRED   CURRENT   READY   AGE
ashuapp1   1         1         1       13m
❯ kubectl get  po
NAME             READY   STATUS    RESTARTS   AGE
ashuapp1-8gddh   1/1     Running   0          11m
❯ 
❯ 
❯ kubectl get svc
No resources found in ashuproject1 namespace.
❯ kubectl  expose  rc  ashuapp1  --type NodePort --port 1234 --target-port 8080 --name myjspsvc
service/myjspsvc exposed
❯ kubectl get  svc
NAME       TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
myjspsvc   NodePort   10.101.205.25   <none>        1234:30834/TCP   5s

```


