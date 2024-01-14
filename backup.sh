#!/bin/bash

# docker run --rm --volumes-from mysql-kc -v $(pwd):/backup busybox tar cvf /backup/mysql-kc.tar /var/lib/mysql
# docker run --rm --volumes-from keycloak-w -v $(pwd):/backup busybox tar cvf /backup/realm-data.tar /opt/jboss/keycloak/standalone/data

# docker run --rm --volumes-from mysql-kc -v $(pwd):/backup busybox sh -c "cd /var/lib/mysql && tar xvf /backup/backup.tar --strip 1"
# maybe tar xvf inside the _data folder?