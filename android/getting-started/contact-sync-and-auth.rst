.. _contact-sync-and-auth:

Contact sync and authorization
==============================

First, make sure you change the application name :code:`@string/app_name` and icon.

Create a file named sync_and_auth.xml in your android res/xml folder with the following content:

.. code-block:: xml

    <?xml version="1.0" encoding="utf-8"?>
    <resources>
        <string name="constant_account_type">im.dlg.develop.contacts</string>
        <string name="constant_mime_type_call">vnd.android.cursor.item/im.dlg.develop.call</string>
        <string name="constant_mime_type_write">vnd.android.cursor.item/im.dlg.develop.write</string>
    </resources>

Modify the file as follows:

1. Provide a value for :code:`constant_account_type` (replace :code:`im.dlg.develop` with your actual application package name).

2. Provide a value for :code:`constant_mime_type_call` (replace :code:`im.dlg.develop` with your actual application package name).

3. Provide a value for :code:`constant_mime_type_write` (replace :code:`im.dlg.develop` with your actual application package name).

Then you need to create a file with name contacts.xml in your res/xml folder:

.. code-block:: xml

    <?xml version="1.0" encoding="utf-8"?>
    <ContactsAccountType xmlns:android="http://schemas.android.com/apk/res/android" >
        <ContactsDataKind
            android:mimeType="vnd.android.cursor.item/im.dlg.develop.write"
            android:icon="@mipmap/ic_launcher"
            android:summaryColumn="data2"
            android:detailColumn="data3" />
        <ContactsDataKind
            android:mimeType="vnd.android.cursor.item/im.dlg.develop.call"
            android:icon="@mipmap/ic_launcher"
            android:summaryColumn="data2"
            android:detailColumn="data3" />
    </ContactsAccountType>

You only need to edit the :code:`mimeType` parameters to match the values you've specified earlier.

Now you can enable authorization and conact sync in SDK:

.. code-block:: java
    
    DialogSDK.get().setAndroidAccountSyncEnabled(true);

