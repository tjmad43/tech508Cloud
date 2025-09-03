# Databases on AWS

## Overview
- Storing data on disk (EFS, EBS, EC2 Instance Store, S3) can have its limits
- Databases mean:
  - you can structure data
  - you build indexes to efficiently query/search through data
  - you define relationships between datasets
- Databases are optimised for a purpose and come with different features, shapes and constraints

### Relational Databases
- looks like Excel spreadsheets with links between them
- can use SQL to perform queries/lookups

### NoSQL Databses
- non-SQL = non relational databases
- purpose built for specific data models and have flexible schemas for building modern applications
- benefits:
  - flexibility: easy to evolve data model
  - scalability: designed to scale-out by using distributed clusters
  - high-performance: optimised for a specific data model
  - highly functional: types optimised for the data model
- examples: key-value, document, graph, in-memory, search databases
- data example: JSON format

### Shared Responsibility
- AWS offers to manage different databases
- benefits include:
  - quick provisioning, high availability, vertical & horizontal scaling
  - automated backup & restore, operations, upgrades
  - operating system patching is handled by AWS
  - monitoring and alerting
- note: many database technologies could be run on EC2, but you must handle the resiliency, backup, patching, high availability, fault tolerance, scaling...


## RDS
- stands for Relational Database Service
- managed DB service for DB using SQL as a query language
- allows you to create databases in the cloud that are managed by AWS
  - Postgres
  - MySQL
  - MariaDB
  - Oracle
  - Microsoft SQL Server
  - IBM DB2
  - Aurora (AWS Proprietary database)
  
### Why use RDS over deploying DB on EC2?
- RDS is a managed service:
  - automated provisioning, OS patching
  - continuous backups and restore to specific timestamp (Point in Time Restore)
  - monitoring dashboards
  - read replicas for improved read performance
  - multi AZ setup for disaster recovery
  - maintenance windows for upgrades
  - scaling capability (veritcal and horizontal)
  - storage backed by EBS
- BUT you can't SSH into DB instances

### Amazon Aurora
- Aurora is a proprietary technology from AWS (not open source)
- PostgreSQL and MySQL are both supported as Aurora DB
- "AWS cloud optimised" and claims 5x performance improvement over MySQL on RDS, over 3x the performance of PostgreSQL on RDS
- storage automatically grows in increments of 10GB, up to 128TB
- costs more than RDS (20% more) - but is more efficient
- Amazon Aurora Serverless:
  - automated database instatiation and auto-scaling based on actual usage
  - PostgreSQL and MySQL are both supported as Auroraa Serverless DB
  - no capacity planning needed
  - least management overhead
  - pay per second, can be more cost-effective
  - use cases: good for infrequent, imtermittent or unpredictable workloads


### Creating RDS Database
- go to _RDS_ -> _Databases_
- _Create database_
- _Standard create_
- Engine: MySQL
- Template: Free tier
- Master username: admin
  - set password
- Instance class set already because free tier
- Storage: 20GB GP2
  - Enable storage autoscaling
- Connectivity:
  - Compute resource: don't connect to an EC2
  - Network type = IPv4
  - Default VPC
  - Public access: Yes
  - Security group: 
    - Availability zone: No preference
    - Database port: 3306
- Database authenitication: Password
- _Create database_

### Snapshot
- _Actions_ -> _Take snapshot_
- can create new database from snapshot
- can copy to different region
- can share with other accounts

### RDS Deployments
- Read Replicas:
  - scale the read workload of your DB
  - can create up to 15  read replicas
  - data is only written to the main DB
- Multi-AZ:
  - failover in case of AZ outage (high availability)
  - data is only read/written to the main database
  - can only have 1 other AZ as failover
- Multi-Region:
  - Read Replica in other regions
  - disaster recovery in case of region issue
  - local performance for global reads
  - replication cost


## Amazon ElastiCache
- managed Redis or Memcached databases
- caches are in-memory databases with high performance and low latency
- helps reduce load off databases for read intensive workloads
- AWS takes care of OS maintenance/patching, optimisations, setup, configuration, monitoring, failure recovery and backups

## DynamoDB
- fully managed highly available with replication across 3 AZ
- NoSQL database
- scales to massive workloads, distributed "serverless" database
- millions of requests per second, trillions of rows, 100s of TB storage
- fast and consistent in performance
- single-digit millisecond latency - low latency retrieval
- integrated with IAM for security, authorisation and administration
- low cost and auto scaling capabilities
- Standard & Infrequent Access (IA) Table Class
- key/value database

### DynamoDB Accelerator - DAX
- fully managed in-memory cache for DynamoDB
- 10x performance improvement
  - single digit millisecond latency to microseconds latency when accessing DynamoDB tables
- secure, highly scalable & highly available
- difference with ElastiCache at the CCP level: DAX is only used for and is iintegrated with DynamoDB, while ElastiCache can be used for other databases

