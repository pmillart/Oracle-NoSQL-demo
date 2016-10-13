A faire sur les 3 serveurs:

wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.rpm 

rpm -i jdk-8u101-linux-x64.rpm
java -version

clefs ssh pour le compte oracle 

tar -xvf kv-ee-4.0.9.tar.gz
tar -xvf kv-examples-4.0.9.tar.gz


edit env.sh

cd $KVHOME
javac -classpath lib/kvclient.jar:examples examples/hadoop/table/LoadVehicleTable.java

java -classpath lib/kvclient.jar:examples  \
hadoop.table.LoadVehicleTable  -store kvdemo -host nosql1 -port 5000  -nops 10000

table created [vehicleTable]

##Copy jars to Hadoop

 scp kvstore.jar opc@hdp25:/usr/hdp/2.5.0.0-1245/hive/auxlib
 scp kvclient.jar opc@hdp25:/usr/hdp/2.5.0.0-1245/hive/auxlib

set hive.execution.engine=mr;
ADD JAR /usr/hdp/2.5.0.0-1245/hive/auxlib/kvstore.jar;
ADD JAR /usr/hdp/2.5.0.0-1245/hive/auxlib/kvclient.jar;
CREATE EXTERNAL TABLE IF NOT EXISTS
          vehicleTable (TYPE STRING, MAKE STRING, MODEL STRING, CLASS STRING, COLOR STRING, PRICE DOUBLE, COUNT INT)
          STORED BY 'oracle.kv.hadoop.hive.table.TableStorageHandler'
          TBLPROPERTIES ("oracle.kv.kvstore" = "kvdemo",
                         "oracle.kv.hosts" = "nosql1:5000",
                         "oracle.kv.tableName" = "vehicleTable",
                         "oracle.kv.hadoop.hosts" = "hdp");


create table spinoff (cola string, colb string);
insert into spinoff values ('Dario','Vega');
insert into spinoff values ('Patrick','Millart');

CREATE TABLE spinoff (cola VARCHAR2(100), colb VARCHAR2(100))
ORGANIZATION EXTERNAL(
TYPE ORACLE_HIVE
DEFAULT DIRECTORY DEFAULT_DIR
ACCESS PARAMETERS (
com.oracle.bigdata.tablename=spinoff
)
) 
REJECT LIMIT UNLIMITED;
