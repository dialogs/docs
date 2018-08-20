Java Bot SDK
============

Messaging
---------

Starting the bot

.. code-block:: java

  import im.dlg.botsdk.Bot;
  import java.util.concurrent.ExecutionException;
  
  public class Main {
  
      public static void main(String[] args) throws InterruptedException, ExecutionException {
          
          Bot bot = Bot.start("your_bot_token").get();
          
          // Your BOT logic here!
          
          // Await to prevent thread to die
          bot.await();
      }
  }
  

To subscribe on messages call the following api of 'messaging':

.. code-block:: java
  
  ...
  bot.messaging().onMessage(message -> {
      // Handle incoming messages here
  });
  ...


You can send a message to some Peer (that you get from message or saved previously):

.. code-block:: java

  ...
  Peer peer = ...
  CompletableFuture<UUID> future = bot.messaging().send(peer, "My awesome text");
  ...

Api method returns the future and you chain requests or handle errors

.. code-block:: java

  ...
  future.thenAccept(uuid -> {
      // uuid is a message id
  }).exceptionally(ex -> {
      ex.printStackTrace();
      return null;
  });
  ...

Simple ping-pong example:

.. code-block:: java

  bot.messaging().onMessage(message ->
          bot.users().get(message.getSender()).thenAccept(userOpt -> userOpt.ifPresent(user -> {
                      System.out.println("Got a message: " + message.getText() + " from user: " + user.getName());
                  })
          ).thenCompose(aVoid ->
                  bot.messaging().send(message.getPeer(), "Reply to : " + message.getText())
          ).thenAccept(uuid ->
                  System.out.println("Sent a message with UUID: " + uuid)));


.. image:: assets/bots_ping_pong_example.png


Interactive elements
--------------------

Sending buttons with specific labels and IDs:

.. code-block:: java

  ...
  Peer peer = ...
  List<InteractiveAction> actions = new ArrayList<>();

  actions.add(new InteractiveAction("button_one", new InteractiveButton("button_one", "button_one")));
  actions.add(new InteractiveAction("button_two", new InteractiveButton("button_two", "button_two")));

  InteractiveGroup group = new InteractiveGroup(actions);

  return bot.interactiveApi().send(peer, group);
  ...

With the following result:

.. image:: assets/bots_simple_buttons.png

Subscribe to events by the interactiveApi() :

.. code-block:: java

  ...
  bot.interactiveApi().onEvent(evt -> {
     // Handle events here
  });
  ...

evt object contains widget id and pressed value

.. image:: assets/bots_handled_evt_debug.png


Update interactive elements
---------------------------

By updating interactive elements you can implement menu and other interesting things

.. code-block:: java
        
  bot.interactiveApi().onEvent(evt -> {

      List<InteractiveAction> actions = new ArrayList<>();

      actions.add(new InteractiveAction("button_one_2", new InteractiveButton("button_one_2", "button_one_ch")));
      actions.add(new InteractiveAction("button_two_2", new InteractiveButton("button_two_2", "button_two_ch")));

      InteractiveGroup groupNew = new InteractiveGroup(actions);

      CompletableFuture<UUID> updateFuture = bot.interactiveApi().update(evt.getMid(), groupNew);
   });


Here is how it looks:

.. image:: assets/bots_buttons_change.gif