### Create DynamoDB
- Parition key: user_id
- Default settings
- _Create table_
- table is created without creating database first - serverless
- _View items_
- _Create item_
  - add attributes and values
  - _Create item_

### Global Tables
- make a DynamoDB table accessible with low latency in multiple regions
- Active-Active replication (read/write to any AWS region)

## Redshift
- based on PostgreSQL, but not used for OLTP
- OLAP - online analytical processing (analytics and data warehousing)
- load data once every hour, not every second
- 10x better performance than other data warehouses, scale to PBs of data
- columnar storage of data (instead of row based)
- Massively Parallel Query Execution (MPP), highly available
- pay as you go based on the instances provisioned
- has an SQL interface for performing the queries
- BI tools such as AWS Quicksight or Tableau integrate with it

### Redshift Servelerless
- automatically provisions and scales data warehouse underlying capacity
- run analytics workloads without managing data warehouse infrastructure
- pay only for what you use (save costs)
- use cases: reporting, dashboarding applications, real-time analytics

## Other Databases
### Amazon EMR
- Elastic MapReduce
- helps creating Hadoor clusters (Big Data) to analyse and process vast amounts of data
- clusters can be made of hundreds of EC2 instances
- also supports Apache Spark, HBase, Presto, Flink
- EMR takes care of all provisioning and configuration
- auto-scaling and integrated with Spot instances
- use cases: data processing, machine learning, web indexing, big data

### Amazon Athena
- serverless query service to perform analytics against S3 objects
- uses standard SQL language to query files
- supports CSV, JSON, ORC, Avro and Parquet (build on Presto)
- pricing: $5.00 per TB of data scanned
- use compressed or columnar data for cost savings (less scan)
- use cases: buisiness intelligence/analytics/reporting, analyse & query VPC Flow Logs, ELB Logs, CloudTrail trails etc
- exam tip: analyse data in S3 using serverless SQL, use 

### Amazon QuickSight
- serverless machine learnign-powered business intelligence service to create interactive dashboards
- fast, automatically scalable, embeddable, with per-session pricing
- use cases:
  - business analytics
  - building visualisations
  - perform ad-hoc analysis
  - get business insights using data
- integrated with RDS, Aurora, Athena, Redshift, S3...
  
### DocumentDB
- AWS implementation of MongoDB
- used to store, query and index JSON data
- similar "deployment concepts" as Aurora
- fully managed, highly available with replication across 3 AZ
- storage automatically grows in incremennts of 10GB
- automatically scales to workloads with millions of requests per second

### Amazon Neptune
- fully managed graph database
- a popular graph dataset would be a social network:
  - users have friends
  - posts have comments
  - comments have likes from users
  - users share and like posts
- highly available across 3 AZ, with up to 15 read replicas
- build and run applications working with highly connected datasets - optimised for these complex and hard queries
- can store up to billions or relations and query the graph with millisecond latency
- highly available with replications across multiple AZs
- great for knowledge graphs (e.g. Wikipedia), fraud detection, recommendation engines, social networking

### Amazon Timestream
- fully managed, fast, scalable, serverless time series database
- automatically scales up/down to adjust capacity
- store and analyse trillions of events per day
- 1000s times faster & 1/10th the cost of relational databases
- built-in time series analytics function (helps you identify patterns in your data in near real-time)

### Amazon Managed Blockchain
- Blockchain makes it possible to build applications where multiple parties can execute transactions without the need for a trusted, central authority
- Amazon Managed Blockchain is a managed service to:
  - join public blockchain networks
  - or creatae your own scalable private network
- compatible with the frameworks Hyperledger Fabric & Ethereum

### AWS Glue
- managed extract, transform and load (ETL) service
- useful to prepare and transform data for analytics
- fully serverless service
- Glue Data Catalog: catalog of datasets
  - can be used by Athena, Redshift, EMR

## DMS - Database Migration Service
- quickly and securely migrate databases to AWS, resilient, self healing
- the source database remains available during the migration
- supports:
  - homogenous migrations: e.g. Oracle to Oracle
  - heterogeneous migrations: e.g. Microsoft SQL Server to Aurora

## Summary
- Relational Databases- OLTP: RDS & Aurora (SQL)
- Differences between Multi-AZ, Read Replicas, Multi-Region
- In-memory Database: ElastiCache
- Key/Value Database: DynamoDB (serverless) & DAX (cache for DynamoDB)
- Warehouse- OLAP: Redshift (SQL)
- Hadoop Cluster: EMR
- Athena: quesry data on Amazon S3 (serverless & SQL)
- QuickSight: dashboards on your data (serverless)
- DocumentDB: "Aurora for MongoDB" (JSON - NoSQL database)
- Amazon Managed Blockchain: managed Hyperledger Fabric & Ethereum blockchains
- Glue: Managed ETL (Extract Transform Load) and Data Catalog service
- Database Migration: DMS
- Neptune: graph database
- Timestream: time-series database