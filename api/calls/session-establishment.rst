Session establishment
=====================

Session establishment is based on two updates: :code:`Answer/Offer`. Whenever a peer wants to add or remove a new media stream, it modifies its :code:`PeerConnection` and sends an :code:`Offer` (usually containing media codec and network information) to the bus:

.. code-block:: protobuf

  struct Offer as WebRTCSignaling(randomId sessionId, string sdp, PeerSettings ownPeerSettings) {
  }

The remote peer receives the message and checks whether it can satisfy the offer and answers with an :code:`Answer` message:


.. code-block:: protobuf

  struct Answer as WebRTCSignaling(randomId sessionId, string sdp) {
  }

The :code:`Offer/Answer` exchange may be performed several times until both peers reach an agreement on the media session. After that the media connection itself can be created.

Usually the session negotiation happens after the callee clicks on answer button, but Dialog also can establish session in advance using the preconnection property. 
