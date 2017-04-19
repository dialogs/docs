Getting Started
===============

This guide will teach you how to build a simple messenger app using Dialog Web SDK from scratch.

Requirements
------------

You have to install `Node.js`_ and `Yarn`_.
If you using macOS, you can install everything you need using `Homebrew`_.

.. code-block:: bash

    brew install node yarn

You have to create `NPM`_ account and ensure you have access to @dlghq organization.

.. code-block:: bash

    npm login

.. _NPM: https://www.npmjs.com
.. _Yarn: https://yarnpkg.com
.. _Node.js: https://nodejs.org
.. _Homebrew: https://brew.sh

Create your messenger
---------------------

Install template generator and create your first messenger app.

.. code-block:: bash

    npm install --global @dlghq/create-dialog-app
    create-dialog-app mymessenger
