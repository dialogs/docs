Wire Format
===========

This document serves as a detailed description for an implementation of RPC carried over MQTT. It assumes familiarity with the MQTT 3.1.1 specification.
Recommended way of learning MQTT is reading `MQTT Essentials Wrap-Up <https://www.hivemq.com/blog/mqtt-essentials/>`_ at HiveMQ blog.

Outline
-------

The following is the general sequence of message atoms in a RPC request & response message stream

* Request → EOS
* Response → EOS

Request and response must go to the same topic. Commonly topic name matches a service name described in gRPC way.

Requests
--------

* Request → EOS

Request is delivered as an MQTT message serialized with protobuf and has the following structure:

.. literalinclude:: /schema/common.proto
	:language: protobuf
	:lines: 12-19

``body`` as an `Any <https://developers.google.com/protocol-buffers/docs/proto3#any>`_ type. 
Its ``typeUrl`` field should match method name and value should be a serialized request body.

So for service defined like this:

.. literalinclude:: /schema/examples/simple-rpc.proto

request may go to ``/my-cool-service`` with body ``typeUrl`` equal to ``SayHello`` and body value equal to serialized ``HelloRequest``.

.. todo:: Define a convention of naming header according to a service name.

``shortcut`` is optional and serves as a shortcut to a method name. If header is defined and both client and server know that such shortcut relates to a specific method name it's allowed to not define body ``typeUrl``. This technic allows to save some bytes send on the wire for frequent requests.

.. todo:: shortcut example

For requests, ``eos`` (end-of-stream) is indicated by the presence of the ``eos`` flag of the last received ``Request``.
Setting ``eos`` to false assumes that client will send the next request of the same type as part of streamed Request.
For non-streamed requests ``eos`` field is not being taken into account.

In the MQTT semantics messages are completely independent units which don't relate to each other. That raises two issues:

- Having received a response in topic it's not clear to which request the response belongs.
- Having streamed request it's not clear which request stream the exact stream part (``Request``) belongs to.

That's when the ``correlation_id`` field is used. We are going to set it to an unique value for every request. If request is streamed, each ``Request`` message should contain the same ``correlation_id``. Later, when we receive a message client will look at this property, and based on thet we'll be able to match a response with a request.
If we see an unknown ``correlation_id`` value, we may safely discard the message - it doesn't belong to our requests. But such situations should be logged in noticeable way.

``timeout`` indicates that the request should be handed in the specified duration of time. If not present, server uses default timeout specified in it's own settings.

``timeout_unit`` tells in which unit ``timeout`` is measured. Possible values are ``Hour``, ``Minute``, ``Second``, ``Millisecond``.

Responses
---------

* Response → EOS

Response is delivered the same way as Request and has the following structure:

.. literalinclude:: /schema/common.proto
	:language: protobuf
	:lines: 12-16

As discussed above, ``correlation_id`` field is used to indicate that this response belongs to a Request with the same ``correlation_id``. 
Like Request, ``eos`` field marks response as a final response of streamed response. For non-streamed responses ``eos`` field is not being taken into account. 
``body contains`` serialized request body.

.. note:: We don't need **Any** with its ``typeUrl`` here because Response type is alredy defined in service schema

.. todo:: Error reporting