Creating a new call
===================

The call begins with sending a :code:`rpc DoCall` request:

.. code-block:: protobuf

	rpc DoCall(OutPeer peer, msec timeout) returns (int64 callId, busId eventBusId, randomId deviceId) {
	}

The server creates a new call an event bus for it, and returns call id and event bus id to the caller. Having the event bus id, the caller can subscribe to it to receive further updates on call state.

Next the server sends an :code:`IncomingCall` update to the callee:

.. code-block:: protobuf

	update IncomingCall(int64 callId, opt<int32> updateIndex) {
	}

Since updates do not provide any delivery guarantees, this update may be sent / received multiple times.

The callee then performs :code:`rpc GetCallInfo` to the server in order to get additional information on the call:

.. code-block:: protobuf

	rpc GetCallInfo(int64 callId) returns (Peer peer, list<GroupOutPeer> eventBusId, list<UserOutPeer> eventBusId, busId eventBusId) {
	}

After this request, the caller can also connect to the event bus of the call.

At this stage, both peers are on the same event bus and they are able to establish session.

However, the callee still has not answered to the call and it is in the ringing state. To answer, the callee should send a :code:`rpc JoinCall`:

.. code-block:: protobuf

	rpc JoinCall(int64 callId) returns Void {
	}
