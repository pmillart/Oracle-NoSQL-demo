# Oracle-NoSQL-demo
Simple scripts to create a noSQL store and expand on multiple nodes

Do do for each server
Install Java8

wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.rpm 

rpm -i jdk-8u101-linux-x64.rpm
java -version

Allow ssh acces on each server

Download Oracle NoSQL

tar -xvf kv-ee-4.0.9.tar.gz
tar -xvf kv-examples-4.0.9.tar.gz
edit env.sh
