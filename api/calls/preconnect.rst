What the preconnection is?
==========================

The preconnection flag enables the media connection (i.e. video and audio) before actually answering to the call. The technique is used to mitigate delays between answering the call (when the user presses answer button) and starting audio itself (when the user starts to hear the remote party), because the session negotiation is rather long operation.

On the protocol level, it means that :code:`NeedOffer` and :code:`Offer` messages are exchanged before calling to :code:`rpc JoinCall`.
