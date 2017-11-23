SIP Security
============

Signaling traffic between dialog and dialog's clients is transmitted securely
using TLS encryption (which is proven to prevent eavesdropping, tampering,
or message forgery).

Media traffic between dialog clients and TURN servers is also encrypted via
TLS / DTLS.

Media traffic between dialog clients and SIP clients is secured by DTLS
(WebRTC enforces using DTLS for all media connections).

.. warning::

   Signaling traffic between dialog SIP Extension and SIP Registrar is secured
   only if you're using TLS / WSS.

   You may consider possibility of using unsecure protocols, such as TCP/UDP/WS
   if both SIP Registrar and dialog server are in private network secured
   by firewall.
