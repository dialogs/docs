.. _webpack:

Webpack Configuration
=====================

Installation
------------

.. code-block:: bash

    yarn add --develop @dlghq/dialog-scripts

Usage
-----

.. code-block:: javascript

  const { createWebWebpackConfig } = require('@dlghq/dialog-scripts');
    
  module.exports = (env = {}) => {
    return createWebWebpackConfig({
      root: __dirname,
      appName: 'dlg',
      version: pkg.version,
      production: env.production
    });
  };
  
Configuration
-------------
  
.. class:: WebpackConfiguration

  **Mandatory** properties:

    .. data:: root: string
    
      Project root. In most cases :code:`__dirname`.
      
    .. data:: appName: string
      
      Application shortname. Will be used as css class prefixes.

    .. data:: version: string

      Application version.

    .. data:: production: boolean

      Should be true for production build.

  Optional properties:

    .. data:: environment: { [key: string]: string }

      Passed variables would be available in your code by :code:`process.env.VARIABLE`.
    
    .. data:: override: { [key: string]: string }
    
      Using this property you can override any file inside project 
