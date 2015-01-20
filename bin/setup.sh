#!/bin/bash

# Install Maven
cd /tmp
wget http://www.gtlib.gatech.edu/pub/apache/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz
tar -xzvf apache-maven-3.2.5-bin.tar.gz
export M2_HOME=/root/apache-maven-3.2.5/
export M2=$M2_HOME/bin
export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk.x86_64
export PATH=$PATH:$M2:$JAVA_HOME/bin
mvn --version

# Build storm-topology-examples
cd /tmp
git clone https://github.com/sakserv/storm-topology-examples.git
cd /tmp/storm-topology-examples/ && mvn clean package install

# Install MongoDB
cd /tmp/storm-topology-examples/
cp bin/mongodb.repo /etc/yum.repos.d/
yum install mongodb-org -y