Integration with Existing Apps
==============================

With a few steps, you can add messenger based features, screens, views, etc.
 

Prerequisites
-------------

For the correct project compilation follow the instructions for building apps from the :ref:`Getting Started section <create_project>` to configure your development environment.

.. note:: library supports API level >= 16 (Android 4.1) 

We use `Multidex <https://developer.android.com/reference/android/support/multidex/MultiDex.html/>`_ to avoid the 64K methods limit. So,
you need to implement it in your project:
set multiDexEnabled to true in your module-level build.gradle file and add the multidex library as a dependency:
	   
.. code-block:: groovy

  android {
      defaultConfig {
     	...
     	minSdkVersion 15 
      	targetSdkVersion 26
      	multiDexEnabled true   
      }
  }
  
  dependencies {
 	 compile 'com.android.support:multidex:1.0.1'
  }
	   

If you do override the Application class, change it to extend MultiDexApplication (if possible) as follows:

:code:`public class MyApplication extends MultiDexApplication`

or override the attachBaseContext() method instead and call MultiDex.install(this) to enable multidex:

.. code-block:: java

	public class MyApplication extends SomeOtherApplication {
 	 @Override
 	 protected void attachBaseContext(Context base) {
  	   super.attachBaseContext(base);
  	   MultiDex.install(this);
 	 }
	}


Possible issues
---------------

* *No resource found that matches the given name*

The problem usually appears when different versions of the same library present within the application. In this case, different versions of support library.

If you don't see them in your gradle file, then they are probably added as dependencies. Run the following in terminal, to see the dependencies for each library:

:code:`./gradlew app:dependencies`

Then, find the libraries that use old versions of appcompat and update / remove, whatever suits you.


* *Attribute android.support.v4.content.FileProvider@authorities value=(@string/provider_authority) from AndroidManifest.xml:	is also present at [im.dlg:android-sdk:version_name] AndroidManifest.xml*
	
If you implemented any of providers, add :code:`tools:replace="android:authorities"` to `<provider>` element at `AndroidManifest.xml` to override string values.



Adding Dialog to your app
-------------------------

First, initialize messenger by executing in onCreate() in your Application class :code:`DialogSDK.get().initilize(application)` .

Simple example:

.. code-block:: java

    DialogSDK dialogSDK = DialogSDK.get();
    dialogSDK.setEndpoints("your custom endpoint");
    dialogSDK.setCanChangeEndpoints(true);
    dialogSDK.setForwardsEnabled(true);
    ...
    dialogSDK.initialize(this);

You can find more information about configuration possibilities in :ref:`basic application configuration section <basic_configuration>`


Entry point activity can be started with method from DialogSDK class:
 
:code:`DialogSDK.get().startMessagingApp(activity, token)`

You need to specify token for end-to-end authorization as a second parameter.

To check messenger login state use :code:`messenger().isLoggedIn` .


There are 3 activity screens for each section:

DialogsActivity 
  Screen with user private and group dialogs 

ContactsActivity 
  Screen with list of contacts imported from device address book 
  
CallHistoryActivity 
  Screen with user's calls history 
    
  




