Incoming webhooks
-----------------

Incoming webhooks provide basic API to post messages to Dialog Server via
HTTP. They mostly follow `Slack API <https://api.slack.com/incoming-webhooks>`_
with exception to rich message formatting and attachments support.

Webhook is a server method exposed via HTTP API, that is -- each webhook has
it's own unique URL and a request format specification which it is capable to
process. This URL contains a token that map the webhook to a certain group/channel
inside Dialog Server along with it's access rights. Hence, webhook is bound to a
certain group/channel.

Webhook URL could be obtained via web interface by users with admin rights
in the group/channel -- in group/channel window, click encircled "I" button,
then click on "Integration link" tab -- you will see a webhook's URL.

Sending messages
````````````````

In order to send/post a message to Dialog Server one should make an ``POST`` HTTP
request to webhook's URL. The request's ``Content-Type`` should be either:

* ``application/json`` in which case the request data is sent in JSON format
* ``application/x-www-form-urlencoded`` in which case the request data is sent in a ``payload`` form field as URL-escaped JSON data.

The ``payload`` is an JSON object with required ``text`` field containing text
of a message that has to be posted to a group/channel bound to this particular
webhook.

Server will respond to such request following standard HTTP response schema:

* In case of any error during request processing appropriate status code will be returned along with "Failure" text.
* In case of normal process result ``200 OK`` will be returned.

Example
.......

Suppose, we've obtained a webhook URL ``https://example.dlg.im/v1/webhooks/30d58ab6fd6a68c81a76f1126162d8e874b655d1785a1c69726ef81abc293ae1``.

.. code-block:: bash

  curl -X POST -H "Content-Type: application/json" \
  --data '{"text": "Hello from webhook"}' \
  https://example.dlg.im/v1/webhooks/30d58ab6fd6a68c81a76f1126162d8e874b655d1785a1c69726ef81abc293ae1

This should post ``Hello from webhook`` to a webhook's group/channel.

The same result can be obtained using form data:

.. code-block:: bash

  curl -X POST \
  --data-urlencoded 'payload={"text": "Hello from webhook"}' \
  https://example.dlg.im/v1/webhooks/30d58ab6fd6a68c81a76f1126162d8e874b655d1785a1c69726ef81abc293ae1
