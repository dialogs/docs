Security
========

Signaling traffic between dialog and dialog's clients is transmitted securely
using secure and reliable dialog protocol over TLS transport.

Media traffic between dialog clients is also encrypted via TLS / DTLS (which is
proven to prevent eavesdropping, tampering, or message forgery).

In case if relay servers are used, these intermediary servers do not have
access to the media content and simply resend packets.
