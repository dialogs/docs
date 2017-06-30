Leaving the call
================

The call terminates when any of its participants decides to end it, or when one of them is disconnected (due to network problems).

In the first case the session stopper sends an :code:`rpc DisposeEventBus` to destroy the call bus:

.. code-block:: protobuf

  rpc DisposeEventBus(busId id) returns Void {
  }

The server destroys the bus and notifies the remote part that the bus has been destroyed, effectively ending the call on that client. In the second case, the server detects that the client has silently left the event bus and destroys the event bus itself.
