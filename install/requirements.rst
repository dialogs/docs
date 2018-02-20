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

Cloud service
~~~~~~~~
* AWS: t2.2xlarge
* DO: 32 GB/8 vCPUs/640 GB/7 TB Standard Droplets or 16 GB/8 vCPUs/100 GB/5 TB Optimized Droplets

Network
~~~~~~~~
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

Web, proxy, etc services
""""""""""""""""""""""""
Two servers for proxy each with different external IP or one server with two external IP

Hardware
~~~~~~~~
* 2 cores CPU
* 2 GB RAM

Cloud service
~~~~~~~~
* AWS: t2.medium
* DO: 4 GB/2 vCPUs/80 GB/4 TB Standard Droplets or 4 GB/2 vCPUs/25 GB/5 TB Optimized Droplets

Network
~~~~~~~~
* external LAN ports:
    * tcp: 80,443


One server for web services

Hardware
~~~~~~~~
* 2 cores CPU
* 4 GB RAM

Cloud service
~~~~~~~~
* AWS: t2.medium
* DO: 4 GB/2 vCPUs/80 GB/4 TB Standard Droplets or 4 GB/2 vCPUs/25 GB/5 TB Optimized Droplets

Network
~~~~~~~~
* external IP
* external LAN ports:
    * tcp: 80,443

Server for voice and push services (can be installed on the same server with proxy servers)

Hardware
~~~~~~~~
* 2 cores CPU
* 2 GB RAM

Cloud service
~~~~~~~~
* AWS: t2.medium
* DO: 4 GB/2 vCPUs/80 GB/4 TB Standard Droplets or 4 GB/2 vCPUs/25 GB/5 TB Optimized Droplets

Network
~~~~~~~~
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

Hardware
~~~~~~~~
* 4 cores CPU
* 8 GB RAM
* 100 GB HDD

Cloud service
~~~~~~~~
* AWS: t2.xlarge
* DO: 8 GB/4 vCPUs/160 GB/5 TB Standard Droplets or 16 GB/8 vCPUs/100 GB/5 TB Optimized Droplets

Network
~~~~~~~~
* internal LAN ports:
    * tcp: 9090, 9080, 9070

Postgres

Hardware
~~~~~~~~
* 4 cores CPU
* 4 GB RAM
* 500 GB SSD

Cloud service
~~~~~~~~
* AWS: t2.xlarge with 500GB SSD
* DO: 8 GB/4 vCPUs/160 GB/5 TB Standard Droplets with 500 GB block storage or 8 GB/4 vCPUs/50 GB/5 TB Optimized Droplets with 500 GB block storage 

Network
~~~~~~~~
* internal LAN ports:
    * tcp: 6432, 5432

Cassandra 1 or 3 servers

Hardware
~~~~~~~~
* 4 cores CPU
* 8 GB RAM
* 50+ GB HDD
* 256+ GB SSD

Cloud service
~~~~~~~~
* AWS: t2.xlarge with 500GB SSD
* DO: 8 GB/4 vCPUs/160 GB/5 TB Standard Droplets with 500 GB block storage or 8 GB/4 vCPUs/50 GB/5 TB Optimized Droplets with 500 GB block storage 

Network
~~~~~~~~
* internal LAN ports:
    * tcp: 7000, 7001, 7199, 9042, 9160, 9142

