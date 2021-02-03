# REcap

<img src="recap.png">

# Docker volume 

## Volume concepts 

<img src="volume1.png">

## creating volume 

```
docker volume  create  ashuvol123 

```

## checking storage location to Docker engine side

```
❯ docker volume  inspect  ashuvol123
[
    {
        "CreatedAt": "2021-02-03T04:25:45Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/ashuvol123/_data",
        "Name": "ashuvol123",
        "Options": {},
        "Scope": "local"
    }
]

```

## a closure look to volume 

<img src="volumedata.png">

## Mysql Db 

```
 docker  run  -d  --name ashudb -e  MYSQL_ROOT_PASSWORD=mypass  -v ashuvol123:/var/lib/mysql  mysql 
 
```

## A directory as volume in Readonly permission 

```
❯ docker  run -it  --name x1 -v  /etc:/myetc:ro   alpine  sh
/ # cd  /myetc/
/myetc # ls
afpovertcp.cfg                         localtime                              postfix
aliases                                locate.rc                              ppp
aliases.db                             mail.rc                                profile
apache2                                man.conf                               protocols
asl                                    manpaths                               racoon
asl.conf                               manpaths.d                             rc.common
auto_home                   

```

## sharing 

```
docker  run -it  --name x2 -v  /etc:/myetc:ro -v /opt:/xyz:rw   alpine  sh 

```
## sharing file as volume 

```
docker  run -it  --name x11 -v  /etc/passwd:/hello.txt    alpine  sh
```

## portainer deployment 

```
docker  run  -d --name ashuwebui -p 1100:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
```

# IAC -- Using Docker compose 

<img src="compose.png">

## checking compose version 

```
❯ docker-compose -v
docker-compose version 1.27.4, build 40524192

```
## docker-compose install link manually 

[docker compose link](https://docs.docker.com/compose/install/)

## Docker compsoe install on Linux host 

```
 82  sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
   83  sudo chmod +x /usr/local/bin/docker-compose
   84  sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
   85  docker-compose  -v

```

## docker compose file version 

[compose](https://docs.docker.com/compose/compose-file/)

## Docker compose file format 

<img src="filef.png">

## Example 1

```
version: "3.8"
networks: # for creating bridge network in DE
 ashubrx1: # name of bridge

services:
 ashuapp1: # first app/svc name
  image: alpine
  container_name: ashuc123
  command: ping google.com 
  networks: # for using network 
   - ashubrx1  # name of network created below

# docker compose file v3 can automatically create network if we don't define

## IN docker cli 
# docker network create ashubrx1 
# docker run --name ashuc123 --network ashubrx1 alpine ping google.com

```

## deployment of compose file 

```
❯ ls
docker-compose.yaml
❯ docker-compose up -d
Creating network "mycompose_ashubrx1" with the default driver
Creating ashuc123 ... done
❯ docker-compose  ps
  Name         Command       State   Ports
------------------------------------------
ashuc123   ping google.com   Up 

```

## compsoe more commands

```
❯ docker-compose  ps
  Name         Command       State   Ports
------------------------------------------
ashuc123   ping google.com   Up           
❯ docker-compose  kill
Killing ashuc123 ... done
❯ docker-compose  ps
  Name         Command        State     Ports
---------------------------------------------
ashuc123   ping google.com   Exit 137        
❯ docker-compose  start
Starting ashuapp1 ... done
❯ docker-compose  ps
  Name         Command       State   Ports
------------------------------------------
ashuc123   ping google.com   Up           

```

## docker compose history 

```
5679  docker-compose up -d 
 5680  docker-compose  ps
 5681  docker-compose  logs 
 5682  docker-compose  logs -f
 5683  history
 5684  docker-compose  ps
 5685  docker-compose  kill
 5686  docker-compose  ps
 5687  docker-compose  start
 5688  docker-compose  ps
 5689  docker-compose  stop
 5690  docker-compose  ps
 5691  docker-compose  start
 5692  history
 5693  ls
 5694  docker-compose
 5695  docker-compose  version 
 5696  docker-compose  images
 5697  docker-compose ps
 5698  docker-compose kill 
 5699  docker-compose rm 
 5700  docker-compose ps
 5701  docker-compose up -d
 5702  docker-compose ps
❯ docker-compose down
Stopping ashuc123 ... done
Removing ashuc123 ... done
Removing network mycompose_ashubrx1

```


## if compose has a different file name 

```
❯ ls
docker-compose.yaml
❯ mv  docker-compose.yaml ashu.yml
❯ ls
ashu.yml
❯ docker-compose up -d
ERROR: 
        Can't find a suitable configuration file in this directory or any
        parent. Are you in the right directory?

        Supported filenames: docker-compose.yml, docker-compose.yaml
        
❯ docker-compose -f  ashu.yml   up -d
Creating network "mycompose_ashubrx1" with the default driver
Creating ashuc123 ... done
❯ docker-compose -f  ashu.yml   ps
  Name         Command       State   Ports
------------------------------------------
ashuc123   ping google.com   Up           
❯ docker-compose -f  ashu.yml   down
Stopping ashuc123 ... done
Removing ashuc123 ... done
Removing network mycompose_ashubrx1

```

## compose for DB deployment 

```
version: "3.8"
volumes: # creating volume
 ashdbvol1: # name of volume
networks:  # creating network that is optional since v2 of compose file
 ashubrx2: # name of network 

services:
 ashudb1:
  image: mysql # image from docker hub if not present
  container_name: ashudbc1 # optional 
  environments: # passing env variable 
   MYSQL_ROOT_PASSWORD: Oracle123 
  volumes: # to attach volume created above
   -  "ashudbvol1:/var/lib/mysql" # mounting volume 

```
