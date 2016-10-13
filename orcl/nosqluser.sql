drop table rmvTable_ext;

CREATE TABLE rmvTable_ext
  (json_data  clob) 
 ORGANIZATION EXTERNAL
          (TYPE ORACLE_LOADER
           DEFAULT DIRECTORY ext_tab
           ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
           PREPROCESSOR nosql_bin_dir:'nosql_stream'
           FIELDS (JSON_DATA CHAR(32000)) 
                             )
      LOCATION ('rmvTable_data1','rmvTable_data2','rmvTable_data3',
                           'rmvTable_data4','rmvTable_data5'))
      REJECT LIMIT UNLIMITED 
     PARALLEL 5;
----------------
--
alter session force parallel query parallel 5;
select /*+ parallel */ count(*) from rmvtable_ext;

select * from rmvtable_ext rmv where rmv.json_data.lastname = 'ALLEN';

select   rmv.json_data.firstname
       , rmv.json_data.lastname
       , rmv.json_data.address.city
from rmvtable_ext rmv 
where rmv.json_data.lastname = 'ALLEN';


select * from RMVTABLE_EXT_VW
where lastname = 'ALLEN';

select * from RMVTABLE_EXT_VW2
where lastname = 'ALLEN';

/* SQL Deployed by Oracle SQL Developer 4.1.1.19.59 from Node "Requête JSON", Workflow "workflow", Project "Projet1", Connection "demo_rdbms1_nosqluser" on 7 déc. 2015 */
ALTER SESSION set "_optimizer_reuse_cost_annotations" = false;
ALTER SESSION set NLS_NUMERIC_CHARACTERS = ".," ;


--ALTER SESSION FOR OPTIMIZER
create or replace view RMVTABLE_EXT_VW as
WITH 
/* Début d'instruction SQL pour le noeud : RMVTABLE_EXT1 */
"N$10001" as (select "RMVTABLE_EXT"."JSON_DATA" 
from "NOSQLUSER"."RMVTABLE_EXT"  )
/* Fin d'instruction SQL pour le noeud : RMVTABLE_EXT1 */
,
/* Début d'instruction SQL pour le noeud : Requête JSON */
"N$10002_1" as (SELECT 
t1."HOME", 
t1."CITY", 
t1."STATE", 
t1."ZIP", 
t1."UNIT", 
t1."CELL", 
t1."SSN", 
t1."GENDER", 
t1."STREET", 
t1."ZIPCODE", 
t1."FIRSTNAME", 
t1."LASTNAME", 
t1."WORK", 
t1."LICENSE"
FROM
"N$10001" t0, 
JSON_TABLE ("JSON_DATA", '$' COLUMNS
  "ZIP" NUMBER PATH '$."address"."zip"',
  "CITY" VARCHAR2 PATH '$."address"."city"',
  "STREET" VARCHAR2 PATH '$."address"."street"',
  "STATE" VARCHAR2 PATH '$."address"."state"',
  "UNIT" NUMBER PATH '$."address"."unit"',
  "GENDER" VARCHAR2 PATH '$."gender"',
  "LICENSE" VARCHAR2 PATH '$."license"',
  "WORK" VARCHAR2 PATH '$."phoneinfo"."work"',
  "HOME" VARCHAR2 PATH '$."phoneinfo"."home"',
  "CELL" VARCHAR2 PATH '$."phoneinfo"."cell"',
  "FIRSTNAME" VARCHAR2 PATH '$."firstname"',
  "LASTNAME" VARCHAR2 PATH '$."lastname"',
  "SSN" NUMBER PATH '$."ssn"',
  "ZIPCODE" VARCHAR2 PATH '$."zipcode"'
) t1
)
,
"N$10002" as (SELECT * FROM "N$10002_1")
/* Fin d'instruction SQL pour le noeud : Requête JSON */
select * from "N$10002";


/* SQL Deployed by Oracle SQL Developer 4.1.1.19.59 from Node "Requête JSON", Workflow "workflow", Project "Projet1", Connection "demo_rdbms1_nosqluser" on 7 déc. 2015 */
ALTER SESSION set "_optimizer_reuse_cost_annotations" = false;
ALTER SESSION set NLS_NUMERIC_CHARACTERS = ".," ;
--ALTER SESSION FOR OPTIMIZER
create or replace view RMVTABLE_EXT_VW2 as
WITH 
/* Début d'instruction SQL pour le noeud : RMVTABLE_EXT1 */
"N$10001" as (select "RMVTABLE_EXT"."JSON_DATA" 
from "NOSQLUSER"."RMVTABLE_EXT"  )
/* Fin d'instruction SQL pour le noeud : RMVTABLE_EXT1 */
,
/* Début d'instruction SQL pour le noeud : Requête JSON */
"N$10002_1" as (SELECT 
t1."HOME", 
t1."CITY", 
t1."COLOR", 
t1."STATE", 
t1."TYPE", 
t1."MODEL", 
t1."ZIP", 
t1."UNIT", 
t1."CELL", 
t1."SSN", 
t1."MAKE", 
t1."GENDER", 
t1."STREET", 
t1."ZIPCODE", 
t1."FIRSTNAME", 
t1."CLASS", 
t1."LASTNAME", 
t1."WORK", 
t1."PAID", 
t1."TAX", 
t1."VALUE", 
t1."LICENSE"
FROM
"N$10001" t0, 
JSON_TABLE ("JSON_DATA", '$' COLUMNS
  "CITY" VARCHAR2 PATH '$."address"."city"',
  "STREET" VARCHAR2 PATH '$."address"."street"',
  "STATE" VARCHAR2 PATH '$."address"."state"',
  "ZIP" NUMBER PATH '$."address"."zip"',
  "UNIT" NUMBER PATH '$."address"."unit"',
  NESTED PATH '$."vehicleinfo"[*]' COLUMNS (
    "COLOR" VARCHAR2 PATH '$."color"',
    "PAID" NUMBER EXISTS PATH '$."paid"',
    "TYPE" VARCHAR2 PATH '$."type"',
    "TAX" NUMBER PATH '$."tax"',
    "MODEL" VARCHAR2 PATH '$."model"',
    "VALUE" NUMBER PATH '$."value"',
    "CLASS" VARCHAR2 PATH '$."class"',
    "MAKE" VARCHAR2 PATH '$."make"'
  ),
  "LICENSE" VARCHAR2 PATH '$."license"',
  "WORK" VARCHAR2 PATH '$."phoneinfo"."work"',
  "CELL" VARCHAR2 PATH '$."phoneinfo"."cell"',
  "HOME" VARCHAR2 PATH '$."phoneinfo"."home"',
  "LASTNAME" VARCHAR2 PATH '$."lastname"',
  "SSN" NUMBER PATH '$."ssn"',
  "ZIPCODE" VARCHAR2 PATH '$."zipcode"',
  "GENDER" VARCHAR2 PATH '$."gender"',
  "FIRSTNAME" VARCHAR2 PATH '$."firstname"'
) t1
)
,
"N$10002" as (SELECT * FROM "N$10002_1")
/* Fin d'instruction SQL pour le noeud : Requête JSON */
select * from "N$10002";
