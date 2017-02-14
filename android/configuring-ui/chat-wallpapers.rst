Changing Chat Wallpapers
========================

DialogSDK allows user to select chat wallpaper (much like Viber or Telegram).

If you want to customize default image set in your application, you can use :code:`setDefaultBackgrounds` method from Dialog Style:

.. code-block:: java

    DialogSDK.get().style.setDefaultBackgrounds(R.drawable.bg_1, R.drawable.bg_2, R.drawable.bg_3);

where :code:`R.drawable.bg_1, R.drawable.bg_2, R.drawable.bg_3` are the references to resource files as per `android documentation <https://developer.android.com/guide/topics/resources/providing-resources.html>`_.

Image resources should be of the following sizes:

* LDPI: 320x320
* MDPI: 480x480
* HDPI: 800x800
* XHDPI: 1280x1280
* XXHDPI: 1600x1600
* XXXHDPI: 1920x1920

You can however disable this preference completely in your application, hiding it from the settings menu.

All you need to do is to provide *only one* drawable resource to the :code:`setDefaultBackgrounds` method:

.. code-block:: java

    DialogSDK.get().style.setDefaultBackgrounds(R.drawable.bg_1);