File S3 api compatible storage (optional)
"""""""""""""""""""""""""""""""""""""""""
The server can also store files on local or network (NFS, Gluster, etc) file system. Possible integration with AWS, GCloud.

Self hosted S3 api (Ceph)

RADOS gateway, ceph-admin, ceph-deploy

Hardware
~~~~~~~~
* 2 cores CPU
* 4 GB RAM
* 240 GB SSD

Cloud service
~~~~~~~~
* AWS: t2.medium with 240GB SSD
* DO: 4 GB/2 vCPUs/80 GB/4 TB Standard Droplets with 250 GB block storage or 4 GB/2 vCPUs/25 GB/5 TB Optimized Droplets with 250 GB block storage 

Network
~~~~~~~~
* internal LAN ports:
    * tcp: 80, 7480, 443, 2003, 4505-4506

Storage servers

OSD, mon, mgr 1 or 3 servers

Hardware
~~~~~~~~
* 4 cores CPU
* 4 GB RAM
* 50+ GB HDD
* 1024+ GB HDD

Cloud service
~~~~~~~~
* AWS: t2.xlarge with 1024GB SSD
* DO: 8 GB/4 vCPUs/160 GB/5 TB Standard Droplets with 1000 GB block storage or 8 GB/4 vCPUs/50 GB/5 TB Optimized Droplets with 1000 GB block storage 

Network
~~~~~~~~
* internal LAN ports:
    * tcp: 80, 7480, 443, 2003, 4505-4506, 6789, 6800-7300

Small installations with failover
-------------------
Distributed to multiple servers installation. Supports up to 500-1000 users

Web, proxy, etc services
""""""""""""""""""""""""
Two or more servers for HA with external IP

Hardware
~~~~~~~~
* 2 cores CPU
* 2 GB RAM

Cloud service
~~~~~~~~
* AWS: t2.medium
* DO: 4 GB/2 vCPUs/80 GB/4 TB Standard Droplets or 4 GB/2 vCPUs/25 GB/5 TB Optimized Droplets 

Network
~~~~~~~~
* 1 external IP
* external LAN ports:
    * tcp: 80,443, 8010, 8011


Two or more servers for web services

Hardware
~~~~~~~~
* 2 cores CPU
* 4 GB RAM

Cloud service
~~~~~~~~
* AWS: t2.medium
* DO: 4 GB/2 vCPUs/80 GB/4 TB Standard Droplets or 4 GB/2 vCPUs/25 GB/5 TB Optimized Droplets

Network
~~~~~~~~
* internal LAN ports:
    * tcp: 80,443

Two or more voice servers

Hardware
~~~~~~~~
* 2 cores CPU
* 2 GB RAM

Cloud service
~~~~~~~~
* AWS: t2.medium
* DO: 4 GB/2 vCPUs/80 GB/4 TB Standard Droplets or 4 GB/2 vCPUs/25 GB/5 TB Optimized Droplets

Network
~~~~~~~~
* 1 external IP
* external LAN ports:
    * tcp: 3478
    * tcp: 49152-65535
    * udp: 3478
    * udp: 49152-65535

Server for push notifications

Hardware
~~~~~~~~
* 2 cores CPU
* 2 GB RAM

Cloud service
~~~~~~~~
* AWS: t2.medium
* DO: 4 GB/2 vCPUs/80 GB/4 TB Standard Droplets or 4 GB/2 vCPUs/25 GB/5 TB Optimized Droplets

Network
~~~~~~~~
* internal LAN ports:
    * tcp: 8010, 8011

Dialog Server & DBs
"""""""""""""""""""

3 x Dialog Server (or more by formula (2 x N) + 1 )

Hardware
~~~~~~~~
* 4 cores CPU
* 8 GB RAM
* 100 GB HDD

Cloud service
~~~~~~~~
* AWS: t2.xlarge with 100GB SSD
* DO: 8 GB/4 vCPUs/160 GB/5 TB Standard Droplets or 8 GB/4 vCPUs/50 GB/5 TB Optimized Droplets with 100 GB block storage 

Network
~~~~~~~~
* internal LAN ports:
    * tcp: 9090, 9080, 9070

2 x Postgres

Hardware
~~~~~~~~
* 4 cores CPU
* 4 GB RAM
* 500 GB SSD

Cloud service
~~~~~~~~
* AWS: t2.xlarge with 500GB SSD
* DO: 8 GB/4 vCPUs/160 GB/5 TB Standard Droplets with 500 GB block storage or 8 GB/4 vCPUs/50 GB/5 TB Optimized Droplets with 500 GB block storage 

Network
~~~~~~~~
* internal LAN ports:
    * tcp: 6432, 5432

3 x Cassandra

Hardware
~~~~~~~~
* 4 cores CPU
* 8 GB RAM
* 50+ GB HDD
* 256+ GB SSD

Cloud service
~~~~~~~~
* AWS: t2.xlarge with 256GB SSD
* DO: 8 GB/4 vCPUs/160 GB/5 TB Standard Droplets with 250 GB block storage or 8 GB/4 vCPUs/50 GB/5 TB Optimized Droplets with 250 GB block storage 

Network
~~~~~~~~
* internal LAN ports:
    * tcp: 7000, 7001, 7199, 9042, 9160, 9142


File S3 api compatible storage (optional)
"""""""""""""""""""""""""""""""""""""""""
The server can also store files on local or network (NFS, Gluster, etc) file system. Possible integration with AWS, GCloud.

Self hosted S3 api (Ceph)

RADOS gateway, ceph-admin, ceph-deploy

Hardware
~~~~~~~~
* 2 cores CPU
* 4 GB RAM
* 240 GB SSD

Cloud service
~~~~~~~~
* AWS: t2.medium with 240GB SSD
* DO: 4 GB/2 vCPUs/80 GB/4 TB Standard Droplets with 250 GB block storage or 4 GB/2 vCPUs/25 GB/5 TB Optimized Droplets with 250 GB block storage 

Network
~~~~~~~~
* internal LAN ports:
    * tcp: 80, 7480, 443, 2003, 4505-4506

Storage servers

OSD, mon, mgr 1 or 3 servers

Hardware
~~~~~~~~
* 4 cores CPU
* 4 GB RAM
* 50+ GB HDD
* 1024+ GB HDD

