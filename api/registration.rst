Registration
=======

Right after instalation client should register itself on the server.

First of all client should geenrate a randomly-generated UUID and use it as a ClientId field of all MQTT sessions.

The next step is to introduce yourself to server. Client makes a **Handshake** request to topic *ClientId*/registration. Server responds with an unique client token which should be used as a prefix for all topics which are restricted to this client only.

.. warning:: Both clientId and token should be stored in a secured persistent storage.

.. literalinclude:: /schema/registration.proto
	:language: protobuf