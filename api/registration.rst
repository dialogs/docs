Device Registration
=======

Right after instalation client should register itself on the server.

First of all client should geenrate a randomly generated string. It should consist of 32 characters from set ``[a-zA-Z0-9]``. This string then shoud aways been used as an MQTT ClientId.

Secure way of generating a ClientId in Java:

.. code-block:: java

	static final String AB = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	static SecureRandom rnd = new SecureRandom();

	String randomString(int len) {
	   StringBuilder sb = new StringBuilder(len);
	   
	   for(int i = 0; i < len; i++) 
	      sb.append(AB.charAt(rnd.nextInt(AB.length())));

	   return sb.toString();
	}

Secure way of generating a ClientId in Swift:

.. code-block:: swift

	func randomString(length: Int) -> String {

	    let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	    let len = UInt32(letters.length)

	    var randomString = ""

	    for _ in 0 ..< length {
	        let rand = arc4random_uniform(len)
	        var nextChar = letters.character(at: Int(rand))
	        randomString += NSString(characters: &nextChar, length: 1) as String
	    }

	    return randomString
	}

The next step is to introduce yourself to server. Client makes a **Handshake** request to topic *ClientId*/registration. Server responds with an unique client token which should be used as a *Password* MQTT option for further sessions.

After device registration client have to create new session.

.. warning:: Both ClientId and token should be stored in a secured persistent storage.

.. warning::

	Server should be configured to hook up client connection and allow connection on one of the following conditions:

	1. *ClientId* is not registered on server, this is the new client going to register
	2. *ClientId* is registered on server, token is present in *Password* field and valid for this *ClientId*

.. literalinclude:: /schema/registration.proto
	:language: protobuf