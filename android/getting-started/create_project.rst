Create new project
========================

Download or clone Sdk repository:

.. code-block:: html

	https://bitbucket.transmit.im/projects/DLG/repos/repository_name/

For better performance, we highly recommend to use Android Studio.


Gradle setup
-------

First, create new project (File - New - New Project) , then add the following
lines into :code:`repositories` section of your gradle file:

.. code-block:: groovy

    maven {
        url "http://dialog.bintray.com/android-sdk"
        credentials {
            username bintrayUser
            password bintrayPassword
        }
    }

.. note::  
	Our SDK repository is private, so you need to obtain correct credentials for authorization from our developers.

	You can specify them directly in the gradle file (albeit it is not recommended) or in the special file called
	``gradle.properties`` in the root of your gradle project (create it if it does not exist):

	+------------------+----------------------------+
	| bintrayUser	   | Account name on `bintray`_ |
	+------------------+----------------------------+
	| bintrayPassword  | Api key                    |
	+------------------+----------------------------+

	.. _bintray: https://bintray.com/

	.. image:: resources/gradle_properties.png
		:width: 300pt

Having the repository set up, you should add these lines into the :code:`dependencies` section of your gradle file:

.. code-block:: groovy

    compile "im.dlg:android-sdk:${dialogSdkVersion}"
    compile "im.dlg:android-google-push:${dialogSdkVersion}"
    compile "im.dlg:android-google-maps:${dialogSdkVersion}"

Use the actual version number instead of :code:`${dialogSdkVersion}`.




Set up Application class
-------

Now, create application class in your source set directory (java/kotlin) and inherit it from ``DialogSDKApplication``.
This class class include MultiDex support and ``ConfigurationBuilder``
initialization (such as platform type, time zone, notification provider etc.).

``Application.java`` example:

.. code-block:: java

	public class Application extends DialogSDKApplication {
   	 		@Override
    		public void onConfigureDialogSDK() {
       	 		DialogSDK dialogSDK = DialogSDK.get();
       	 		dialogSDK.setAppName("My Messenger");
      	  		dialogSDK.setHomePage("http://mymessenger.im");
   		}
	}

Almost done!

For server and other flexible settings, such as app calls, pushes, delegates and more, 
please visit :ref:`app configuration section <basic_configuration>` next.



