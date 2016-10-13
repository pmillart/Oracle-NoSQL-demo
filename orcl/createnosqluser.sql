create user nosqluser identified by nosqluser;
grant connect,resource to nosqluser;
grant create view to nosqluser;
alter user nosqluser default tablespace users;
alter user nosqluser quota unlimited on users;


create directory nosql_bin_dir as '/home/oracle/kv-3.4.7/exttab/bin';
grant read,execute on directory nosql_bin_dir to nosqluser;

create directory ext_tab as '/home/oracle/kv-3.4.7/exttab/data';
grant read,write on directory ext_tab to nosqluser;

