FROM centos:7

# Update package index and install necessary tools
RUN yum -y update

RUN yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel

RUN yum update -y && yum install -y git && yum install -y maven


WORKDIR /app

# Clone the repository using username/password
RUN git clone 'https://vigneshg365:Vickey$123@github.com/vigneshg365/DockerAction.git' /app

RUN cd /app && mvn clean install

EXPOSE 8080

# Command to run the Java application
CMD ["java", "-jar", "/app/target/docker.jar"]

# hit http:<ipaddress>:<port>/welcome
