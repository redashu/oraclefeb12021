FROM  python:latest 
# FROM will check python image on DE locally 
# if not present then DE will pull it from Docker HUB 
MAINTAINER  ashutoshh , ashutoshh@linux.com
# info about Dockerfile creator 
# this instruction is Optional 
RUN mkdir /mycode 
# this will create a directory in newly created docker image
# use of RUN instruction is to execute any thing in docker image build process
COPY ashu.py  /mycode/ashu.py
# COPY will take data from Host machine and will paste to container during 
# image build process 
# Dockerfile & content we want to copy must be at same location on the Host
CMD  ["python","/mycode/ashu.py"]
# use of CMD instruction is to define default 
# parent process of docker image 