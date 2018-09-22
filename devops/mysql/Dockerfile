FROM mycluster.icp:8500/default/mysql:5.5

ADD person.sql /docker-entrypoint-initdb.d/person.sql
ENV MYSQL_DATABASE persondb
