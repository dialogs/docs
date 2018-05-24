SIP Security
============

Signaling traffic between dialog and dialog's clients is transmitted securely
using secure and reliable dialog protocol over TLS transport.

Media traffic between dialog clients is also encrypted via TLS / DTLS (which is
proven to prevent eavesdropping, tampering, or message forgery).

In case if relay servers are used, these intermediary servers also do not have
access to the media contents and simply resend packets.

Media traffic between dialog clients and SIP clients is also secured by DTLS
(WebRTC enforces using DTLS for all media connections).

.. warning::

   Signaling traffic between dialog SIP Extension and SIP Registrar is secured
   only if you're using TLS / WSS.

   You may consider possibility of using unsecure protocols, such as TCP/UDP/WS
   if both SIP Registrar and dialog server are in private network secured
   by firewall.
