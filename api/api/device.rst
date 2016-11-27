Device Registration
===================

Right after instalation client should register itself on the server.
To do this it picks a ClientId which is a randomly-generated UUID and registers itself by calling RegisterDevice method. Server responds with clientId and token.

Both clientId and token should be stored in a secured persistent storage.

After device is registered client should put clientId to a clientId MQTT option and token to a password MQTT option.

.. literalinclude:: /schema/device.proto
	:language: protobuf