Desktop
=======

You can build desktop applications for Windows, macOS, linux.
We support all these OS using `Electron`_.

.. _Electron: https://electron.atom.io

Installation
------------

.. code-block:: bash

    yarn add @dlghq/dialog-desktop-sdk
    yarn add --develop electron

Usage
-----

Create main.js and paste following code:

.. code-block:: javascript

  const { createApp } = require('@dlghq/dialog-desktop-sdk');

  createApp({
    url: 'https://app.mymessenger.im',
    help: 'https://mymessenger.im/help',
    autoUpdateURL: 'https://desktop.mymessenger.im',
    title: 'dialog',
    showSaveAs: true
  });

Configuration
-------------
  
.. class:: ElectronConfiguration

    .. data:: url: string
    
      Web app url.
      
    .. data:: title: string
    
      Application title.
      
    .. data:: help: string
      
      Link to your application help-page.

    .. data:: autoUpdateURL: string

      Electron update server url.

    .. data:: showSaveAs: boolean

      Should application show "save as" dialog when user saves file.
