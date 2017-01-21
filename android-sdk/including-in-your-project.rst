Including in your project
=========================

The easiest way to include DialogSDK in your projects is using Gradle.

Please add the following lines into :code:`repositories` section of your gradle file:

.. code-block:: groovy

    maven {
        url "http://dialog.bintray.com/android-sdk"
        credentials {
            username bintrayUser
            password bintrayPassword
        }
    }

Our SDK repository is private, so you need to obtain correct credentials from our developers.

You can specify them directly in the gradle file (albeit not recommended) or in the special file called
:code:`gradle.properties` in the root of your gradle project (create it if it does not exist):

.. code-block:: groovy

    bintrayUser=$bamboo_bintray_user
    bintrayPassword=$bamboo_bintray_password

Having the repository set up, you should add these lines into the :code:`dependencies` section of your gradle file:

.. code-block:: groovy

    compile "im.dlg:android-sdk:${dialogSdkVersion}"
    compile "im.dlg:android-google-push:${dialogSdkVersion}"
    compile "im.dlg:android-google-maps:${dialogSdkVersion}"

Please use the actual version number instead of :code:`${dialogSdkVersion}`.

.. todo:: Describe proguard configuration
