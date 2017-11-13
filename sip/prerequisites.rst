SIP Integration Prerequisites
=============================

The current version of the dialog SIP module assumes:

1. You have a SIP registrar server

The dialog SIP module cannot interact with other sip clients directly, because
it acts as a back to back user agent (B2BUA).

2. Your SIP server must support WebRTC

WebRTC is an open real time communications standart. Two important components
of the standart are:

  1. `OPUS <https://opus-codec.org/>`_ codec for audio and `VP8 <https://en.wikipedia.org/wiki/VP8>`_ codec for video

  2. NAT and firewall traversal technology, using STUN, ICE, TURN, RTP-over-TCP and support for proxies

Your SIP server should support following WebRTC options:

  1. ``bundlePolicy`` = ``balanced``

  2. ``rtcpMuxPolicy`` = ``require``
