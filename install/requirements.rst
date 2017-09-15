Requirements
============
Software for any environments:

* Linux (Debian, Ubuntu) kernel version 3.10 or higher / OS X
* `Docker (*-ce) <https://www.docker.com/community-edition#/download>`_

Mini installations
-------------------
This is a preview version designed to familiarize
All components runs in one server. Can be support up to 100-300 users

Addition software:

* `docker-compose (1.11+) <https://docs.docker.com/compose/install/>`_

Hardware
~~~~~~~~
* 8 cores CPU
* 16 GB RAM
* 3 External IP/NAT
* external LAN ports:
    * tcp: 80, 443
    * tcp: 3478
    * tcp: 49152-65535
    * udp: 3478
    * udp: 49152-65535
    * tcp: 8010, 8011

Small installations
-------------------
Distributed to multiple servers installation. Supports up to 500-1000 users

Hardware
~~~~~~~~
Web, proxy, etc services
""""""""""""""""""""""""
Two servers for proxy each with different external IP or one server with two external IP

* 2 cores CPU
* 2 GB RAM
* external LAN ports:
    * tcp: 80,443


One server for web services

* 2 cores CPU
* 4 GB RAM
* external IP
* external LAN ports:
    * tcp: 80,443

Server for voice and push services (can be installed on the same server with proxy servers)

* 2 cores CPU
* 2 GB RAM
* external IP
* external LAN ports:
    * turns-server:
        * tcp: 3478
        * tcp: 49152-65535
        * udp: 3478
        * udp: 49152-65535
    * push-server:
        * tcp: 8010, 8011

Dialog Server & DBs
"""""""""""""""""""
Requirements for Dialog Server

* 4 cores CPU
* 8 GB RAM
* 100 GB HDD
* internal LAN ports:
    * tcp: 9090, 9080, 9070

Postgres

* 4 cores CPU
* 4 GB RAM
* 500 GB SSD
* internal LAN ports:
    * tcp: 6432, 5432

Cassandra 1 or 3 servers

* 4 cores CPU
* 8 GB RAM
* 50+ GB HDD
* 256+ GB SSD
* internal LAN ports:
    * tcp: 7000, 7001, 7199, 9042, 9160, 9142


File S3 api compatible storage (optional)
"""""""""""""""""""""""""""""""""""""""""
The server can also store files on local or network (NFS, Gluster, etc) file system. Possible integration with AWS, GCloud.

Self hosted S3 api (Ceph)

RADOS gateway, ceph-admin, ceph-deploy

* 2 cores CPU
* 4 GB RAM
* 240 GB SSD
* internal LAN ports:
    * tcp: 80, 7480, 443, 2003, 4505-4506

Storage servers

OSD, mon, mgr 1 or 3 servers

* 4 cores CPU
* 4 GB RAM
* 50+ GB HDD
* 1024+ GB HDD
* internal LAN ports:
    * tcp: 80, 7480, 443, 2003, 4505-4506, 6789, 6800-7300


Production installations
------------------------
Distributed to multiple servers installation. Supports up to 1000+ users

Hardware
~~~~~~~~
Web, proxy, etc services
""""""""""""""""""""""""
Two servers for proxy each with different external IP or one server with two external IP

* 2 cores CPU
* 2 GB RAM
* external LAN ports:
    * tcp: 80,443


One server for web services

* 2 cores CPU
* 4 GB RAM
* external IP
* external LAN ports:
    * tcp: 80,443

Server for voice and push services

* 2 cores CPU
* 2 GB RAM
* external IP
* external LAN ports:
    * turns-server:
        * tcp: 3478
        * tcp: 49152-65535
        * udp: 3478
        * udp: 49152-65535
    * push-server:
        * tcp: 8010, 8011

Dialog Server & DBs
"""""""""""""""""""
Requirements for Dialog Server

* 8 cores CPU
* 16 GB RAM
* 100 GB HDD
* internal LAN ports:
    * tcp: 9090, 9080, 9070

Postgres

* 8 cores CPU
* 8 GB RAM
* 500 GB SSD
* internal LAN ports:
    * tcp: 6432, 5432

Cassandra 3 servers

* 8 cores CPU
* 16 GB RAM
* 50+ GB HDD
* 256+ GB SSD
* internal LAN ports:
    * tcp: 7000, 7001, 7199, 9042, 9160, 9142


File S3 api compatible storage (optional)
"""""""""""""""""""""""""""""""""""""""""
The server can also store files on local or network (NFS, Gluster, etc) file system. Possible integration with AWS, GCloud.

Self hosted S3 api (Ceph)

RADOS gateway, ceph-admin, ceph-deploy

* 2 cores CPU
* 4 GB RAM
* 240 GB SSD
* internal LAN ports:
    * tcp: 80, 7480, 443, 2003, 4505-4506

Storage servers

OSD, mon, mgr 1 or 3 servers

* 8 cores CPU
* 16 GB RAM
* 50+ GB HDD
* 1024+ GB HDD
* internal LAN ports:
    * tcp: 80, 7480, 443, 2003, 4505-4506, 6789, 6800-7300
