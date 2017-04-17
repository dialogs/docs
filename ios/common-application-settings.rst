.. _common-application-settings-ios-label:

Common application settings
===========================

For the full operation of the dialog SDK, you need a number settings and of user permissions in Info.plist. Some settings are necessary to get a review in the App Store.


Custom URL scheme
-----------------

Custom URL-scheme is necessary for correct work with the invitation links (see the section :ref:`Invitation links <invitation-links-protocol-label>` for more details). The application notifies iOS that it can handle links with a given schema. For example, if a user clicks on a link inside e-mail or web-site page like

.. code-block:: html

    mymessenger://mycompany.com/joinChat?shortname=coolChannel

then he can immediately open a coolChannel chat in the messenger. To do this, you need to set the following values in **Info.plist**:

.. code-block:: xml

    <key>CFBundleURLTypes</key>
    <array>
      <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLName</key>
        <string>com.mycompany.mymessenger</string>
        <key>CFBundleURLSchemes</key>
        <array>
          <string>mymessenger</string>
        </array>
      </dict>
    </array>


Push Notifications and Background modes
---------------------------------------

sorry, the section is under construction

.. image:: assets/common-application-settings/capabilities-push-notifications.jpg
   :width: 600 px
   :align: center

Permission usage descriptions
------------------------------

sorry, the section is under construction

Slyle
-----

sorry, the section is under construction