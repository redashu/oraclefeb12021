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

