SIP Architecture
================

.. image:: hla.png

As most of VoIP systems do, dialog decouples signaling (such as call
state messages, invite / answer information, etc) and media traffic (audio/video
streams). We use SIP signaling for external integrations, OPUS/PCMA/PCMU for
audio and VP8 for video.

If you want your clients to be able to call from different networks (basically
in every case if you want to call from internet), you will also need to setup
an ICE server (TURN).

SIP Signaling
-------------

Dialog SIP extension works as a back to back user agent (B2BUA), i.e. it
registers on a SIP server on behalf of the end user, translates and forwards SIP
commands to the dialog clients.

Media traffic
-------------

Dialog SIP extension does not perform any media transcodings and expects SIP
clients to understand clients media (which is WebRTC).

NAT traversal
-------------

Interactive Connectivity Establishment (ICE) Protocol is used for NAT
transversal. ICE uses a combination of methods including Session Traversal Utility
for NAT (STUN) and Traversal Using Relay NAT (TURN). The presence of a Network
Address Translator (NAT) presents problems for Voice over IP
(VoIP) and WebRTC implementations.
