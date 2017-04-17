Customization
========================

Icons
-------
App launcher icon
  prefer to be located in mipmap-dpi folders. 
  Also, specify ``android:icon`` value in AndroidManifest ``<application>`` tag.

Notification icon
  add as trivial drawable in res folder.
  Further, this icon will be sent to NotificationManager 
  through our custom builder.
  
  .. note::  Icon should be added with a constant name **ic_app_notify** 
  

Colors
-------

To decorate app simply add appropriate colors in hexadecimal format (blue theme used by default).
It is very convinent to use `google color tool <https://material.io/color/>`_ to comply with official guidelines.

*Root colors*

.. code-block:: xml

    <color name="primary">#CC3033</color>
    <color name="primary_hovered">#B72B2E</color>
    <color name="primary_pressed">#CC3033</color>
    <color name="primary_text">#FBDF6C</color>

    <color name="primary_alt">#FBDF6C</color>
    <color name="primary_alt_alpha">#CCFBDF6C</color>
    <color name="primary_alt_hovered">#FBDF6C</color>
    <color name="primary_alt_pressed">#FBDF6C</color>

    <color name="accent">#d94335</color>
    <color name="accent_hovered">#b3372c</color>
    <color name="accent_pressed">#ca4a3f</color>

    <color name="secondary">#eeeeee</color>
    <color name="white">#FFFFFF</color>
    <color name="secondary_selected">#33999999</color>
    <color name="secondary_pressed">#66999999</color>

*Root text colors*

.. code-block:: xml

    <color name="text_primary">#DE000000</color>
    <color name="text_secondary">#7A000000</color>
    <color name="text_hint">#42000000</color>
    <color name="text_subheader">#6F000000</color>

    <color name="text_primary_inv">#DEffffff</color>
    <color name="text_secondary_inv">#8Affffff</color>
    <color name="text_hint_inv">#42ffffff</color>
    <color name="text_subheader_inv">#8Fffffff</color>
	
*Main screen and fab button*

.. code-block:: xml

	<color name="main_tab_selected">@color/primary_alt</color>
	<color name="main_tab_divider">#15000000</color>
	<color name="main_tab_text">@color/primary_alt</color>
	<color name="main_fab_bg">#ccffffff</color>
	
.. note:: You can find full color methods list in ``DialogStyle`` class.



Changing Chat Wallpapers
-------

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
