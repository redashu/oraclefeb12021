FROM java 
MAINTAINER ashutoshh@linux.com
RUN mkdir /codes
COPY ashu.java /codes/ashu.java
WORKDIR /codes
# changing directory during image build time
RUN javac ashu.java 
# compiling java code
CMD ["java","myclass"]
# default parent process to run java class 