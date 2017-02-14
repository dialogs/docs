Definition language
-------------------

RPC over MQTT is based around the idea of defining a service, specifying the methods that can be called remotely with their parameters and return types.
Dialog uses `protocol buffers <https://developers.google.com/protocol-buffers/>`_ as the Interface Definition Language (IDL) for describing both the service interface and the structure of the payload messages (`gRPC-style <https://grpc.io>`_).

.. literalinclude:: /api/schema/examples/simple-rpc.proto

gRPC lets you define four kinds of service method:

- Unary RPCs where the client sends a single request to the server and gets a single response back, just like a normal function call.

.. code-block:: protobuf

	rpc SayHello(HelloRequest) returns (HelloResponse){
	}

- Server streaming RPCs where the client sends a request to the server and gets a stream to read a sequence of messages back. The client reads from the returned stream until there are no more messages.

.. code-block:: protobuf

	rpc LotsOfReplies(HelloRequest) returns (stream HelloResponse){
	}

- Client streaming RPCs where the client writes a sequence of messages and sends them to the server, again using a provided stream. Once the client has finished writing the messages, it waits for the server to read them and return its response.

.. code-block:: protobuf

	rpc LotsOfGreetings(stream HelloRequest) returns (HelloResponse) {
	}

- Bidirectional streaming RPCs where both sides send a sequence of messages using a read-write stream. The two streams operate independently, so clients and servers can read and write in whatever order they like: for example, the server could wait to receive all the client messages before writing its responses, or it could alternately read a message then write a message, or some other combination of reads and writes. The order of messages in each stream is preserved.

.. code-block:: protobuf

	rpc BidiHello(stream HelloRequest) returns (stream HelloResponse){
	}


