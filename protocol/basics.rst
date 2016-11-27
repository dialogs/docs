Basics
======

Dialog Clients communicate to server using MQTT protocol v3.1.1.

There are two common ways of interacting with server: RPC and PubSub.

PubSub
------

Publish/Subscribe topics are used for information exchange between users, devices and server. For example, to receive typing events for a chat, device should subscribe to a topic `chats.<id>.typings`. To notifyother chat participants about its own typing event device should publish typing event in the same topic.

RPC
---

RPC topics are used for requesting information from server by client.
