SIP Integration Guide
=====================


Prerequisites
-------------

The current version of the dialog SIP module assumes:

1. You have a SIP registrar server

The dialog SIP module cannot interact with other sip clients directly.

2. WebRTC must be configured as following:

  1. Audio codecs are `OPUS <https://opus-codec.org/>`_ (the recommended one) or
     PCMA/PCMU, video codec is `VP8 <https://en.wikipedia.org/wiki/VP8>`_

  2. ICE (Interactive Connectivity Establishment) is enabled to perform NAT traversal

  3. ``bundlePolicy`` = ``balanced``

  4. ``rtcpMuxPolicy`` = ``require``

Basic configuration
-------------------

1. Obtain the latest version of the dialog SDK + SIP extension docker image

2. Make sure you have ``modules.sip.extension = "im.dlg.sip.extension.SipExtension"`` in your server.conf file

3. Create mappings from SIP users to dialog users

  1. Connect to the dialog PostgreSQL using ``psql -h x.x.x.x``

  2. Insert all sip users you want to map into the ``sip_user_mappings`` table, fields are:

    1. ``sip_user`` -- sip user id
    2. ``sip_password`` passowrd for the user
    3. ``sip_host`` -- sip host address for the user
    4. ``sip_port`` -- sip port for the user
    5. ``sip_parameters`` -- sip parameters in JSON format.

      * for tcp: ``{"transport": "tcp"}``
      * for udp: ``{"transport": "udp"}``
      * for websockets: ``{"transport": "ws", "method":"GET"}``
      * for secure websockets: ``{"transport": "wss", "method":"GET"}``

      Replace method parameter value with the correct verb used to establish http websocket connection.

    6. ``sip_headers`` -- additional config in JSON format.

      * for tcp/udp: ``{}``
      * for websockets / secure websockets: ``{"host": "example.com:port", "location": "/index"}``.

      Replace ``example.com`` with HTTP address to open websocket connection.
      Replace ``/index`` with HTTP path to open websocket connection. If the path is ``/``, the ``location`` parameter can be omitted.

    7. ``peer_type`` -- a peer type in dialog

    Set this field to ``1`` for dialog users.

    8. ``peer_id`` -- a peer id in dialog
    9. ``peer_str_id`` -- the field is not used now, leave blank
    10. ``register`` -- whether this mapping will be registered on the SIP server
    11. ``can_call`` -- whether this mapping can be used to perform outgoing calls (i.e. dialog -> SIP)
    12. ``can_be_called`` -- whether this mapping can be used to perform incoming calls (i.e SIP -> dialog)

4. Restart the server if necessary

Additional configuration
------------------------

1. Set ``modules.sip.trace-level = 32`` in ``server.conf`` to enable extra logging
2. Set ``modules.sip.dialog-ignore-contact-field = true`` in ``server.conf`` to ignore ``Contact:`` field and always use ``To:`` and ``From:`` for routing instead
3. Set ``modules.sip.register.expires = 30 minutes`` (or any other time interval) in ``server.conf`` to configure ``Expires:`` header in SIP ``REGISTER`` message
4. Set ``modules.sip.register.interval = 30 minutes`` (or any other time interval) in ``server.conf`` to change time interval between ``REGISTER`` messages

Create SIP users automatically
------------------------------

dialog SIP extension allows to automatically register newly created dialog users on the SIP server.
To enable this feature, you shoud:

1. Set ``modules.sip.autocreate.on = true`` in ``server.conf``
2. Set ``modules.sip.autocreate.host``, ``modules.sip.autocreate.port``, ``modules.sip.autocreate.headers``, ``modules.sip.autocreate.register`` as in sip user mappings table

After these steps, when a new dialog users gets created, it will be automatically registered on the SIP server udner its user id, i.e. newly created dialog user with id 434 will be register as ``sip:434@example.com``.

You can specify a prefix for such users, for example newly created dialog user with id 434 will be register as ``sip:dialog434@example.com``. To enable this feature, add ``modules.sip.autocreate.user-prefix`` to the ``server.conf``.
