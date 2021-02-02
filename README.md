# CRE 

['cri-o'] ('https://cri-o.io/')

['Podman'] ('https://podman.io/')

['RKT'] ('https://coreos.com/rkt/')


# cgroups 

```
5380  docker  run  -d --name x1 alpine ping 127.0.0.1

==
❯ docker top x1
PID                 USER                TIME                COMMAND
476031              root                0:00                ping 127.0.0.1


===
docker stats x1 

CONTAINER ID   NAME      CPU %     MEM USAGE / LIMIT   MEM %     NET I/O     BLOCK I/O   PIDS
9bf0ee6ac274   x1        0.02%     340KiB / 1.942GiB   0.02%     976B / 0B   0B / 0B     1

```

## namespace and cgroups

<img src="nscg.png">

## Limiting ram in running or creating container 

```
5398  docker  run  --name x2  -d  --memory 100m alpine ping fb.com 
 5399  docker  update x1  --memory 150m  
 5400  docker  update --help
 5401  docker  update x1  --memory-swap 150m  
 5402  docker  update x1  --memory-swap 150m  --memory 100m 

```
## limiting cpu cores

```
❯ docker  run  --name x3  -d  --memory 100m --cpus=1    alpine ping fb.com
e2457005a72f0228b2b691b5fe911a845107afc28bc92cb729415d68e4e6c535
❯ 
❯ docker  run  --name x4  -d  --memory 100m --cpuset-cpus=0 --cpu-shares=20    alpine ping fb.com
4f3e8966a25de65af7423030ff824065b91bba0c31e88efc35d5311d9489c2d9

```

# Building docker image from Git Repo 

```
❯ docker  build  -t  ashujsp:v001  https://github.com/redashu/oraclejavawebappfeb12021.git\#main
Sending build context to Docker daemon   72.7kB
Step 1/7 : FROM tomcat
latest: Pulling from library/tomcat
b9a857cbf04d: Extracting [=====================>                             ]   21.5MB/50.4MB
d557ee20540b: Download complete 
3b9ca4f00c2e: Download complete 
667fd949ed93: Download complete 
b6a945768a17: Download complete 
aa2f45feafbf: Download complete 
7179e0e40c20: Downloading [======================>                            ]  90.56MB/202.8MB
d659cf2d36fd: Download complete 
de2ad1203c1c: Download complete 

```

## deployment of java web app

```
❯ docker run -d --name webapp -p 2233:8080  0b4ecb40fc83
42cb4df252c35dc7881870f3a45daa9481fd8ab022efd50894470e34fe21f2e2
❯ docker  ps
CONTAINER ID   IMAGE          COMMAND             CREATED          STATUS          PORTS                    NAMES
42cb4df252c3   0b4ecb40fc83   "catalina.sh run"   3 seconds ago    Up 2 seconds    0.0.0.0:2233->8080/tcp   webapp

```

# Image sharing 

<img src="imgshare.png">

## Backup & restore 

```
❯ docker  images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
ashujsp      v001      0b4ecb40fc83   27 minutes ago   668MB
tomcat       latest    66d886628b2a   6 hours ago      668MB
alpine       latest    e50c909a8df2   4 days ago       5.61MB
❯ 
❯ docker  save  -o  ashuwebapp.tar  ashujsp:v001


=== removing image


❯ docker  rmi  ashujsp:v001
Untagged: ashujsp:v001
Deleted: sha256:0b4ecb40fc832e44a34f533acb325ab8953efaa2664b7219232806d2fc171451
Deleted: sha256:0d9dfdd25ac1b635987ddb0387dae649171d05616c229c91bfee4c44d66f8eb0
Deleted: sha256:ae72d546abe23893c52e136469416504846609bf77745b767ef58c828bc57d26
Deleted: sha256:a92a8548037ea863c3fa7e17afebd4e35ef09973e23428d4d1755f0e79b5f1bb
Deleted: sha256:e96a0eeec63bf3a9a89b1cf0d7b99d69da4d6860ce893ca00c627ff1133db675
Deleted: sha256:091e12f6276c879870c1db185074b1bc1fe058f677bb08a8d58417e4eb9d6168
Deleted: sha256:696acf9199ca2b7e84f977d11b620f273c8859bb2db6311576957ea03b9c2cdf
Deleted: sha256:a23a92a617507dbc150ab1a18874bf844ac06acd97caf9734211cd648cceeab2

```

##  Restore 

```
❯ docker  load -i  ashuwebapp.tar
a22c7f5c03d4: Loading layer [==================================================>]  4.096kB/4.096kB
406cedfa6c3d: Loading layer [==================================================>]  8.192kB/8.192kB
Loaded image: ashujsp:v001
❯ docker  images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
ashujsp      v001      0b4ecb40fc83   31 minutes ago   668MB
tomcat       latest    66d886628b2a   7 hours ago      668MB
alpine       latest    e50c909a8df2   4 days ago       5.61MB

```

# Container image registry 

<img src="reg.png">

## docker image name explain 

<img src="imgname.png">

## pusing image to docker hub 

```
docker  tag  ashujsp:v001  dockerashu/ashujsp:v001

docker  login 
docker  push dockerashu/ashujsp:v001 

```

## OCR is almost same as ACR 

['OCR'] ('https://www.oracle.com/webfolder/technetwork/tutorials/obe/oci/registry/index.html')