Cloud service
~~~~~~~~
* AWS: t2.xlarge with 1024GB SSD
* DO: 8 GB/4 vCPUs/160 GB/5 TB Standard Droplets with 1000 GB block storage or 8 GB/4 vCPUs/50 GB/5 TB Optimized Droplets with 1000 GB block storage 

Network
~~~~~~~~
* internal LAN ports:
    * tcp: 80, 7480, 443, 2003, 4505-4506, 6789, 6800-7300


Production installations
------------------------
Distributed to multiple servers installation. Supports up to 1000+ users

Web, proxy, etc services
""""""""""""""""""""""""
Two servers for proxy each with different external IP or one server with two external IP

Hardware
~~~~~~~~
* 2 cores CPU
* 2 GB RAM

Cloud service
~~~~~~~~
* AWS: t2.medium
* DO: 4 GB/2 vCPUs/80 GB/4 TB Standard Droplets or 4 GB/2 vCPUs/25 GB/5 TB Optimized Droplets

Network
~~~~~~~~
* external LAN ports:
    * tcp: 80,443


One server for web services

Hardware
~~~~~~~~
* 2 cores CPU
* 4 GB RAM

Cloud service
~~~~~~~~
* AWS: t2.medium
* DO: 4 GB/2 vCPUs/80 GB/4 TB Standard Droplets or 4 GB/2 vCPUs/25 GB/5 TB Optimized Droplets

Network
~~~~~~~~
* external IP
* external LAN ports:
    * tcp: 80,443

Server for voice and push services

Hardware
~~~~~~~~
* 2 cores CPU
* 2 GB RAM

Cloud service
~~~~~~~~
* AWS: t2.medium
* DO: 4 GB/2 vCPUs/80 GB/4 TB Standard Droplets or 4 GB/2 vCPUs/25 GB/5 TB Optimized Droplets

Network
~~~~~~~~
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

Hardware
~~~~~~~~
* 8 cores CPU
* 16 GB RAM
* 100 GB HDD

Cloud service
~~~~~~~~
* AWS: t2.2xlarge with 100GB SSD
* DO: 32 GB/8 vCPUs/640 GB/7 TB Standard Droplets or 16 GB/8 vCPUs/100 GB/5 TB Optimized Droplets 

Network
~~~~~~~~
* internal LAN ports:
    * tcp: 9090, 9080, 9070

Postgres

Hardware
~~~~~~~~
* 8 cores CPU
* 8 GB RAM
* 500 GB SSD

Cloud service
~~~~~~~~
* AWS: t2.2xlarge with 512GB SSD
* DO: 32 GB/8 vCPUs/640 GB/7 TB Standard Droplets or 16 GB/8 vCPUs/100 GB/5 TB Optimized Droplets with 500 GB block storage 

Network
~~~~~~~~
* internal LAN ports:
    * tcp: 6432, 5432

Cassandra 3 servers

Hardware
~~~~~~~~
* 8 cores CPU
* 16 GB RAM
* 50+ GB HDD
* 256+ GB SSD

Cloud service
~~~~~~~~
* AWS: t2.2xlarge with 256GB SSD
* DO: 32 GB/8 vCPUs/640 GB/7 TB Standard Droplets or 16 GB/8 vCPUs/100 GB/5 TB Optimized Droplets with 250 GB block storage 

Network
~~~~~~~~
* internal LAN ports:
    * tcp: 7000, 7001, 7199, 9042, 9160, 9142


File S3 api compatible storage (optional)
"""""""""""""""""""""""""""""""""""""""""
The server can also store files on local or network (NFS, Gluster, etc) file system. Possible integration with AWS, GCloud.

Self hosted S3 api (Ceph)

RADOS gateway, ceph-admin, ceph-deploy

Hardware
~~~~~~~~
* 2 cores CPU
* 4 GB RAM
* 240 GB SSD

Cloud service
~~~~~~~~
* AWS: t2.medium with 240GB SSD
* DO: 4 GB/2 vCPUs/80 GB/4 TB Standard Droplets or 4 GB/2 vCPUs/25 GB/5 TB Optimized Droplets with 250 GB block storage 

Network
~~~~~~~~
* internal LAN ports:
    * tcp: 80, 7480, 443, 2003, 4505-4506

Storage servers

OSD, mon, mgr 1 or 3 servers

Hardware
~~~~~~~~
* 8 cores CPU
* 16 GB RAM
* 50+ GB HDD
* 1024+ GB HDD

Cloud service
~~~~~~~~
* AWS: t2.2xlarge with 1024GB SSD
* DO: 32 GB/8 vCPUs/640 GB/7 TB Standard Droplets with 1000 GB block storage or 16 GB/8 vCPUs/100 GB/5 TB Optimized Droplets with 1000 GB block storage 

Network
~~~~~~~~
* internal LAN ports:
    * tcp: 80, 7480, 443, 2003, 4505-4506, 6789, 6800-7300
