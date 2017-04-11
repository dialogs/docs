Install and configure Asterisk PBX
==================================

Dialog platform supports seamless interconnection between PBXs and Dialog clients, allowing you to make calls from SIP directly to Dialog. Below is the example configuration of the Asterisk PBX to use with Dialog platform.

.. note::

   This tutorial written for Ubuntu 16.04.2, Asterisk 14.4.0 and Asterisk's chan_sip channel driver.

Download and unpack Asterisk 14.4.0:

.. code-block:: bash

   wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-12-current.tar.gz
   tar -zxvf asterisk-14-current.tar.gz

Resolve dependencies:

.. code-block:: bash

   cd asterisk-14.4.0/contrib/scripts/
   sudo ./install_prereq install
   sudo ./install_prereq install-unpackaged

Install Asterisk:

.. code-block:: bash

   cd ../..
   ./configure && make menuselect

In the menu, please make sure that the following options are checked (marked with *****):

.. code-block:: bash

   Channel Drivers -> chan_pjsip and chan_sip
   Resource Modules -> res_srtp, res_crypto and res_http_websocket

After verifying things are as needed in menuselect, build and install Asterisk (it may take a while)

.. code-block:: bash

   make && sudo make install && sudo make samples

Change the access permission to the instaled folders (replace dialog with your actual user name):

.. code-block:: bash

   sudo chown -R dialog: /var/lib/asterisk
   sudo chown -R dialog: /var/log/asterisk
   sudo chown -R dialog: /var/run/asterisk
   sudo chown -R dialog: /var/spool/asterisk
   sudo chown -R dialog: /usr/lib/asterisk
   sudo chown -R dialog: /etc/asterisk
   sudo chmod -R u=rwX,g=rX,o= /var/lib/asterisk
   sudo chmod -R u=rwX,g=rX,o= /var/log/asterisk
   sudo chmod -R u=rwX,g=rX,o= /var/run/asterisk
   sudo chmod -R u=rwX,g=rX,o= /var/spool/asterisk
   sudo chmod -R u=rwX,g=rX,o= /usr/lib/asterisk
   sudo chmod -R u=rwX,g=rX,o= /dev/dahdi
   sudo chmod -R u=rwX,g=rX,o= /etc/asterisk

Edit the /etc/asterisk/rtp.conf file:

.. code-block:: bash

   [general]
   rtpstart=10000
   rtpend=20000
   icesupport=yes
   stunaddr=stun.l.google.com:19302

The setup for the dialog clients will be familiar to those who have configured Asterisk to support WebRTC. You can reuse your webrtc config. Edit the /etc/asterisk/sip.conf file (replace the realm with your actual domain name or ip address)

.. code-block:: bash

   [general]
   udpbindaddr=0.0.0.0:5060
   realm=sip.dialog.im
   transport=udp,ws

   [dialog](!)
   host=dynamic
   type=friend
   context=from-internal
   avpf=yes
   icesupport=yes
   dtlsenable=yes
   dtlsverify=no
   dtlscertfile=/etc/asterisk/keys/asterisk.pem
   dtlscafile=/etc/asterisk/keys/ca.crt
   dtlssetup=actpass

   [8000](dialog)
   username=8000
   secret=8000

   [8001](dialog)
   username=8001
   secret=8001

Edit the /etc/asterisk/etensions.conf file:

.. code-block:: bash

   [default]

   [from-internal]
   exten => 1000,1,Answer()
   same => n,Playback(demo-congrats)
   same => n,Hangup()

   exten => 1001,1,Answer()
   same => n,Echo()
   same => n,Hangup()

   exten => _XXXX,1,DIAL(SIP/${EXTEN})

If you're going to use websocket connection, edit the /etc/asterisk/http.conf file:

.. code-block:: bash

   [general]
   enabled=yes
   bindaddr=0.0.0.0
   bindport=8088

You will also need to generate certificates to use with TLS/SRTP (replace sip.dialog.im with your actual domain name):

.. code-block:: bash

   mkdir /etc/asterisk/keys
   cd asterisk-14.4.0/contrib/scripts/
   ./ast_tls_cert -C sip.dialog.im -O "Dialog SIP" -d /etc/asterisk/keys
