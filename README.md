# Oracle-NoSQL-demo
Simple scripts to create a noSQL store and expand on multiple nodes

##To do for each server
Install Java8

`sudo wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.rpm && sudo rpm -i jdk-8u111-linux-x64.rpm`
java -version

##Allow ssh acces on each server

Download Oracle NoSQL (ce or ee) from http://www.oracle.com/technetwork/database/database-technologies/nosqldb/downloads/index.html


tar -xvf kv-ee-4.0.9.tar.gz
tar -xvf kv-examples-4.0.9.tar.gz
edit env.sh
