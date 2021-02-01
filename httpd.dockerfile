from oraclelinux:8.3
MAINTAINER  ashutoshh
RUN yum  install httpd -y
# yum is the software installed in all RPM base linux 
# like rhel , fedora , centos , OL --- yum/dnf 
WORKDIR /var/www/html
# documentroot of httpd web server 
COPY project-html-website  .
#  copy can copy entire data of directory 
EXPOSE 80
# exposing default httpd port number 
# so when container will be created it will assume this as default
CMD ["httpd","-DFOREGROUND"]
# But its not going to work by default 
# Reason ..??
