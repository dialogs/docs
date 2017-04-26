.. _google-services:

Google Services
===============

Maps
----

To activate google services you need to retrieve maps api key from `Google API Console <https://console.developers.google.com/>`_
and add the following element in ``AndroidManifest`` as a child of the <application> element,
by inserting it just before the closing </application> tag:

.. code-block:: xml

  <meta-data
            android:name="com.google.android.geo.API_KEY"
            android:value="YOUR_API_KEY" />

Push notifications
------------------

A push notification is a way for an app to send you a message or to notify you without you actually opening the app. Dialog heavily
realies on push notifications to present incoming messages and calls, so it is crucially important to configure them correctly.

We use `Firebase <https://firebase.google.com/>`_ to deliver push notifications for Android.

To setup Firebase, you'll first need to create an account for your organization (or sign in using an existing Google id). Then you need
to create a new application in the `Firsebase Console <https://console.firebase.google.com/?pli=1>`_ and fill in the package name field. Please note that the package name must be equal to the app package name from your ``build.gradle``.

On the next page you will need to download the ``google-services.json`` file. The file should be placed along with the ``build.gradle``
file of your android application (i.e. the gradle file containing ``apply plugin: 'com.android.application'``).

You also need to edit the ``build.gradle`` file of your app. The actual guide can be found `here <https://firebase.google.com/docs/android/setup>`_.

