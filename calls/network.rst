SIP Network configuration
=========================

ICE servers
-----------

Interactive Connectivity Establishment (ICE) Protocol is used for NAT
transversal. ICE uses a combination of methods including Session Traversal Utility
for NAT (STUN) and Traversal Using Relay NAT (TURN). The presence of a Network
Address Translator (NAT) presents problems for Voice over IP
(VoIP) and WebRTC implementations.

You should make all ICE servers publicly accessible from internet.

If you're using a closed premise installation, you may not need TURN servers
in case that all mobile clients are visible to each other (are not behind NAT).
However if they are not, TURN servers must be accessible from the networks that
mobile clients are in.
