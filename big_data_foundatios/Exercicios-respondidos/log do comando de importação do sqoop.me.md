
Importando a tabela employees, no warehouse  /user/hive/warehouse/db_test_a

Retorno:

root@namenode:/# sqoop import --table employees --connect jdbc:mysql://database/employees --username root --password secret --warehouse-dir /user/hive/warehouse/db_test_a
Warning: /usr/lib/sqoop/../hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.table employees --connect jdbc:mysql://database/employees --username root --password secret --warehouse-dir /user/hive/
Warning: /usr/lib/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/lib/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/lib/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
22/02/17 00:53:12 INFO sqoop.Sqoop: Running Sqoop version: 1.4.7
22/02/17 00:53:12 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
22/02/17 00:53:12 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
22/02/17 00:53:12 INFO tool.CodeGenTool: Beginning code generation
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/opt/hadoop-2.7.4/share/hadoop/common/lib/slf4j-log4j12-1.7.10.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/usr/lib/sqoop/lib/log4j-slf4j-impl-2.6.2.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.slf4j.impl.Log4jLoggerFactory]
Thu Feb 17 00:53:13 UTC 2022 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
22/02/17 00:53:13 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `employees` AS t LIMIT 1
22/02/17 00:53:13 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `employees` AS t LIMIT 1
22/02/17 00:53:13 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /opt/hadoop-2.7.4
Note: /tmp/sqoop-root/compile/28e0aa5a4afc77a8c3092a3b28fcfb27/employees.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
22/02/17 00:53:24 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-root/compile/28e0aa5a4afc77a8c3092a3b28fcfb27/employees.jar
22/02/17 00:53:24 WARN manager.MySQLManager: It looks like you are importing from mysql.
22/02/17 00:53:24 WARN manager.MySQLManager: This transfer can be faster! Use the --direct
22/02/17 00:53:24 WARN manager.MySQLManager: option to exercise a MySQL-specific fast path.
22/02/17 00:53:24 INFO manager.MySQLManager: Setting zero DATETIME behavior to convertToNull (mysql)
22/02/17 00:53:24 INFO mapreduce.ImportJobBase: Beginning import of employees
22/02/17 00:53:24 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
22/02/17 00:53:25 INFO Configuration.deprecation: mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
22/02/17 00:53:25 INFO Configuration.deprecation: session.id is deprecated. Instead, use dfs.metrics.session-id
22/02/17 00:53:25 INFO jvm.JvmMetrics: Initializing JVM Metrics with processName=JobTracker, sessionId=
Thu Feb 17 00:53:27 UTC 2022 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
22/02/17 00:53:27 INFO db.DBInputFormat: Using read commited transaction isolation
22/02/17 00:53:27 INFO db.DataDrivenDBInputFormat: BoundingValsQuery: SELECT MIN(`emp_no`), MAX(`emp_no`) FROM `employees`
22/02/17 00:53:27 INFO db.IntegerSplitter: Split size: 122499; Num splits: 4 from: 10001 to: 499999
22/02/17 00:53:27 INFO mapreduce.JobSubmitter: number of splits:4
22/02/17 00:53:27 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_local1603538223_0001
22/02/17 00:53:29 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207521/jackson-xc-1.9.13.jar <- //jackson-xc-1.9.13.jar
22/02/17 00:53:29 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jackson-xc-1.9.13.jar as file:/tmp/hadoop-root/mapred/local/1645059207521/jackson-xc-1.9.13.jar
22/02/17 00:53:29 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207522/metrics-json-3.1.0.jar <- //metrics-json-3.1.0.jar
22/02/17 00:53:30 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/metrics-json-3.1.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207522/metrics-json-3.1.0.jar
22/02/17 00:53:30 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207523/plexus-utils-3.0.15.jar <- //plexus-utils-3.0.15.jar
22/02/17 00:53:36 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/plexus-utils-3.0.15.jar as file:/tmp/hadoop-root/mapred/local/1645059207523/plexus-utils-3.0.15.jar
22/02/17 00:53:36 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207524/postgresql-jdbc.jar <- //postgresql-jdbc.jar
22/02/17 00:53:37 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/postgresql-jdbc.jar as file:/tmp/hadoop-root/mapred/local/1645059207524/postgresql-jdbc.jar
22/02/17 00:53:37 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207525/commons-logging-1.1.1.jar <- //commons-logging-1.1.1.jar
22/02/17 00:53:38 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-logging-1.1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207525/commons-logging-1.1.1.jar
22/02/17 00:53:38 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207526/super-csv-2.2.0.jar <- //super-csv-2.2.0.jar
22/02/17 00:53:38 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/super-csv-2.2.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207526/super-csv-2.2.0.jar
22/02/17 00:53:38 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207527/kite-data-hive-1.1.0.jar <- //kite-data-hive-1.1.0.jar
22/02/17 00:53:39 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/kite-data-hive-1.1.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207527/kite-data-hive-1.1.0.jar
22/02/17 00:53:39 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207528/metrics-core-3.1.0.jar <- //metrics-core-3.1.0.jar
22/02/17 00:53:39 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/metrics-core-3.1.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207528/metrics-core-3.1.0.jar
22/02/17 00:53:39 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207529/jsp-2.1-6.1.14.jar <- //jsp-2.1-6.1.14.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jsp-2.1-6.1.14.jar as file:/tmp/hadoop-root/mapred/local/1645059207529/jsp-2.1-6.1.14.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207530/jboss-logging-3.1.3.GA.jar <- //jboss-logging-3.1.3.GA.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jboss-logging-3.1.3.GA.jar as file:/tmp/hadoop-root/mapred/local/1645059207530/jboss-logging-3.1.3.GA.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207531/zookeeper-3.4.6.jar <- //zookeeper-3.4.6.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/zookeeper-3.4.6.jar as file:/tmp/hadoop-root/mapred/local/1645059207531/zookeeper-3.4.6.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207532/maven-settings-builder-3.1.1.jar <- //maven-settings-builder-3.1.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/maven-settings-builder-3.1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207532/maven-settings-builder-3.1.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207533/eigenbase-properties-1.1.5.jar <- //eigenbase-properties-1.1.5.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/eigenbase-properties-1.1.5.jar as file:/tmp/hadoop-root/mapred/local/1645059207533/eigenbase-properties-1.1.5.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207534/javax.jdo-3.2.0-m3.jar <- //javax.jdo-3.2.0-m3.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/javax.jdo-3.2.0-m3.jar as file:/tmp/hadoop-root/mapred/local/1645059207534/javax.jdo-3.2.0-m3.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207535/jetty-continuation-9.2.5.v20141112.jar <- //jetty-continuation-9.2.5.v20141112.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jetty-continuation-9.2.5.v20141112.jar as file:/tmp/hadoop-root/mapred/local/1645059207535/jetty-continuation-9.2.5.v20141112.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207536/asm-3.1.jar <- //asm-3.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/asm-3.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207536/asm-3.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207537/jackson-databind-2.3.1.jar <- //jackson-databind-2.3.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jackson-databind-2.3.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207537/jackson-databind-2.3.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207538/jersey-server-1.14.jar <- //jersey-server-1.14.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jersey-server-1.14.jar as file:/tmp/hadoop-root/mapred/local/1645059207538/jersey-server-1.14.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207539/antlr-runtime-3.5.2.jar <- //antlr-runtime-3.5.2.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/antlr-runtime-3.5.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207539/antlr-runtime-3.5.2.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207540/jetty-sslengine-6.1.26.jar <- //jetty-sslengine-6.1.26.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jetty-sslengine-6.1.26.jar as file:/tmp/hadoop-root/mapred/local/1645059207540/jetty-sslengine-6.1.26.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207541/parquet-avro-1.6.0.jar <- //parquet-avro-1.6.0.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/parquet-avro-1.6.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207541/parquet-avro-1.6.0.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207542/plexus-interpolation-1.19.jar <- //plexus-interpolation-1.19.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/plexus-interpolation-1.19.jar as file:/tmp/hadoop-root/mapred/local/1645059207542/plexus-interpolation-1.19.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207543/jta-1.1.jar <- //jta-1.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jta-1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207543/jta-1.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207544/derbynet-10.11.1.1.jar <- //derbynet-10.11.1.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/derbynet-10.11.1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207544/derbynet-10.11.1.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207545/asm-commons-3.1.jar <- //asm-commons-3.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/asm-commons-3.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207545/asm-commons-3.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207546/mysql-connector-java-5.1.47.jar <- //mysql-connector-java-5.1.47.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/mysql-connector-java-5.1.47.jar as file:/tmp/hadoop-root/mapred/local/1645059207546/mysql-connector-java-5.1.47.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207547/calcite-linq4j-1.10.0.jar <- //calcite-linq4j-1.10.0.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/calcite-linq4j-1.10.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207547/calcite-linq4j-1.10.0.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207548/calcite-core-1.10.0.jar <- //calcite-core-1.10.0.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/calcite-core-1.10.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207548/calcite-core-1.10.0.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207549/commons-compress-1.8.1.jar <- //commons-compress-1.8.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-compress-1.8.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207549/commons-compress-1.8.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207550/javolution-5.5.1.jar <- //javolution-5.5.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/javolution-5.5.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207550/javolution-5.5.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207551/HikariCP-2.5.1.jar <- //HikariCP-2.5.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/HikariCP-2.5.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207551/HikariCP-2.5.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207552/parquet-encoding-1.6.0.jar <- //parquet-encoding-1.6.0.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/parquet-encoding-1.6.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207552/parquet-encoding-1.6.0.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207553/stax-api-1.0.1.jar <- //stax-api-1.0.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/stax-api-1.0.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207553/stax-api-1.0.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207554/jackson-jaxrs-1.9.13.jar <- //jackson-jaxrs-1.9.13.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jackson-jaxrs-1.9.13.jar as file:/tmp/hadoop-root/mapred/local/1645059207554/jackson-jaxrs-1.9.13.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207555/commons-dbcp-1.4.jar <- //commons-dbcp-1.4.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-dbcp-1.4.jar as file:/tmp/hadoop-root/mapred/local/1645059207555/commons-dbcp-1.4.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207556/hive-llap-common-2.3.2.jar <- //hive-llap-common-2.3.2.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-llap-common-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207556/hive-llap-common-2.3.2.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207557/datanucleus-core-4.1.17.jar <- //datanucleus-core-4.1.17.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/datanucleus-core-4.1.17.jar as file:/tmp/hadoop-root/mapred/local/1645059207557/datanucleus-core-4.1.17.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207558/ivy-2.4.0.jar <- //ivy-2.4.0.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/ivy-2.4.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207558/ivy-2.4.0.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207559/javax.el-api-3.0.0.jar <- //javax.el-api-3.0.0.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/javax.el-api-3.0.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207559/javax.el-api-3.0.0.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207560/ant-1.6.5.jar <- //ant-1.6.5.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/ant-1.6.5.jar as file:/tmp/hadoop-root/mapred/local/1645059207560/ant-1.6.5.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207561/parquet-hadoop-1.6.0.jar <- //parquet-hadoop-1.6.0.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/parquet-hadoop-1.6.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207561/parquet-hadoop-1.6.0.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207562/jsp-api-2.0.jar <- //jsp-api-2.0.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jsp-api-2.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207562/jsp-api-2.0.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207563/hive-hcatalog-server-extensions-2.3.2.jar <- //hive-hcatalog-server-extensions-2.3.2.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-hcatalog-server-extensions-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207563/hive-hcatalog-server-extensions-2.3.2.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207564/opencsv-2.3.jar <- //opencsv-2.3.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/opencsv-2.3.jar as file:/tmp/hadoop-root/mapred/local/1645059207564/opencsv-2.3.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207565/hsqldb-1.8.0.10.jar <- //hsqldb-1.8.0.10.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hsqldb-1.8.0.10.jar as file:/tmp/hadoop-root/mapred/local/1645059207565/hsqldb-1.8.0.10.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207566/aircompressor-0.3.jar <- //aircompressor-0.3.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/aircompressor-0.3.jar as file:/tmp/hadoop-root/mapred/local/1645059207566/aircompressor-0.3.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207567/jcodings-1.0.8.jar <- //jcodings-1.0.8.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jcodings-1.0.8.jar as file:/tmp/hadoop-root/mapred/local/1645059207567/jcodings-1.0.8.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207568/antlr4-runtime-4.5.jar <- //antlr4-runtime-4.5.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/antlr4-runtime-4.5.jar as file:/tmp/hadoop-root/mapred/local/1645059207568/antlr4-runtime-4.5.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207569/janino-2.7.6.jar <- //janino-2.7.6.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/janino-2.7.6.jar as file:/tmp/hadoop-root/mapred/local/1645059207569/janino-2.7.6.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207570/jackson-dataformat-smile-2.4.6.jar <- //jackson-dataformat-smile-2.4.6.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jackson-dataformat-smile-2.4.6.jar as file:/tmp/hadoop-root/mapred/local/1645059207570/jackson-dataformat-smile-2.4.6.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207571/hbase-client-1.1.1.jar <- //hbase-client-1.1.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hbase-client-1.1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207571/hbase-client-1.1.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207572/joni-2.1.2.jar <- //joni-2.1.2.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/joni-2.1.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207572/joni-2.1.2.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207573/icu4j-4.8.1.jar <- //icu4j-4.8.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/icu4j-4.8.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207573/icu4j-4.8.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207574/commons-math3-3.6.1.jar <- //commons-math3-3.6.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-math3-3.6.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207574/commons-math3-3.6.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207575/maven-repository-metadata-3.1.1.jar <- //maven-repository-metadata-3.1.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/maven-repository-metadata-3.1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207575/maven-repository-metadata-3.1.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207576/ant-contrib-1.0b3.jar <- //ant-contrib-1.0b3.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/ant-contrib-1.0b3.jar as file:/tmp/hadoop-root/mapred/local/1645059207576/ant-contrib-1.0b3.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207577/metrics-core-2.2.0.jar <- //metrics-core-2.2.0.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/metrics-core-2.2.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207577/metrics-core-2.2.0.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207578/tesla-aether-0.0.5.jar <- //tesla-aether-0.0.5.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/tesla-aether-0.0.5.jar as file:/tmp/hadoop-root/mapred/local/1645059207578/tesla-aether-0.0.5.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207579/ant-1.9.1.jar <- //ant-1.9.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/ant-1.9.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207579/ant-1.9.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207580/jackson-module-jaxb-annotations-2.4.6.jar <- //jackson-module-jaxb-annotations-2.4.6.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jackson-module-jaxb-annotations-2.4.6.jar as file:/tmp/hadoop-root/mapred/local/1645059207580/jackson-module-jaxb-annotations-2.4.6.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207581/regexp-1.3.jar <- //regexp-1.3.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/regexp-1.3.jar as file:/tmp/hadoop-root/mapred/local/1645059207581/regexp-1.3.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207582/jersey-client-1.9.jar <- //jersey-client-1.9.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jersey-client-1.9.jar as file:/tmp/hadoop-root/mapred/local/1645059207582/jersey-client-1.9.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207583/commons-io-1.4.jar <- //commons-io-1.4.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-io-1.4.jar as file:/tmp/hadoop-root/mapred/local/1645059207583/commons-io-1.4.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207584/jackson-datatype-joda-2.4.6.jar <- //jackson-datatype-joda-2.4.6.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jackson-datatype-joda-2.4.6.jar as file:/tmp/hadoop-root/mapred/local/1645059207584/jackson-datatype-joda-2.4.6.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207585/jline-2.12.jar <- //jline-2.12.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jline-2.12.jar as file:/tmp/hadoop-root/mapred/local/1645059207585/jline-2.12.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207586/joda-time-2.8.1.jar <- //joda-time-2.8.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/joda-time-2.8.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207586/joda-time-2.8.1.jar
22/02/17 00:53:40 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207587/maven-model-3.1.1.jar <- //maven-model-3.1.1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/maven-model-3.1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207587/maven-model-3.1.1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207588/compress-lzf-1.0.3.jar <- //compress-lzf-1.0.3.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/compress-lzf-1.0.3.jar as file:/tmp/hadoop-root/mapred/local/1645059207588/compress-lzf-1.0.3.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207589/airline-0.7.jar <- //airline-0.7.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/airline-0.7.jar as file:/tmp/hadoop-root/mapred/local/1645059207589/airline-0.7.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207590/paranamer-2.7.jar <- //paranamer-2.7.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/paranamer-2.7.jar as file:/tmp/hadoop-root/mapred/local/1645059207590/paranamer-2.7.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207591/jdbi-2.63.1.jar <- //jdbi-2.63.1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jdbi-2.63.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207591/jdbi-2.63.1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207592/maven-model-builder-3.1.1.jar <- //maven-model-builder-3.1.1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/maven-model-builder-3.1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207592/maven-model-builder-3.1.1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207593/metrics-jvm-3.1.0.jar <- //metrics-jvm-3.1.0.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/metrics-jvm-3.1.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207593/metrics-jvm-3.1.0.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207594/jackson-core-2.3.1.jar <- //jackson-core-2.3.1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jackson-core-2.3.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207594/jackson-core-2.3.1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207595/druid-hdfs-storage-0.9.2.jar <- //druid-hdfs-storage-0.9.2.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/druid-hdfs-storage-0.9.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207595/druid-hdfs-storage-0.9.2.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207596/servlet-api-2.4.jar <- //servlet-api-2.4.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/servlet-api-2.4.jar as file:/tmp/hadoop-root/mapred/local/1645059207596/servlet-api-2.4.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207597/hive-druid-handler-2.3.2.jar <- //hive-druid-handler-2.3.2.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-druid-handler-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207597/hive-druid-handler-2.3.2.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207598/bytebuffer-collections-0.2.5.jar <- //bytebuffer-collections-0.2.5.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/bytebuffer-collections-0.2.5.jar as file:/tmp/hadoop-root/mapred/local/1645059207598/bytebuffer-collections-0.2.5.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207599/servlet-api-2.5-6.1.14.jar <- //servlet-api-2.5-6.1.14.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/servlet-api-2.5-6.1.14.jar as file:/tmp/hadoop-root/mapred/local/1645059207599/servlet-api-2.5-6.1.14.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207600/okhttp-1.0.2.jar <- //okhttp-1.0.2.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/okhttp-1.0.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207600/okhttp-1.0.2.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207601/config-magic-0.9.jar <- //config-magic-0.9.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/config-magic-0.9.jar as file:/tmp/hadoop-root/mapred/local/1645059207601/config-magic-0.9.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207602/geronimo-jta_1.1_spec-1.1.1.jar <- //geronimo-jta_1.1_spec-1.1.1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/geronimo-jta_1.1_spec-1.1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207602/geronimo-jta_1.1_spec-1.1.1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207603/maven-scm-api-1.4.jar <- //maven-scm-api-1.4.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/maven-scm-api-1.4.jar as file:/tmp/hadoop-root/mapred/local/1645059207603/maven-scm-api-1.4.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207604/guava-14.0.1.jar <- //guava-14.0.1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/guava-14.0.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207604/guava-14.0.1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207605/hbase-hadoop2-compat-1.1.1-tests.jar <- //hbase-hadoop2-compat-1.1.1-tests.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hbase-hadoop2-compat-1.1.1-tests.jar as file:/tmp/hadoop-root/mapred/local/1645059207605/hbase-hadoop2-compat-1.1.1-tests.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207606/datanucleus-rdbms-4.1.19.jar <- //datanucleus-rdbms-4.1.19.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/datanucleus-rdbms-4.1.19.jar as file:/tmp/hadoop-root/mapred/local/1645059207606/datanucleus-rdbms-4.1.19.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207607/snappy-java-1.1.1.6.jar <- //snappy-java-1.1.1.6.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/snappy-java-1.1.1.6.jar as file:/tmp/hadoop-root/mapred/local/1645059207607/snappy-java-1.1.1.6.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207608/jetty-client-9.2.5.v20141112.jar <- //jetty-client-9.2.5.v20141112.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jetty-client-9.2.5.v20141112.jar as file:/tmp/hadoop-root/mapred/local/1645059207608/jetty-client-9.2.5.v20141112.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207609/maven-scm-provider-svn-commons-1.4.jar <- //maven-scm-provider-svn-commons-1.4.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/maven-scm-provider-svn-commons-1.4.jar as file:/tmp/hadoop-root/mapred/local/1645059207609/maven-scm-provider-svn-commons-1.4.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207610/log4j-web-2.6.2.jar <- //log4j-web-2.6.2.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/log4j-web-2.6.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207610/log4j-web-2.6.2.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207611/slider-core-0.90.2-incubating.jar <- //slider-core-0.90.2-incubating.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/slider-core-0.90.2-incubating.jar as file:/tmp/hadoop-root/mapred/local/1645059207611/slider-core-0.90.2-incubating.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207612/commons-io-2.4.jar <- //commons-io-2.4.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-io-2.4.jar as file:/tmp/hadoop-root/mapred/local/1645059207612/commons-io-2.4.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207613/aether-spi-0.9.0.M2.jar <- //aether-spi-0.9.0.M2.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/aether-spi-0.9.0.M2.jar as file:/tmp/hadoop-root/mapred/local/1645059207613/aether-spi-0.9.0.M2.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207614/aether-util-0.9.0.M2.jar <- //aether-util-0.9.0.M2.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/aether-util-0.9.0.M2.jar as file:/tmp/hadoop-root/mapred/local/1645059207614/aether-util-0.9.0.M2.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207615/log4j-slf4j-impl-2.6.2.jar <- //log4j-slf4j-impl-2.6.2.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/log4j-slf4j-impl-2.6.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207615/log4j-slf4j-impl-2.6.2.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207616/kite-data-core-1.1.0.jar <- //kite-data-core-1.1.0.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/kite-data-core-1.1.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207616/kite-data-core-1.1.0.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207617/libfb303-0.9.3.jar <- //libfb303-0.9.3.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/libfb303-0.9.3.jar as file:/tmp/hadoop-root/mapred/local/1645059207617/libfb303-0.9.3.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207618/mapdb-1.0.8.jar <- //mapdb-1.0.8.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/mapdb-1.0.8.jar as file:/tmp/hadoop-root/mapred/local/1645059207618/mapdb-1.0.8.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207619/geronimo-annotation_1.0_spec-1.1.1.jar <- //geronimo-annotation_1.0_spec-1.1.1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/geronimo-annotation_1.0_spec-1.1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207619/geronimo-annotation_1.0_spec-1.1.1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207620/jetty-servlets-9.2.5.v20141112.jar <- //jetty-servlets-9.2.5.v20141112.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jetty-servlets-9.2.5.v20141112.jar as file:/tmp/hadoop-root/mapred/local/1645059207620/jetty-servlets-9.2.5.v20141112.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207621/pentaho-aggdesigner-algorithm-5.1.5-jhyde.jar <- //pentaho-aggdesigner-algorithm-5.1.5-jhyde.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/pentaho-aggdesigner-algorithm-5.1.5-jhyde.jar as file:/tmp/hadoop-root/mapred/local/1645059207621/pentaho-aggdesigner-algorithm-5.1.5-jhyde.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207622/mail-1.4.1.jar <- //mail-1.4.1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/mail-1.4.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207622/mail-1.4.1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207623/RoaringBitmap-0.5.18.jar <- //RoaringBitmap-0.5.18.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/RoaringBitmap-0.5.18.jar as file:/tmp/hadoop-root/mapred/local/1645059207623/RoaringBitmap-0.5.18.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207624/commons-jexl-2.1.1.jar <- //commons-jexl-2.1.1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-jexl-2.1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207624/commons-jexl-2.1.1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207625/jasper-runtime-5.5.23.jar <- //jasper-runtime-5.5.23.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jasper-runtime-5.5.23.jar as file:/tmp/hadoop-root/mapred/local/1645059207625/jasper-runtime-5.5.23.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207626/javax.inject-1.jar <- //javax.inject-1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/javax.inject-1.jar as file:/tmp/hadoop-root/mapred/local/1645059207626/javax.inject-1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207627/hive-llap-common-2.3.2-tests.jar <- //hive-llap-common-2.3.2-tests.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-llap-common-2.3.2-tests.jar as file:/tmp/hadoop-root/mapred/local/1645059207627/hive-llap-common-2.3.2-tests.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207628/commons-compress-1.9.jar <- //commons-compress-1.9.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-compress-1.9.jar as file:/tmp/hadoop-root/mapred/local/1645059207628/commons-compress-1.9.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207629/postgresql-metadata-storage-0.9.2.jar <- //postgresql-metadata-storage-0.9.2.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/postgresql-metadata-storage-0.9.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207629/postgresql-metadata-storage-0.9.2.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207630/hbase-common-1.1.1-tests.jar <- //hbase-common-1.1.1-tests.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hbase-common-1.1.1-tests.jar as file:/tmp/hadoop-root/mapred/local/1645059207630/hbase-common-1.1.1-tests.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207631/jetty-all-7.6.0.v20120127.jar <- //jetty-all-7.6.0.v20120127.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jetty-all-7.6.0.v20120127.jar as file:/tmp/hadoop-root/mapred/local/1645059207631/jetty-all-7.6.0.v20120127.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207632/asm-tree-3.1.jar <- //asm-tree-3.1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/asm-tree-3.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207632/asm-tree-3.1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207633/commons-lang3-3.4.jar <- //commons-lang3-3.4.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-lang3-3.4.jar as file:/tmp/hadoop-root/mapred/local/1645059207633/commons-lang3-3.4.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207634/xz-1.5.jar <- //xz-1.5.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/xz-1.5.jar as file:/tmp/hadoop-root/mapred/local/1645059207634/xz-1.5.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207635/kite-data-mapreduce-1.1.0.jar <- //kite-data-mapreduce-1.1.0.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/kite-data-mapreduce-1.1.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207635/kite-data-mapreduce-1.1.0.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207636/jcommander-1.32.jar <- //jcommander-1.32.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jcommander-1.32.jar as file:/tmp/hadoop-root/mapred/local/1645059207636/jcommander-1.32.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207637/maven-settings-3.1.1.jar <- //maven-settings-3.1.1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/maven-settings-3.1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207637/maven-settings-3.1.1.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207638/jetty-security-9.2.5.v20141112.jar <- //jetty-security-9.2.5.v20141112.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jetty-security-9.2.5.v20141112.jar as file:/tmp/hadoop-root/mapred/local/1645059207638/jetty-security-9.2.5.v20141112.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207639/velocity-1.5.jar <- //velocity-1.5.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/velocity-1.5.jar as file:/tmp/hadoop-root/mapred/local/1645059207639/velocity-1.5.jar
22/02/17 00:53:41 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207640/jsp-api-2.1.jar <- //jsp-api-2.1.jar
22/02/17 00:53:42 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jsp-api-2.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207640/jsp-api-2.1.jar
22/02/17 00:53:42 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207641/json-1.8.jar <- //json-1.8.jar
22/02/17 00:53:42 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/json-1.8.jar as file:/tmp/hadoop-root/mapred/local/1645059207641/json-1.8.jar
22/02/17 00:53:42 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207642/groovy-all-2.4.4.jar <- //groovy-all-2.4.4.jar
22/02/17 00:53:42 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/groovy-all-2.4.4.jar as file:/tmp/hadoop-root/mapred/local/1645059207642/groovy-all-2.4.4.jar
22/02/17 00:53:42 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207643/parquet-generator-1.6.0.jar <- //parquet-generator-1.6.0.jar
22/02/17 00:53:42 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/parquet-generator-1.6.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207643/parquet-generator-1.6.0.jar
22/02/17 00:53:42 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207644/jetty-io-9.2.5.v20141112.jar <- //jetty-io-9.2.5.v20141112.jar
22/02/17 00:53:42 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jetty-io-9.2.5.v20141112.jar as file:/tmp/hadoop-root/mapred/local/1645059207644/jetty-io-9.2.5.v20141112.jar
22/02/17 00:53:42 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207645/disruptor-3.3.0.jar <- //disruptor-3.3.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/disruptor-3.3.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207645/disruptor-3.3.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207646/http-client-1.0.4.jar <- //http-client-1.0.4.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/http-client-1.0.4.jar as file:/tmp/hadoop-root/mapred/local/1645059207646/http-client-1.0.4.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207647/emitter-0.3.6.jar <- //emitter-0.3.6.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/emitter-0.3.6.jar as file:/tmp/hadoop-root/mapred/local/1645059207647/emitter-0.3.6.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207648/geronimo-jaspic_1.0_spec-1.0.jar <- //geronimo-jaspic_1.0_spec-1.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/geronimo-jaspic_1.0_spec-1.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207648/geronimo-jaspic_1.0_spec-1.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207649/javax.servlet-3.0.0.v201112011016.jar <- //javax.servlet-3.0.0.v201112011016.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/javax.servlet-3.0.0.v201112011016.jar as file:/tmp/hadoop-root/mapred/local/1645059207649/javax.servlet-3.0.0.v201112011016.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207650/org.abego.treelayout.core-1.0.1.jar <- //org.abego.treelayout.core-1.0.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/org.abego.treelayout.core-1.0.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207650/org.abego.treelayout.core-1.0.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207651/hive-llap-client-2.3.2.jar <- //hive-llap-client-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-llap-client-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207651/hive-llap-client-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207652/hbase-protocol-1.1.1.jar <- //hbase-protocol-1.1.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hbase-protocol-1.1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207652/hbase-protocol-1.1.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207653/validation-api-1.1.0.Final.jar <- //validation-api-1.1.0.Final.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/validation-api-1.1.0.Final.jar as file:/tmp/hadoop-root/mapred/local/1645059207653/validation-api-1.1.0.Final.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207654/bonecp-0.8.0.RELEASE.jar <- //bonecp-0.8.0.RELEASE.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/bonecp-0.8.0.RELEASE.jar as file:/tmp/hadoop-root/mapred/local/1645059207654/bonecp-0.8.0.RELEASE.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207655/hbase-common-1.1.1.jar <- //hbase-common-1.1.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hbase-common-1.1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207655/hbase-common-1.1.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207656/calcite-druid-1.10.0.jar <- //calcite-druid-1.10.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/calcite-druid-1.10.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207656/calcite-druid-1.10.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207657/jsr305-3.0.0.jar <- //jsr305-3.0.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jsr305-3.0.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207657/jsr305-3.0.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207658/hive-llap-server-2.3.2.jar <- //hive-llap-server-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-llap-server-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207658/hive-llap-server-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207659/jsp-api-2.1-6.1.14.jar <- //jsp-api-2.1-6.1.14.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jsp-api-2.1-6.1.14.jar as file:/tmp/hadoop-root/mapred/local/1645059207659/jsp-api-2.1-6.1.14.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207660/hibernate-validator-5.1.3.Final.jar <- //hibernate-validator-5.1.3.Final.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hibernate-validator-5.1.3.Final.jar as file:/tmp/hadoop-root/mapred/local/1645059207660/hibernate-validator-5.1.3.Final.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207661/spymemcached-2.11.7.jar <- //spymemcached-2.11.7.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/spymemcached-2.11.7.jar as file:/tmp/hadoop-root/mapred/local/1645059207661/spymemcached-2.11.7.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207662/log4j-1.2-api-2.6.2.jar <- //log4j-1.2-api-2.6.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/log4j-1.2-api-2.6.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207662/log4j-1.2-api-2.6.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207663/hbase-annotations-1.1.1.jar <- //hbase-annotations-1.1.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hbase-annotations-1.1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207663/hbase-annotations-1.1.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207664/json-path-2.1.0.jar <- //json-path-2.1.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/json-path-2.1.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207664/json-path-2.1.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207665/log4j-core-2.6.2.jar <- //log4j-core-2.6.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/log4j-core-2.6.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207665/log4j-core-2.6.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207666/hive-hcatalog-core-2.3.2.jar <- //hive-hcatalog-core-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-hcatalog-core-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207666/hive-hcatalog-core-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207667/commons-collections-3.2.2.jar <- //commons-collections-3.2.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-collections-3.2.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207667/commons-collections-3.2.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207668/avro-1.7.7.jar <- //avro-1.7.7.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/avro-1.7.7.jar as file:/tmp/hadoop-root/mapred/local/1645059207668/avro-1.7.7.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207669/rhino-1.7R5.jar <- //rhino-1.7R5.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/rhino-1.7R5.jar as file:/tmp/hadoop-root/mapred/local/1645059207669/rhino-1.7R5.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207670/lz4-1.3.0.jar <- //lz4-1.3.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/lz4-1.3.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207670/lz4-1.3.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207671/jetty-servlet-9.2.5.v20141112.jar <- //jetty-servlet-9.2.5.v20141112.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jetty-servlet-9.2.5.v20141112.jar as file:/tmp/hadoop-root/mapred/local/1645059207671/jetty-servlet-9.2.5.v20141112.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207672/java-util-0.27.10.jar <- //java-util-0.27.10.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/java-util-0.27.10.jar as file:/tmp/hadoop-root/mapred/local/1645059207672/java-util-0.27.10.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207673/hive-hplsql-2.3.2.jar <- //hive-hplsql-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-hplsql-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207673/hive-hplsql-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207674/aether-impl-0.9.0.M2.jar <- //aether-impl-0.9.0.M2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/aether-impl-0.9.0.M2.jar as file:/tmp/hadoop-root/mapred/local/1645059207674/aether-impl-0.9.0.M2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207675/hive-storage-api-2.4.0.jar <- //hive-storage-api-2.4.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-storage-api-2.4.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207675/hive-storage-api-2.4.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207676/aether-api-0.9.0.M2.jar <- //aether-api-0.9.0.M2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/aether-api-0.9.0.M2.jar as file:/tmp/hadoop-root/mapred/local/1645059207676/aether-api-0.9.0.M2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207677/jersey-guice-1.19.jar <- //jersey-guice-1.19.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jersey-guice-1.19.jar as file:/tmp/hadoop-root/mapred/local/1645059207677/jersey-guice-1.19.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207678/hive-contrib-2.3.2.jar <- //hive-contrib-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-contrib-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207678/hive-contrib-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207679/commons-lang-2.6.jar <- //commons-lang-2.6.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-lang-2.6.jar as file:/tmp/hadoop-root/mapred/local/1645059207679/commons-lang-2.6.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207680/commons-el-1.0.jar <- //commons-el-1.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-el-1.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207680/commons-el-1.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207681/htrace-core-3.1.0-incubating.jar <- //htrace-core-3.1.0-incubating.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/htrace-core-3.1.0-incubating.jar as file:/tmp/hadoop-root/mapred/local/1645059207681/htrace-core-3.1.0-incubating.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207682/jetty-server-9.2.5.v20141112.jar <- //jetty-server-9.2.5.v20141112.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jetty-server-9.2.5.v20141112.jar as file:/tmp/hadoop-root/mapred/local/1645059207682/jetty-server-9.2.5.v20141112.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207683/druid-server-0.9.2.jar <- //druid-server-0.9.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/druid-server-0.9.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207683/druid-server-0.9.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207684/httpcore-4.4.jar <- //httpcore-4.4.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/httpcore-4.4.jar as file:/tmp/hadoop-root/mapred/local/1645059207684/httpcore-4.4.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207685/hive-service-rpc-2.3.2.jar <- //hive-service-rpc-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-service-rpc-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207685/hive-service-rpc-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207686/guice-multibindings-4.1.0.jar <- //guice-multibindings-4.1.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/guice-multibindings-4.1.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207686/guice-multibindings-4.1.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207687/druid-common-0.9.2.jar <- //druid-common-0.9.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/druid-common-0.9.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207687/druid-common-0.9.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207688/hive-metastore-2.3.2.jar <- //hive-metastore-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-metastore-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207688/hive-metastore-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207689/commons-pool2-2.2.jar <- //commons-pool2-2.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-pool2-2.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207689/commons-pool2-2.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207690/snappy-java-1.0.5.jar <- //snappy-java-1.0.5.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/snappy-java-1.0.5.jar as file:/tmp/hadoop-root/mapred/local/1645059207690/snappy-java-1.0.5.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207691/dropwizard-metrics-hadoop-metrics2-reporter-0.1.2.jar <- //dropwizard-metrics-hadoop-metrics2-reporter-0.1.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/dropwizard-metrics-hadoop-metrics2-reporter-0.1.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207691/dropwizard-metrics-hadoop-metrics2-reporter-0.1.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207692/hive-shims-common-2.3.2.jar <- //hive-shims-common-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-shims-common-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207692/hive-shims-common-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207693/jackson-mapper-asl-1.9.13.jar <- //jackson-mapper-asl-1.9.13.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jackson-mapper-asl-1.9.13.jar as file:/tmp/hadoop-root/mapred/local/1645059207693/jackson-mapper-asl-1.9.13.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207694/druid-api-0.9.2.jar <- //druid-api-0.9.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/druid-api-0.9.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207694/druid-api-0.9.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207695/aether-connector-file-0.9.0.M2.jar <- //aether-connector-file-0.9.0.M2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/aether-connector-file-0.9.0.M2.jar as file:/tmp/hadoop-root/mapred/local/1645059207695/aether-connector-file-0.9.0.M2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207696/commons-math-2.2.jar <- //commons-math-2.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-math-2.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207696/commons-math-2.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207697/avatica-1.8.0.jar <- //avatica-1.8.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/avatica-1.8.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207697/avatica-1.8.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207698/log4j-api-2.6.2.jar <- //log4j-api-2.6.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/log4j-api-2.6.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207698/log4j-api-2.6.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207699/commons-codec-1.4.jar <- //commons-codec-1.4.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-codec-1.4.jar as file:/tmp/hadoop-root/mapred/local/1645059207699/commons-codec-1.4.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207700/datanucleus-api-jdo-4.2.4.jar <- //datanucleus-api-jdo-4.2.4.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/datanucleus-api-jdo-4.2.4.jar as file:/tmp/hadoop-root/mapred/local/1645059207700/datanucleus-api-jdo-4.2.4.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207701/google-http-client-jackson2-1.15.0-rc.jar <- //google-http-client-jackson2-1.15.0-rc.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/google-http-client-jackson2-1.15.0-rc.jar as file:/tmp/hadoop-root/mapred/local/1645059207701/google-http-client-jackson2-1.15.0-rc.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207702/server-metrics-0.2.8.jar <- //server-metrics-0.2.8.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/server-metrics-0.2.8.jar as file:/tmp/hadoop-root/mapred/local/1645059207702/server-metrics-0.2.8.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207703/hive-shims-scheduler-2.3.2.jar <- //hive-shims-scheduler-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-shims-scheduler-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207703/hive-shims-scheduler-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207704/hive-testutils-2.3.2.jar <- //hive-testutils-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-testutils-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207704/hive-testutils-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207705/transaction-api-1.1.jar <- //transaction-api-1.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/transaction-api-1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207705/transaction-api-1.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207706/log4j-jul-2.5.jar <- //log4j-jul-2.5.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/log4j-jul-2.5.jar as file:/tmp/hadoop-root/mapred/local/1645059207706/log4j-jul-2.5.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207707/maven-scm-provider-svnexe-1.4.jar <- //maven-scm-provider-svnexe-1.4.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/maven-scm-provider-svnexe-1.4.jar as file:/tmp/hadoop-root/mapred/local/1645059207707/maven-scm-provider-svnexe-1.4.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207708/jetty-proxy-9.2.5.v20141112.jar <- //jetty-proxy-9.2.5.v20141112.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jetty-proxy-9.2.5.v20141112.jar as file:/tmp/hadoop-root/mapred/local/1645059207708/jetty-proxy-9.2.5.v20141112.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207709/hbase-hadoop2-compat-1.1.1.jar <- //hbase-hadoop2-compat-1.1.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hbase-hadoop2-compat-1.1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207709/hbase-hadoop2-compat-1.1.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207710/httpclient-4.4.jar <- //httpclient-4.4.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/httpclient-4.4.jar as file:/tmp/hadoop-root/mapred/local/1645059207710/httpclient-4.4.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207711/paranamer-2.3.jar <- //paranamer-2.3.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/paranamer-2.3.jar as file:/tmp/hadoop-root/mapred/local/1645059207711/paranamer-2.3.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207712/parquet-column-1.6.0.jar <- //parquet-column-1.6.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/parquet-column-1.6.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207712/parquet-column-1.6.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207713/javax.servlet-api-3.1.0.jar <- //javax.servlet-api-3.1.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/javax.servlet-api-3.1.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207713/javax.servlet-api-3.1.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207714/hive-serde-2.3.2.jar <- //hive-serde-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-serde-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207714/hive-serde-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207715/activation-1.1.jar <- //activation-1.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/activation-1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207715/activation-1.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207716/accumulo-fate-1.6.0.jar <- //accumulo-fate-1.6.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/accumulo-fate-1.6.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207716/accumulo-fate-1.6.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207717/hive-jdbc-handler-2.3.2.jar <- //hive-jdbc-handler-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-jdbc-handler-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207717/hive-jdbc-handler-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207718/commons-dbcp2-2.0.1.jar <- //commons-dbcp2-2.0.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-dbcp2-2.0.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207718/commons-dbcp2-2.0.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207719/hive-shims-2.3.2.jar <- //hive-shims-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-shims-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207719/hive-shims-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207720/hive-common-2.3.2.jar <- //hive-common-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-common-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207720/hive-common-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207721/jetty-util-6.1.26.jar <- //jetty-util-6.1.26.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jetty-util-6.1.26.jar as file:/tmp/hadoop-root/mapred/local/1645059207721/jetty-util-6.1.26.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207722/commons-logging-1.2.jar <- //commons-logging-1.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-logging-1.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207722/commons-logging-1.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207723/javax.el-3.0.0.jar <- //javax.el-3.0.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/javax.el-3.0.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207723/javax.el-3.0.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207724/irc-api-1.0-0014.jar <- //irc-api-1.0-0014.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/irc-api-1.0-0014.jar as file:/tmp/hadoop-root/mapred/local/1645059207724/irc-api-1.0-0014.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207725/commons-pool-1.5.4.jar <- //commons-pool-1.5.4.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-pool-1.5.4.jar as file:/tmp/hadoop-root/mapred/local/1645059207725/commons-pool-1.5.4.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207726/kite-hadoop-compatibility-1.1.0.jar <- //kite-hadoop-compatibility-1.1.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/kite-hadoop-compatibility-1.1.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207726/kite-hadoop-compatibility-1.1.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207727/hbase-server-1.1.1.jar <- //hbase-server-1.1.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hbase-server-1.1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207727/hbase-server-1.1.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207728/hbase-prefix-tree-1.1.1.jar <- //hbase-prefix-tree-1.1.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hbase-prefix-tree-1.1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207728/hbase-prefix-tree-1.1.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207729/accumulo-trace-1.6.0.jar <- //accumulo-trace-1.6.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/accumulo-trace-1.6.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207729/accumulo-trace-1.6.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207730/tempus-fugit-1.1.jar <- //tempus-fugit-1.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/tempus-fugit-1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207730/tempus-fugit-1.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207731/avro-mapred-1.8.1-hadoop2.jar <- //avro-mapred-1.8.1-hadoop2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/avro-mapred-1.8.1-hadoop2.jar as file:/tmp/hadoop-root/mapred/local/1645059207731/avro-mapred-1.8.1-hadoop2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207732/hive-llap-tez-2.3.2.jar <- //hive-llap-tez-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-llap-tez-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207732/hive-llap-tez-2.3.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207733/jdo-api-3.0.1.jar <- //jdo-api-3.0.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jdo-api-3.0.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207733/jdo-api-3.0.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207734/ant-launcher-1.9.1.jar <- //ant-launcher-1.9.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/ant-launcher-1.9.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207734/ant-launcher-1.9.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207735/jackson-jaxrs-smile-provider-2.4.6.jar <- //jackson-jaxrs-smile-provider-2.4.6.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jackson-jaxrs-smile-provider-2.4.6.jar as file:/tmp/hadoop-root/mapred/local/1645059207735/jackson-jaxrs-smile-provider-2.4.6.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207736/jackson-annotations-2.6.0.jar <- //jackson-annotations-2.6.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jackson-annotations-2.6.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207736/jackson-annotations-2.6.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207737/hbase-hadoop-compat-1.1.1.jar <- //hbase-hadoop-compat-1.1.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hbase-hadoop-compat-1.1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207737/hbase-hadoop-compat-1.1.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207738/commons-lang3-3.1.jar <- //commons-lang3-3.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-lang3-3.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207738/commons-lang3-3.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207739/geoip2-0.4.0.jar <- //geoip2-0.4.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/geoip2-0.4.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207739/geoip2-0.4.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207740/findbugs-annotations-1.3.9-1.jar <- //findbugs-annotations-1.3.9-1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/findbugs-annotations-1.3.9-1.jar as file:/tmp/hadoop-root/mapred/local/1645059207740/findbugs-annotations-1.3.9-1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207741/jackson-datatype-guava-2.4.6.jar <- //jackson-datatype-guava-2.4.6.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jackson-datatype-guava-2.4.6.jar as file:/tmp/hadoop-root/mapred/local/1645059207741/jackson-datatype-guava-2.4.6.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207742/avatica-metrics-1.8.0.jar <- //avatica-metrics-1.8.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/avatica-metrics-1.8.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207742/avatica-metrics-1.8.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207743/jamon-runtime-2.3.1.jar <- //jamon-runtime-2.3.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jamon-runtime-2.3.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207743/jamon-runtime-2.3.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207744/jpam-1.1.jar <- //jpam-1.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jpam-1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207744/jpam-1.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207745/ant-eclipse-1.0-jvm1.2.jar <- //ant-eclipse-1.0-jvm1.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/ant-eclipse-1.0-jvm1.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207745/ant-eclipse-1.0-jvm1.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207746/druid-console-0.0.2.jar <- //druid-console-0.0.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/druid-console-0.0.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207746/druid-console-0.0.2.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207747/libthrift-0.9.3.jar <- //libthrift-0.9.3.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/libthrift-0.9.3.jar as file:/tmp/hadoop-root/mapred/local/1645059207747/libthrift-0.9.3.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207748/parquet-jackson-1.6.0.jar <- //parquet-jackson-1.6.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/parquet-jackson-1.6.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207748/parquet-jackson-1.6.0.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207749/jetty-6.1.26.jar <- //jetty-6.1.26.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jetty-6.1.26.jar as file:/tmp/hadoop-root/mapred/local/1645059207749/jetty-6.1.26.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207750/jackson-annotations-2.3.1.jar <- //jackson-annotations-2.3.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jackson-annotations-2.3.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207750/jackson-annotations-2.3.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207751/commons-compiler-2.7.6.jar <- //commons-compiler-2.7.6.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-compiler-2.7.6.jar as file:/tmp/hadoop-root/mapred/local/1645059207751/commons-compiler-2.7.6.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207752/jetty-http-9.2.5.v20141112.jar <- //jetty-http-9.2.5.v20141112.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jetty-http-9.2.5.v20141112.jar as file:/tmp/hadoop-root/mapred/local/1645059207752/jetty-http-9.2.5.v20141112.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207753/wagon-provider-api-2.4.jar <- //wagon-provider-api-2.4.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/wagon-provider-api-2.4.jar as file:/tmp/hadoop-root/mapred/local/1645059207753/wagon-provider-api-2.4.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207754/curator-recipes-2.7.1.jar <- //curator-recipes-2.7.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/curator-recipes-2.7.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207754/curator-recipes-2.7.1.jar
22/02/17 00:53:43 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207755/maven-aether-provider-3.1.1.jar <- //maven-aether-provider-3.1.1.jar
22/02/17 00:53:44 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/maven-aether-provider-3.1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207755/maven-aether-provider-3.1.1.jar
22/02/17 00:53:44 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207756/netty-3.6.2.Final.jar <- //netty-3.6.2.Final.jar
22/02/17 00:53:44 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/netty-3.6.2.Final.jar as file:/tmp/hadoop-root/mapred/local/1645059207756/netty-3.6.2.Final.jar
22/02/17 00:53:44 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207757/hbase-procedure-1.1.1.jar <- //hbase-procedure-1.1.1.jar
22/02/17 00:53:44 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hbase-procedure-1.1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207757/hbase-procedure-1.1.1.jar
22/02/17 00:53:44 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207758/hive-hbase-handler-2.3.2.jar <- //hive-hbase-handler-2.3.2.jar
22/02/17 00:53:44 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-hbase-handler-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207758/hive-hbase-handler-2.3.2.jar
22/02/17 00:53:44 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207759/netty-all-4.0.52.Final.jar <- //netty-all-4.0.52.Final.jar
22/02/17 00:53:44 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/netty-all-4.0.52.Final.jar as file:/tmp/hadoop-root/mapred/local/1645059207759/netty-all-4.0.52.Final.jar
22/02/17 00:53:44 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207760/jasper-compiler-5.5.23.jar <- //jasper-compiler-5.5.23.jar
22/02/17 00:53:44 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jasper-compiler-5.5.23.jar as file:/tmp/hadoop-root/mapred/local/1645059207760/jasper-compiler-5.5.23.jar
22/02/17 00:53:44 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207761/curator-framework-2.7.1.jar <- //curator-framework-2.7.1.jar
22/02/17 00:53:44 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/curator-framework-2.7.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207761/curator-framework-2.7.1.jar
22/02/17 00:53:44 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207762/orc-core-1.3.3.jar <- //orc-core-1.3.3.jar
22/02/17 00:53:44 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/orc-core-1.3.3.jar as file:/tmp/hadoop-root/mapred/local/1645059207762/orc-core-1.3.3.jar
22/02/17 00:53:45 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207763/hive-jdbc-2.3.2.jar <- //hive-jdbc-2.3.2.jar
22/02/17 00:53:45 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-jdbc-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207763/hive-jdbc-2.3.2.jar
22/02/17 00:53:45 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207764/parquet-common-1.6.0.jar <- //parquet-common-1.6.0.jar
22/02/17 00:53:45 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/parquet-common-1.6.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207764/parquet-common-1.6.0.jar
22/02/17 00:53:45 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207765/avro-1.8.1.jar <- //avro-1.8.1.jar
22/02/17 00:53:45 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/avro-1.8.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207765/avro-1.8.1.jar
22/02/17 00:53:45 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207766/derby-10.10.2.0.jar <- //derby-10.10.2.0.jar
22/02/17 00:53:45 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/derby-10.10.2.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207766/derby-10.10.2.0.jar
22/02/17 00:53:45 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207767/hive-accumulo-handler-2.3.2.jar <- //hive-accumulo-handler-2.3.2.jar
22/02/17 00:53:45 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-accumulo-handler-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207767/hive-accumulo-handler-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207768/hive-exec-2.3.2.jar <- //hive-exec-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-exec-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207768/hive-exec-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207769/ST4-4.0.4.jar <- //ST4-4.0.4.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/ST4-4.0.4.jar as file:/tmp/hadoop-root/mapred/local/1645059207769/ST4-4.0.4.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207770/commons-cli-1.2.jar <- //commons-cli-1.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-cli-1.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207770/commons-cli-1.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207771/sqoop-1.4.7.jar <- //sqoop-1.4.7.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/sqoop-1.4.7.jar as file:/tmp/hadoop-root/mapred/local/1645059207771/sqoop-1.4.7.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207772/parquet-format-2.2.0-rc1.jar <- //parquet-format-2.2.0-rc1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/parquet-format-2.2.0-rc1.jar as file:/tmp/hadoop-root/mapred/local/1645059207772/parquet-format-2.2.0-rc1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207773/hive-shims-0.23-2.3.2.jar <- //hive-shims-0.23-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-shims-0.23-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207773/hive-shims-0.23-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207774/parquet-hadoop-bundle-1.8.1.jar <- //parquet-hadoop-bundle-1.8.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/parquet-hadoop-bundle-1.8.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207774/parquet-hadoop-bundle-1.8.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207775/druid-processing-0.9.2.jar <- //druid-processing-0.9.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/druid-processing-0.9.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207775/druid-processing-0.9.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207776/guice-servlet-4.1.0.jar <- //guice-servlet-4.1.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/guice-servlet-4.1.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207776/guice-servlet-4.1.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207777/gson-2.2.4.jar <- //gson-2.2.4.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/gson-2.2.4.jar as file:/tmp/hadoop-root/mapred/local/1645059207777/gson-2.2.4.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207778/curator-client-2.7.1.jar <- //curator-client-2.7.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/curator-client-2.7.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207778/curator-client-2.7.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207779/jettison-1.1.jar <- //jettison-1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jettison-1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207779/jettison-1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207780/curator-x-discovery-2.11.0.jar <- //curator-x-discovery-2.11.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/curator-x-discovery-2.11.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207780/curator-x-discovery-2.11.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207781/maxminddb-0.2.0.jar <- //maxminddb-0.2.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/maxminddb-0.2.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207781/maxminddb-0.2.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207782/protobuf-java-2.5.0.jar <- //protobuf-java-2.5.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/protobuf-java-2.5.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207782/protobuf-java-2.5.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207783/hive-vector-code-gen-2.3.2.jar <- //hive-vector-code-gen-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-vector-code-gen-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207783/hive-vector-code-gen-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207784/derbyclient-10.11.1.1.jar <- //derbyclient-10.11.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/derbyclient-10.11.1.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207784/derbyclient-10.11.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207785/commons-httpclient-3.0.1.jar <- //commons-httpclient-3.0.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-httpclient-3.0.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207785/commons-httpclient-3.0.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207786/jackson-core-2.6.5.jar <- //jackson-core-2.6.5.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jackson-core-2.6.5.jar as file:/tmp/hadoop-root/mapred/local/1645059207786/jackson-core-2.6.5.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207787/extendedset-1.3.10.jar <- //extendedset-1.3.10.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/extendedset-1.3.10.jar as file:/tmp/hadoop-root/mapred/local/1645059207787/extendedset-1.3.10.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207788/jackson-core-asl-1.9.13.jar <- //jackson-core-asl-1.9.13.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jackson-core-asl-1.9.13.jar as file:/tmp/hadoop-root/mapred/local/1645059207788/jackson-core-asl-1.9.13.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207789/mysql-metadata-storage-0.9.2.jar <- //mysql-metadata-storage-0.9.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/mysql-metadata-storage-0.9.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207789/mysql-metadata-storage-0.9.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207790/jackson-jaxrs-base-2.4.6.jar <- //jackson-jaxrs-base-2.4.6.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jackson-jaxrs-base-2.4.6.jar as file:/tmp/hadoop-root/mapred/local/1645059207790/jackson-jaxrs-base-2.4.6.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207791/postgresql-9.4.1208.jre7.jar <- //postgresql-9.4.1208.jre7.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/postgresql-9.4.1208.jre7.jar as file:/tmp/hadoop-root/mapred/local/1645059207791/postgresql-9.4.1208.jre7.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207792/hive-beeline-2.3.2.jar <- //hive-beeline-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-beeline-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207792/hive-beeline-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207793/commons-vfs2-2.0.jar <- //commons-vfs2-2.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/commons-vfs2-2.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207793/commons-vfs2-2.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207794/hive-llap-ext-client-2.3.2.jar <- //hive-llap-ext-client-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-llap-ext-client-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207794/hive-llap-ext-client-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207795/aether-connector-okhttp-0.0.9.jar <- //aether-connector-okhttp-0.0.9.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/aether-connector-okhttp-0.0.9.jar as file:/tmp/hadoop-root/mapred/local/1645059207795/aether-connector-okhttp-0.0.9.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207796/classmate-1.0.0.jar <- //classmate-1.0.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/classmate-1.0.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207796/classmate-1.0.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207797/slf4j-api-1.6.1.jar <- //slf4j-api-1.6.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/slf4j-api-1.6.1.jar as file:/tmp/hadoop-root/mapred/local/1645059207797/slf4j-api-1.6.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207798/hive-cli-2.3.2.jar <- //hive-cli-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-cli-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207798/hive-cli-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207799/jackson-jaxrs-json-provider-2.4.6.jar <- //jackson-jaxrs-json-provider-2.4.6.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jackson-jaxrs-json-provider-2.4.6.jar as file:/tmp/hadoop-root/mapred/local/1645059207799/jackson-jaxrs-json-provider-2.4.6.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207800/jetty-util-9.2.5.v20141112.jar <- //jetty-util-9.2.5.v20141112.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jetty-util-9.2.5.v20141112.jar as file:/tmp/hadoop-root/mapred/local/1645059207800/jetty-util-9.2.5.v20141112.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207801/hive-service-2.3.2.jar <- //hive-service-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/hive-service-2.3.2.jar as file:/tmp/hadoop-root/mapred/local/1645059207801/hive-service-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207802/accumulo-core-1.6.0.jar <- //accumulo-core-1.6.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/accumulo-core-1.6.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207802/accumulo-core-1.6.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207803/jackson-databind-2.6.5.jar <- //jackson-databind-2.6.5.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/jackson-databind-2.6.5.jar as file:/tmp/hadoop-root/mapred/local/1645059207803/jackson-databind-2.6.5.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Creating symlink: /tmp/hadoop-root/mapred/local/1645059207804/accumulo-start-1.6.0.jar <- //accumulo-start-1.6.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: Localized file:/usr/lib/sqoop/lib/accumulo-start-1.6.0.jar as file:/tmp/hadoop-root/mapred/local/1645059207804/accumulo-start-1.6.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207521/jackson-xc-1.9.13.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207522/metrics-json-3.1.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207523/plexus-utils-3.0.15.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207524/postgresql-jdbc.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207525/commons-logging-1.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207526/super-csv-2.2.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207527/kite-data-hive-1.1.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207528/metrics-core-3.1.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207529/jsp-2.1-6.1.14.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207530/jboss-logging-3.1.3.GA.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207531/zookeeper-3.4.6.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207532/maven-settings-builder-3.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207533/eigenbase-properties-1.1.5.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207534/javax.jdo-3.2.0-m3.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207535/jetty-continuation-9.2.5.v20141112.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207536/asm-3.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207537/jackson-databind-2.3.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207538/jersey-server-1.14.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207539/antlr-runtime-3.5.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207540/jetty-sslengine-6.1.26.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207541/parquet-avro-1.6.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207542/plexus-interpolation-1.19.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207543/jta-1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207544/derbynet-10.11.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207545/asm-commons-3.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207546/mysql-connector-java-5.1.47.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207547/calcite-linq4j-1.10.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207548/calcite-core-1.10.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207549/commons-compress-1.8.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207550/javolution-5.5.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207551/HikariCP-2.5.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207552/parquet-encoding-1.6.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207553/stax-api-1.0.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207554/jackson-jaxrs-1.9.13.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207555/commons-dbcp-1.4.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207556/hive-llap-common-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207557/datanucleus-core-4.1.17.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207558/ivy-2.4.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207559/javax.el-api-3.0.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207560/ant-1.6.5.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207561/parquet-hadoop-1.6.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207562/jsp-api-2.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207563/hive-hcatalog-server-extensions-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207564/opencsv-2.3.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207565/hsqldb-1.8.0.10.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207566/aircompressor-0.3.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207567/jcodings-1.0.8.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207568/antlr4-runtime-4.5.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207569/janino-2.7.6.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207570/jackson-dataformat-smile-2.4.6.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207571/hbase-client-1.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207572/joni-2.1.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207573/icu4j-4.8.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207574/commons-math3-3.6.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207575/maven-repository-metadata-3.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207576/ant-contrib-1.0b3.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207577/metrics-core-2.2.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207578/tesla-aether-0.0.5.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207579/ant-1.9.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207580/jackson-module-jaxb-annotations-2.4.6.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207581/regexp-1.3.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207582/jersey-client-1.9.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207583/commons-io-1.4.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207584/jackson-datatype-joda-2.4.6.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207585/jline-2.12.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207586/joda-time-2.8.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207587/maven-model-3.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207588/compress-lzf-1.0.3.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207589/airline-0.7.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207590/paranamer-2.7.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207591/jdbi-2.63.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207592/maven-model-builder-3.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207593/metrics-jvm-3.1.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207594/jackson-core-2.3.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207595/druid-hdfs-storage-0.9.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207596/servlet-api-2.4.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207597/hive-druid-handler-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207598/bytebuffer-collections-0.2.5.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207599/servlet-api-2.5-6.1.14.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207600/okhttp-1.0.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207601/config-magic-0.9.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207602/geronimo-jta_1.1_spec-1.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207603/maven-scm-api-1.4.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207604/guava-14.0.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207605/hbase-hadoop2-compat-1.1.1-tests.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207606/datanucleus-rdbms-4.1.19.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207607/snappy-java-1.1.1.6.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207608/jetty-client-9.2.5.v20141112.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207609/maven-scm-provider-svn-commons-1.4.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207610/log4j-web-2.6.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207611/slider-core-0.90.2-incubating.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207612/commons-io-2.4.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207613/aether-spi-0.9.0.M2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207614/aether-util-0.9.0.M2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207615/log4j-slf4j-impl-2.6.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207616/kite-data-core-1.1.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207617/libfb303-0.9.3.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207618/mapdb-1.0.8.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207619/geronimo-annotation_1.0_spec-1.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207620/jetty-servlets-9.2.5.v20141112.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207621/pentaho-aggdesigner-algorithm-5.1.5-jhyde.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207622/mail-1.4.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207623/RoaringBitmap-0.5.18.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207624/commons-jexl-2.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207625/jasper-runtime-5.5.23.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207626/javax.inject-1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207627/hive-llap-common-2.3.2-tests.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207628/commons-compress-1.9.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207629/postgresql-metadata-storage-0.9.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207630/hbase-common-1.1.1-tests.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207631/jetty-all-7.6.0.v20120127.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207632/asm-tree-3.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207633/commons-lang3-3.4.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207634/xz-1.5.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207635/kite-data-mapreduce-1.1.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207636/jcommander-1.32.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207637/maven-settings-3.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207638/jetty-security-9.2.5.v20141112.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207639/velocity-1.5.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207640/jsp-api-2.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207641/json-1.8.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207642/groovy-all-2.4.4.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207643/parquet-generator-1.6.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207644/jetty-io-9.2.5.v20141112.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207645/disruptor-3.3.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207646/http-client-1.0.4.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207647/emitter-0.3.6.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207648/geronimo-jaspic_1.0_spec-1.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207649/javax.servlet-3.0.0.v201112011016.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207650/org.abego.treelayout.core-1.0.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207651/hive-llap-client-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207652/hbase-protocol-1.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207653/validation-api-1.1.0.Final.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207654/bonecp-0.8.0.RELEASE.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207655/hbase-common-1.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207656/calcite-druid-1.10.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207657/jsr305-3.0.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207658/hive-llap-server-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207659/jsp-api-2.1-6.1.14.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207660/hibernate-validator-5.1.3.Final.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207661/spymemcached-2.11.7.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207662/log4j-1.2-api-2.6.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207663/hbase-annotations-1.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207664/json-path-2.1.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207665/log4j-core-2.6.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207666/hive-hcatalog-core-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207667/commons-collections-3.2.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207668/avro-1.7.7.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207669/rhino-1.7R5.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207670/lz4-1.3.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207671/jetty-servlet-9.2.5.v20141112.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207672/java-util-0.27.10.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207673/hive-hplsql-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207674/aether-impl-0.9.0.M2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207675/hive-storage-api-2.4.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207676/aether-api-0.9.0.M2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207677/jersey-guice-1.19.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207678/hive-contrib-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207679/commons-lang-2.6.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207680/commons-el-1.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207681/htrace-core-3.1.0-incubating.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207682/jetty-server-9.2.5.v20141112.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207683/druid-server-0.9.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207684/httpcore-4.4.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207685/hive-service-rpc-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207686/guice-multibindings-4.1.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207687/druid-common-0.9.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207688/hive-metastore-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207689/commons-pool2-2.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207690/snappy-java-1.0.5.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207691/dropwizard-metrics-hadoop-metrics2-reporter-0.1.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207692/hive-shims-common-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207693/jackson-mapper-asl-1.9.13.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207694/druid-api-0.9.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207695/aether-connector-file-0.9.0.M2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207696/commons-math-2.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207697/avatica-1.8.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207698/log4j-api-2.6.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207699/commons-codec-1.4.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207700/datanucleus-api-jdo-4.2.4.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207701/google-http-client-jackson2-1.15.0-rc.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207702/server-metrics-0.2.8.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207703/hive-shims-scheduler-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207704/hive-testutils-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207705/transaction-api-1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207706/log4j-jul-2.5.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207707/maven-scm-provider-svnexe-1.4.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207708/jetty-proxy-9.2.5.v20141112.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207709/hbase-hadoop2-compat-1.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207710/httpclient-4.4.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207711/paranamer-2.3.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207712/parquet-column-1.6.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207713/javax.servlet-api-3.1.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207714/hive-serde-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207715/activation-1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207716/accumulo-fate-1.6.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207717/hive-jdbc-handler-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207718/commons-dbcp2-2.0.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207719/hive-shims-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207720/hive-common-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207721/jetty-util-6.1.26.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207722/commons-logging-1.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207723/javax.el-3.0.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207724/irc-api-1.0-0014.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207725/commons-pool-1.5.4.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207726/kite-hadoop-compatibility-1.1.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207727/hbase-server-1.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207728/hbase-prefix-tree-1.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207729/accumulo-trace-1.6.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207730/tempus-fugit-1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207731/avro-mapred-1.8.1-hadoop2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207732/hive-llap-tez-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207733/jdo-api-3.0.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207734/ant-launcher-1.9.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207735/jackson-jaxrs-smile-provider-2.4.6.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207736/jackson-annotations-2.6.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207737/hbase-hadoop-compat-1.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207738/commons-lang3-3.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207739/geoip2-0.4.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207740/findbugs-annotations-1.3.9-1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207741/jackson-datatype-guava-2.4.6.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207742/avatica-metrics-1.8.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207743/jamon-runtime-2.3.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207744/jpam-1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207745/ant-eclipse-1.0-jvm1.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207746/druid-console-0.0.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207747/libthrift-0.9.3.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207748/parquet-jackson-1.6.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207749/jetty-6.1.26.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207750/jackson-annotations-2.3.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207751/commons-compiler-2.7.6.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207752/jetty-http-9.2.5.v20141112.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207753/wagon-provider-api-2.4.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207754/curator-recipes-2.7.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207755/maven-aether-provider-3.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207756/netty-3.6.2.Final.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207757/hbase-procedure-1.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207758/hive-hbase-handler-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207759/netty-all-4.0.52.Final.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207760/jasper-compiler-5.5.23.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207761/curator-framework-2.7.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207762/orc-core-1.3.3.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207763/hive-jdbc-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207764/parquet-common-1.6.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207765/avro-1.8.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207766/derby-10.10.2.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207767/hive-accumulo-handler-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207768/hive-exec-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207769/ST4-4.0.4.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207770/commons-cli-1.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207771/sqoop-1.4.7.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207772/parquet-format-2.2.0-rc1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207773/hive-shims-0.23-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207774/parquet-hadoop-bundle-1.8.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207775/druid-processing-0.9.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207776/guice-servlet-4.1.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207777/gson-2.2.4.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207778/curator-client-2.7.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207779/jettison-1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207780/curator-x-discovery-2.11.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207781/maxminddb-0.2.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207782/protobuf-java-2.5.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207783/hive-vector-code-gen-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207784/derbyclient-10.11.1.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207785/commons-httpclient-3.0.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207786/jackson-core-2.6.5.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207787/extendedset-1.3.10.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207788/jackson-core-asl-1.9.13.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207789/mysql-metadata-storage-0.9.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207790/jackson-jaxrs-base-2.4.6.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207791/postgresql-9.4.1208.jre7.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207792/hive-beeline-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207793/commons-vfs2-2.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207794/hive-llap-ext-client-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207795/aether-connector-okhttp-0.0.9.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207796/classmate-1.0.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207797/slf4j-api-1.6.1.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207798/hive-cli-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207799/jackson-jaxrs-json-provider-2.4.6.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207800/jetty-util-9.2.5.v20141112.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207801/hive-service-2.3.2.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207802/accumulo-core-1.6.0.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207803/jackson-databind-2.6.5.jar
22/02/17 00:53:46 INFO mapred.LocalDistributedCacheManager: file:/tmp/hadoop-root/mapred/local/1645059207804/accumulo-start-1.6.0.jar
22/02/17 00:53:46 INFO mapreduce.Job: The url to track the job: http://localhost:8080/
22/02/17 00:53:46 INFO mapreduce.Job: Running job: job_local1603538223_0001
22/02/17 00:53:46 INFO mapred.LocalJobRunner: OutputCommitter set in config null
22/02/17 00:53:47 INFO output.FileOutputCommitter: File Output Committer Algorithm version is 1
22/02/17 00:53:47 INFO mapred.LocalJobRunner: OutputCommitter is org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter
22/02/17 00:53:47 INFO mapreduce.Job: Job job_local1603538223_0001 running in uber mode : false
22/02/17 00:53:47 INFO mapreduce.Job:  map 0% reduce 0%
22/02/17 00:53:49 INFO mapred.LocalJobRunner: Waiting for map tasks
22/02/17 00:53:49 INFO mapred.LocalJobRunner: Starting task: attempt_local1603538223_0001_m_000000_0
22/02/17 00:53:49 INFO output.FileOutputCommitter: File Output Committer Algorithm version is 1
22/02/17 00:53:49 INFO mapred.Task:  Using ResourceCalculatorProcessTree : [ ]
Thu Feb 17 00:53:49 UTC 2022 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
22/02/17 00:53:49 INFO db.DBInputFormat: Using read commited transaction isolation
22/02/17 00:53:49 INFO mapred.MapTask: Processing split: `emp_no` >= 10001 AND `emp_no` < 132501
22/02/17 00:53:49 INFO db.DBRecordReader: Working on split: `emp_no` >= 10001 AND `emp_no` < 132501
22/02/17 00:53:49 INFO db.DBRecordReader: Executing query: SELECT `emp_no`, `birth_date`, `first_name`, `last_name`, `gender`, `hire_date` FROM `employees` AS `employees` WHERE ( `emp_no` >= 10001 ) AND ( `emp_no` < 132501 )
22/02/17 00:53:50 INFO mapreduce.AutoProgressMapper: Auto-progress thread is finished. keepGoing=false
22/02/17 00:53:50 INFO mapred.LocalJobRunner:
22/02/17 00:53:51 INFO mapred.Task: Task:attempt_local1603538223_0001_m_000000_0 is done. And is in the process of committing
22/02/17 00:53:51 INFO mapred.LocalJobRunner:
22/02/17 00:53:51 INFO mapred.Task: Task attempt_local1603538223_0001_m_000000_0 is allowed to commit now
22/02/17 00:53:51 INFO output.FileOutputCommitter: Saved output of task 'attempt_local1603538223_0001_m_000000_0' to hdfs://namenode:8020/user/hive/warehouse/db_test_a/employees/_temporary/0/task_local1603538223_0001_m_000000
22/02/17 00:53:51 INFO mapred.LocalJobRunner: map
22/02/17 00:53:51 INFO mapred.Task: Task 'attempt_local1603538223_0001_m_000000_0' done.
22/02/17 00:53:51 INFO mapred.LocalJobRunner: Finishing task: attempt_local1603538223_0001_m_000000_0
22/02/17 00:53:51 INFO mapred.LocalJobRunner: Starting task: attempt_local1603538223_0001_m_000001_0
22/02/17 00:53:51 INFO output.FileOutputCommitter: File Output Committer Algorithm version is 1
22/02/17 00:53:51 INFO mapred.Task:  Using ResourceCalculatorProcessTree : [ ]
Thu Feb 17 00:53:51 UTC 2022 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
22/02/17 00:53:51 INFO db.DBInputFormat: Using read commited transaction isolation
22/02/17 00:53:51 INFO mapred.MapTask: Processing split: `emp_no` >= 132501 AND `emp_no` < 255001
22/02/17 00:53:51 INFO db.DBRecordReader: Working on split: `emp_no` >= 132501 AND `emp_no` < 255001
22/02/17 00:53:51 INFO db.DBRecordReader: Executing query: SELECT `emp_no`, `birth_date`, `first_name`, `last_name`, `gender`, `hire_date` FROM `employees` AS `employees` WHERE ( `emp_no` >= 132501 ) AND ( `emp_no` < 255001 )
22/02/17 00:53:51 INFO mapreduce.Job:  map 100% reduce 0%
22/02/17 00:53:51 INFO mapreduce.AutoProgressMapper: Auto-progress thread is finished. keepGoing=false
22/02/17 00:53:51 INFO mapred.LocalJobRunner:
22/02/17 00:53:52 INFO mapred.Task: Task:attempt_local1603538223_0001_m_000001_0 is done. And is in the process of committing
22/02/17 00:53:52 INFO mapred.LocalJobRunner:
22/02/17 00:53:52 INFO mapred.Task: Task attempt_local1603538223_0001_m_000001_0 is allowed to commit now
22/02/17 00:53:52 INFO output.FileOutputCommitter: Saved output of task 'attempt_local1603538223_0001_m_000001_0' to hdfs://namenode:8020/user/hive/warehouse/db_test_a/employees/_temporary/0/task_local1603538223_0001_m_000001
22/02/17 00:53:52 INFO mapred.LocalJobRunner: map
22/02/17 00:53:52 INFO mapred.Task: Task 'attempt_local1603538223_0001_m_000001_0' done.
22/02/17 00:53:52 INFO mapred.LocalJobRunner: Finishing task: attempt_local1603538223_0001_m_000001_0
22/02/17 00:53:52 INFO mapred.LocalJobRunner: Starting task: attempt_local1603538223_0001_m_000002_0
22/02/17 00:53:52 INFO output.FileOutputCommitter: File Output Committer Algorithm version is 1
22/02/17 00:53:52 INFO mapred.Task:  Using ResourceCalculatorProcessTree : [ ]
Thu Feb 17 00:53:52 UTC 2022 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
22/02/17 00:53:52 INFO db.DBInputFormat: Using read commited transaction isolation
22/02/17 00:53:52 INFO mapred.MapTask: Processing split: `emp_no` >= 255001 AND `emp_no` < 377500
22/02/17 00:53:52 INFO db.DBRecordReader: Working on split: `emp_no` >= 255001 AND `emp_no` < 377500
22/02/17 00:53:52 INFO db.DBRecordReader: Executing query: SELECT `emp_no`, `birth_date`, `first_name`, `last_name`, `gender`, `hire_date` FROM `employees` AS `employees` WHERE ( `emp_no` >= 255001 ) AND ( `emp_no` < 377500 )
22/02/17 00:53:52 INFO mapreduce.AutoProgressMapper: Auto-progress thread is finished. keepGoing=false
22/02/17 00:53:52 INFO mapred.LocalJobRunner:
22/02/17 00:53:52 INFO mapreduce.Job:  map 50% reduce 0%
22/02/17 00:53:53 INFO mapred.Task: Task:attempt_local1603538223_0001_m_000002_0 is done. And is in the process of committing
22/02/17 00:53:53 INFO mapred.LocalJobRunner:
22/02/17 00:53:53 INFO mapred.Task: Task attempt_local1603538223_0001_m_000002_0 is allowed to commit now
22/02/17 00:53:53 INFO output.FileOutputCommitter: Saved output of task 'attempt_local1603538223_0001_m_000002_0' to hdfs://namenode:8020/user/hive/warehouse/db_test_a/employees/_temporary/0/task_local1603538223_0001_m_000002
22/02/17 00:53:53 INFO mapred.LocalJobRunner: map
22/02/17 00:53:53 INFO mapred.Task: Task 'attempt_local1603538223_0001_m_000002_0' done.
22/02/17 00:53:53 INFO mapred.LocalJobRunner: Finishing task: attempt_local1603538223_0001_m_000002_0
22/02/17 00:53:53 INFO mapred.LocalJobRunner: Starting task: attempt_local1603538223_0001_m_000003_0
22/02/17 00:53:53 INFO output.FileOutputCommitter: File Output Committer Algorithm version is 1
22/02/17 00:53:53 INFO mapred.Task:  Using ResourceCalculatorProcessTree : [ ]
Thu Feb 17 00:53:53 UTC 2022 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
22/02/17 00:53:53 INFO db.DBInputFormat: Using read commited transaction isolation
22/02/17 00:53:53 INFO mapred.MapTask: Processing split: `emp_no` >= 377500 AND `emp_no` <= 499999
22/02/17 00:53:53 INFO db.DBRecordReader: Working on split: `emp_no` >= 377500 AND `emp_no` <= 499999
22/02/17 00:53:53 INFO db.DBRecordReader: Executing query: SELECT `emp_no`, `birth_date`, `first_name`, `last_name`, `gender`, `hire_date` FROM `employees` AS `employees` WHERE ( `emp_no` >= 377500 ) AND ( `emp_no` <= 499999 )
22/02/17 00:53:53 INFO mapreduce.AutoProgressMapper: Auto-progress thread is finished. keepGoing=false
22/02/17 00:53:53 INFO mapred.LocalJobRunner:
22/02/17 00:53:53 INFO mapred.Task: Task:attempt_local1603538223_0001_m_000003_0 is done. And is in the process of committing
22/02/17 00:53:53 INFO mapred.LocalJobRunner:
22/02/17 00:53:53 INFO mapred.Task: Task attempt_local1603538223_0001_m_000003_0 is allowed to commit now
22/02/17 00:53:53 INFO output.FileOutputCommitter: Saved output of task 'attempt_local1603538223_0001_m_000003_0' to hdfs://namenode:8020/user/hive/warehouse/db_test_a/employees/_temporary/0/task_local1603538223_0001_m_000003
22/02/17 00:53:53 INFO mapred.LocalJobRunner: map
22/02/17 00:53:53 INFO mapred.Task: Task 'attempt_local1603538223_0001_m_000003_0' done.
22/02/17 00:53:53 INFO mapred.LocalJobRunner: Finishing task: attempt_local1603538223_0001_m_000003_0
22/02/17 00:53:53 INFO mapred.LocalJobRunner: map task executor complete.
22/02/17 00:53:53 INFO mapreduce.Job:  map 100% reduce 0%
22/02/17 00:53:53 INFO mapreduce.Job: Job job_local1603538223_0001 completed successfully
22/02/17 00:53:53 INFO mapreduce.Job: Counters: 20
        File System Counters
                FILE: Number of bytes read=851136406
                FILE: Number of bytes written=859455740
                FILE: Number of read operations=0
                FILE: Number of large read operations=0
                FILE: Number of write operations=0
                HDFS: Number of bytes read=0
                HDFS: Number of bytes written=34653598
                HDFS: Number of read operations=34
                HDFS: Number of large read operations=0
                HDFS: Number of write operations=24
        Map-Reduce Framework
                Map input records=300024
                Map output records=300024
                Input split bytes=464
                Spilled Records=0
                Failed Shuffles=0
                Merged Map outputs=0
                GC time elapsed (ms)=59
                Total committed heap usage (bytes)=1087373312
        File Input Format Counters
                Bytes Read=0
        File Output Format Counters
                Bytes Written=13821993
22/02/17 00:53:53 INFO mapreduce.ImportJobBase: Transferred 33.0482 MB in 28.4262 seconds (1.1626 MB/sec)
22/02/17 00:53:53 INFO mapreduce.ImportJobBase: Retrieved 300024 records.
root@namenode:/#