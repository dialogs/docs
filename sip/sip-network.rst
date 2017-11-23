SIP Network configuration
=========================

Requirements
------------

You should make sure all TURN servers are publicly accessible from internet.

If you're using a closed premise installation, you may not need TURN servers
in case that all mobile clients are visible to each other (are not behind NAT).
However if they are not, TURN servers must be accessible from the networks that
mobile clients are in. You should also make sure turn servers are accessible
for external SIP clients (or from SIP PBX if it is in relay mode).

Your SIP Registrar server should be is accessible from the Dialog Serer.

SIP transports
--------------

Dialog SIP extension support SIP over following transports: TCP, UDP, SCTP, TLS,
WS (websocket), WSS (secure websockets).

If you're using TLS or WSS you will also need to setup a correct SSL certificate
on your SIP server.
