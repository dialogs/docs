.. _basic_configuration:

Basic application configuration
===============================

Initial settings
----------------

``DialogSDK`` is the base configuration structure class, which contains parameters for your needs.
To use them properly, override ``onConfigureDialogSDK`` method in Application class.
To get static DialogSDK instance call ``DialogSDK.get()``.

**Mandatory** parameters for proper application startup:

+--------------+---------------------------------------------------------------------------+
|    appName   |                  global variable to identify application                  |
+--------------+---------------------------------------------------------------------------+
|   inviteUrl  |                   used for intents with sharing invites                   |
+--------------+---------------------------------------------------------------------------+
|   endpoints  | server endpoints, accept communications back and forth across the network |
+--------------+---------------------------------------------------------------------------+
|    pushId    |            unique push id for registering google notifications            |
+--------------+---------------------------------------------------------------------------+
| callsEnabled |                        set true for enabling calls                        |
+--------------+---------------------------------------------------------------------------+

Secondary parameters:

+---------------------------+-------------------------------------------------------------------------+
| appVersion                | show specific app version at the bottom line of profile settings        |
+---------------------------+-------------------------------------------------------------------------+
| homePage                  | app homepage link, show at the bottom line of profile settings          |
+---------------------------+-------------------------------------------------------------------------+
| fastShareEnabled          | fast share chat interface                                               |
+---------------------------+-------------------------------------------------------------------------+
| delegate                  | use delegates for custom screens and UI parts.                          |
+---------------------------+-------------------------------------------------------------------------+
| tosUrl                    | terms of service url                                                    |
+---------------------------+-------------------------------------------------------------------------+
| privacyUrl                | privacy policy url                                                      |
+---------------------------+-------------------------------------------------------------------------+
| channelsEnabled           | messaging channels. True by default                                     |
+---------------------------+-------------------------------------------------------------------------+
| isKeepAliveEnabled        | send broadcast with action KeepAliveReceiver.ACTION_START               |
+---------------------------+-------------------------------------------------------------------------+
| isEmailAuthEnabled        | enable auth by email. True by default                                   |
+---------------------------+-------------------------------------------------------------------------+
| androidAccountSyncEnabled | if true, all new contacts will be inserted into the device contact list |
+---------------------------+-------------------------------------------------------------------------+
| authType                  | binary mask for auth type                                               |
+---------------------------+-------------------------------------------------------------------------+
| defaultBackgrounds        | array of backgrounds used in chats                                      |
+---------------------------+-------------------------------------------------------------------------+


``Application`` example:

.. code-block:: java

	public class Application extends DialogSDKApplication {
	    @Override
	    public void onConfigureDialogSDK() {
	        DialogSDK dialogSDK = DialogSDK.get();
	        dialogSDK.setAppName("My Messenger");
	        dialogSDK.setDelegate(new YourAppDelegate());

	        dialogSDK.setHomePage("http://mymessenger.im");
	        dialogSDK.setInviteUrl("http://mymessenger.im");

	        dialogSDK.setPushId(9999999L);
	        dialogSDK.setCallsEnabled(true);
	        dialogSDK.setFastShareEnabled(true);

	        DialogSDK.get().setAppVersion("app: " + BuildConfig.VERSION_NAME);

	        DialogSDK.get().setEndpoints(
	                "tls://front1.mymessenger.im",
	                "tls://front2.mymessenger.im");
	    }


	    private class YourAppDelegate extends BaseDialogSDKDelegate {
	        @Override
	        public boolean isBubbleColored() {
	            return true;
	        }
	    }
	}

Start activity
--------------

There are two prepared classes in SDK: 

-  ``im.dlg.sdk.MainActivity``, from which app starts 
-  ``im.dlg.sdk.DefaultStartActivity``, which corresponds to start screen 

However, you should specify MainActivity with intent-filter in ``AndroidManifest`` of your app as default one .

.. code-block:: xml

	    <activity
	        android:name="im.sdk.MainActivity" 
	        android:label="@string/app_name">
		    <intent-filter>
            	<action android:name="android.intent.action.MAIN" />
            	<category android:name="android.intent.category.LAUNCHER" />
        	</intent-filter>
		</activity>

In case, when you implement your own StartActivity (let it be tutorial, for example), MainActivity should be custom too,
it's necessary to override default onCreate behaviour for proper navigation.

Custom MainActivity example:

.. code-block:: java

	public class MainActivity extends BaseActivity {
	    @Override
	    protected void onCreate(Bundle savedInstanceState) {
	        super.onCreate(savedInstanceState);
	        DialogSDK.get().waitForReady();

	        // check whether auth was completed (AuthState.LOGGED_IN)
	        if (!messenger().isLoggedIn()) {
	            startActivity(new Intent(this, YourStartActivity.class));
	            finish();
	            return;
	        }

	        DialogSDK.get().startMessagingActivity(this);
	        finish();
	    }
	}	
		

DefaultStartActivity include some helper methods from BaseActivity :

+-------------------------------+---------------------------------------------+
| setStatusBarTranslucentFlag() | set FLAG_TRANSLUCENT_STATUS flag to window  |
+-------------------------------+---------------------------------------------+
| setStatusBarTransparent()     | transparent status bar with toolbar padding |
+-------------------------------+---------------------------------------------+
| getStatusBarHeight()          | get status_bar_height identifier in pixels  |
+-------------------------------+---------------------------------------------+
| DialogBinder BINDER           | helper to bind views with listeners         |
+-------------------------------+---------------------------------------------+

Next stage after start screen should lead to ``AuthActivity`` through intent.


Deep links
----------

Provide scheme for external deep links, which served for navigate to a certain chat.

.. code-block:: xml

	<activity
            android:name="im.sdk.MainActivity"
            android:label="@string/app_name"
            android:launchMode="singleTask"
            android:theme="@style/AppTheme">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
            <intent-filter>
                <action android:name="android.intent.action.VIEW" />

                <category android:name="android.intent.category.BROWSABLE" />
                <category android:name="android.intent.category.DEFAULT" />

                <data android:scheme="YOUR_SCHEME" />
            </intent-filter>
        </activity>
