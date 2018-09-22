FROM mycluster.icp:8500/default/mysql:latest

ADD person.sql /docker-entrypoint-initdb.d/person.sql
ENV MYSQL_DATABASE persondb
