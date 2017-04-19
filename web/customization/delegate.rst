.. _delegate:

Web SDK delegate
----------------

.. class:: Delegate

  Delegate allows you to set up visible or cosmetic changes.

    .. data:: appName

      The application name

    .. data:: appLinks

      Links to your applications:
      :code:`ios`, :code:`android`, :code:`windows`, :code:`macos`, :code:`linux`.

    .. data:: features

      +------------------+---------+-----------------------------------------------------------+
      | Feature          | Default | Description                                               |
      +==================+=========+===========================================================+
      | experimental     | false   | Enable this if you wish to checkout experimental features |
      +------------------+---------+-----------------------------------------------------------+
      | gender           | true    | Allows the user to select a gender                        |
      +------------------+---------+-----------------------------------------------------------+
      | channels         | true    | Enable channels support                                   |
      +------------------+---------+-----------------------------------------------------------+
      | reactions        | false   | Enable messages reactions                                 |
      +------------------+---------+-----------------------------------------------------------+
      | videoCalls       | false   | Enable video calls support                                |
      +------------------+---------+-----------------------------------------------------------+
      | groupCalls       | false   | Enable group calls support                                |
      +------------------+---------+-----------------------------------------------------------+
      | globalSearch     | true    | Enable global search                                      |
      +------------------+---------+-----------------------------------------------------------+
      | messagesSearch   | false   | Enable messages search                                    |
      +------------------+---------+-----------------------------------------------------------+
      | typingInToolbar  | true    | Show chat typing instead chat online inside ChatToolbar   |
      +------------------+---------+-----------------------------------------------------------+
      | typingInMessages | false   | Show chat typing under all messages                       |
      +------------------+---------+-----------------------------------------------------------+
      | dialogsOnline    | false   | Show online status of each dialog                         |
      +------------------+---------+-----------------------------------------------------------+
      | contactList      | true    | Enable contact list in the Sidebar                        |
      +------------------+---------+-----------------------------------------------------------+
      | callsHistory     | false   | Enable calls history list in the Sidebar                  |
      +------------------+---------+-----------------------------------------------------------+
