# DOCKER-VERSION 0.7.0

FROM centos:6.4
RUN wget http://ftp.riken.jp/net/apache/lucene/solr/4.6.0/solr-4.6.0.tgz && tar zxf solr-4.6.0.tgz && export SOLR=/solr-4.6.0
#RUN wget --no-check-certificate --no-cookies --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com" http://download.oracle.com/otn-pub/java/jdk/7u45-b18/jdk-7u45-linux-x64.rpm
#RUN yum -y install java-1.7.0-openjdk && export JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk.x86_64
RUN yum -y install java-1.7.0-openjdk && export JAVA_HOME=/usr/bin/java
RUN cd $SOLR/example
RUN java -jar start.jar
