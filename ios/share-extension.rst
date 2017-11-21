.. _share-extension-ios-label:

Share Extension guide
=====================

To include app share extension it requires to perform two tasks. You need to apply specific project settings and install share extension from a separate CocoaPod.


Project configuration steps
---------------------------

----------------------------------------------------------------------------------------
Prepare App Group (this one is needed for sharing information between app and extension)
----------------------------------------------------------------------------------------

* Create application group if it does not exist.
* Go to developer portal (developer.apple.com), authorize if needed.
* Go to "Certificates, IDs & Profiles", then go to App Groups.
* If there is no group or you want to create a new one – create it. Follow page instructions. The easiest way to set unique identifier for app group is add word "group." to you app id (so if you app id is "my.app.identifier” proposed app group id will be "group.my.app.identifier").
* Remember or write down anywhere chosen application group identifier. From this point we will name it "App Group ID".


-------------------------
Enable App Groups for app
-------------------------

To be able to use declared app groups you should update your application identifier on developer portal.

* Go to portal again and then to "Certificates, IDs & Profiles". Then select "App IDs". Find and expand app item with your app id. Tap "Edit".
* Find and turn on App Groups. If portal warning you must regenerate profile for enabling App Groups – agree.
* Tap "Edit" button agains turned on App Groups. Select group that you created before ("App Group ID"). Sure that selected group is the same you created in the section *Prepare App Group*.
* Press "Continue" button below. Then press "Assign" button below to confirm changes. Then press "Done" below to return to your App IDs list.

------------------------------------
Add Share Extension App ID on portal
------------------------------------

* Go to developer portal (developer.apple.com), authorize if needed.
* Go to "Certificates, IDs & Profiles”, then go to App IDs.
* Add a new one by clicking plus on top.
* Name it as you wish (recommended is <App Name> Share).
* Set identifier from you target (normally, it's "my.app.identifier.Share")
* Scroll down to App services and check App Groups.
* Register new App ID by pressing "Continue" and then "Register" button on the bottom.

-------------------------------------
Enable App Groups for Share Extension
-------------------------------------

To be able to use declared app groups you should update your Share Extension identifier on developer portal.

* Go to portal again and then to "Certificates, IDs & Profiles".
* Select "App IDs", find and expand extension item with your app id, tap "Edit".
* Find and turn on App Groups. If portal warning you must regenerate profile for enabling App Groups – agree.
* Tap "Edit" button agains turned on App Groups. Select group that you created before ("App Group ID"). Sure that selected group is the same you created in the section *Prepare App Group*.
* Press "Continue" button below. Then press "Assign" button below to confirm changes. Then press "Done" below to return to your App IDs list.


---------------------------
Update Provisioning profile
---------------------------

* Go to portal again and then to "Certificates, IDs & Profiles".
* Go to All Provisioning Profiles (select "All" under “Provisioning profiles” on the left panel).
* At this moment you probably have provisioning profiles (like development, ad hoc, distribution and so on). If you already have profiles – now they are probably marked as invalid, so you should recreate them.
* Select profile, tap "Edit", and on the new screen tap "Generate" below. Download it and open.
* If you have no profile – just create a new ones. Creating new profile is off-topic for this article.

**Pay attention: you need separate profiles for Share extension!**

----------------------------
Add target "Share Extension"
----------------------------

* Go to File → New → Target….Choose "Share Extension". Name it as you wish (this is not the name for user), like "Share". If you see alert titled "Activate scheme?" – activate scheme.
* Verify that you have two targets: one is an application and other is Share extension. For doing that select your project on the project navigation panel on the left and check content of the panel on the right. There should be at least two targets: one is for application and another one is for share extension. Turn off manual code signing if needed.

----------------------------------------
Configure App Group and keychain for app
----------------------------------------

* Return to your project. Select your project file. Select application target and go to “Capabilities” tab.
* Scroll down to the "Keychain Sharing". Turn it on. By default Xcode creates group names the same as your app id. It’s ok to use it. If there is no keychain group – add it and name it the same as your app like ("my.app.identifier").
* Scroll down to the "App Groups", turn it on and select group with App Group Id your created in step 1. If there is no group you've just created on portal or you see error icon with "Add the App Groups feature to your App ID" – make sure that you have internet connection and wait for a while.

----------------------------------------------
Configure App Group and keychain for extension
----------------------------------------------

* Select you project file, in targets select share extension.
* Repeat steps from the section *Configure App Group and keychain for app* for selected share extension target.

**Pay attention: Xcode adds your target name as a prefix in keychain id by default, so it looks like "my.app.identifier.Share". That is not right, id should be "my.app.identifier"!**


----------------------
Check everything is OK
----------------------

Return to your project. Make sure that error "Add the App Groups feature to your App ID" in your targets is no more shown. If you have mistakes – quit xCode and then open workspace again. If errors won’t disappear – try to turn off App Groups, turn it on again and then select needed group.


----------------------------
Fix signing issues if needed
----------------------------

It’s supposed that you use automatically code signing for extension (no matter what type of signing you use for app), because in that case no extra profiles needed. You’re responsible for fixing signing if you met some problems.
In that case you usually create another 3 (or more) profiles for Share (like development, ad hoc, distribution).


Implementing of Share Extension
-------------------------------


----------------
Fix dependencies
----------------

Add pod 'DialExt:

.. code-block

    target 'Share' do
        pod 'DialExt', :git => 'ssh://git@bitbucket.transmit.im:7999/dlg/dialext.git'
    end


----------------
Install Dial Ext
----------------

Open terminal and go to the folder with project where Podfile placed, like "cd ~/Projects/ClientFolder".
Remove Pods folder and Podfile.lock file and the perform "pod install".

------------------------------------------
Remember or write down your Keychain Group
------------------------------------------

Your keychain group will be the following: <TeamID>.<KeychainGroup>, where TeamID is your development Team ID from developer portal (on the Membership page) and KeychainGroup is string that you set in Capabilities for targets.
I. e. if your Team ID is 123A4567B38 and group is "my.app.identifier" your keychain group will be "123A4567B38.my.app.identifier"

-----------------------------------
Implement extension view controller
-----------------------------------

Find in Share files group file “ShareViewController” (it was created automatically by Xcode).
Fill empty spaces with your keychain group (like “123A4567B38.my.app.identifier”), app group (like "group.my.app.identifier", don't forget group prefix!) and server API address (that would be probably look like https://<#server-address#>/v1/messaging):

.. code-block

    import UIKit
    import DialExt

    @objc(ShareViewController) class ShareViewController: DESharedDialogsPresentationViewController {
        override var config: DESharedDataConfig! {
        return DESharedDataConfig(keychainGroup: "<#Keychain Group#>", appGroup: "<#App Group ID#>", uploadURLs: [URL.init(string: "<#your https api#>")!])
        }
    }

-------------------------
Fix Extension entry point
-------------------------

* Remove MainInterface.storyboard from Share files group.
* Open Info.plist, find NSExtension (if there is no key with such name – create a new one, value is Dictionary). Add entry with key: NSExtensionPrincipalClass, value: ShareViewController.
* Check Main interface field of Share tagret (under “Deployment Info” in General tab) is empty now. If it still contains “MainInterface” – remove it.
* Change "Bundle display name" to something else (the original name of your app is good).

---------------------------------------------
Configure SDK to sharing files with extension
---------------------------------------------

* Go to AppDelegate of your app target.
* Add following code in place where you configuring SDK:

.. code-block

    let sharedDataConfig = DialogSDK.SharedDataConfig.init(group:"<#App Group ID#>", keychainGroup: "<#Keychain Group#>")
    DialogSDK.sharedDialog().sharedDataConfig = sharedDataConfig

-------------------------
Configure Activation Rule
-------------------------

Activation Rule describes condition, when an item can be shared using share extension.
Apple does not allow sharing any files, but we provide legal rule, which allowed to share any item that can be represented as Data (bytes sequence).

Select Share target, go to "Info" tab. Expand NSExtension, then expand NSExtensionAttributes. You'll see NSExtensionActivationRule which probably has value "NSTruePredicate". This value is for debug only and your app will be rejected at the review stage because of this. Change the value to predicate:

.. code-block

    SUBQUERY (
        extensionItems,
        $extensionItem,
        SUBQUERY (
            $extensionItem.attachments,
            $attachment,
            ANY $attachment.registeredTypeIdentifiers UTI-CONFORMS-TO "public.data"
        ).@count == 1
    ).@count == 1

----------------------------------
Manage automatic signing if needed
----------------------------------

If you have problem with automatic signing – create specified profile for extension (probably you want 3 profiles: development, ad hoc and production, optionaly – another one production for CI) and set it in share extension target.
