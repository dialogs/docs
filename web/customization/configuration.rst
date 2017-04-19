.. _configuration:

Web SDK configuration
=====================

.. class:: Configuration

  Configuration allows you to configure you application.

  .. code-block:: javascript

      {
        endpoints: ['wss://ws1.dlg.im'],
        apiAppName: 'Dialog Web App',
        apiAppKey: '156631434b552d39452d5f58334e123834285036',
        toneSound: require('./assets/tone.mp3'),
        ringtoneSound: require('./assets/ringtone.mp3'),
        notificationIcon: require('./assets/favicon.png'),
        notificationSound: require('./assets/notification.mp3'),
        container: document.getElementById('dialog-web-app')
      }

  **Mandatory** properties:

    .. data:: endpoints: string[]

      WebSocket endpoints. You **must** specify at least one endpoint.
      
    .. data:: container: HTMLElement
      
      Application would be rendered in this container.

    .. data:: apiAppName: string

      The API application name. User will see this name in sessions list.

    .. data:: apiAppKey: string

      The API key.

    .. data:: toneSound: string

      Path to the call tone sound file.

    .. data:: ringtoneSound: string

      Path to the call ringtone sound file.

    .. data:: notificationIcon: string

      Path to the notification icon image file.

    .. data:: notificationSound: string

      Path to the notification sound file.

  Optional properties:

    .. data:: quiet: boolean = false

      Disable all logging. Helpfull for debugging.
      
    .. data:: history: browserHistory | hashHistory = hashHistory

      ReactRouter history object.

    .. function:: createRoutes(store: ReduxStore) => ReactRoute

      You can override standard routing using this function.
      
    .. data:: customReducer: ReduxReducer
    
      Your custom reducer. Will be available in :code:`state.custom`.
      
    .. function:: createMiddlewares(messenger: DialogMessenger) => ReduxMiddleware[]

      You can add your middlewares to Redux store.

    .. data:: locale: string = navigator.language

      Application locale.
      
    .. data:: messages: LocaleMessages
    
      Custom localisation messages.
      
      .. code-block:: javascript

          {
            en: {
              hello: 'Hello'
            }
          }
      
    .. function:: logger(tag: string, level: string, message: string) => void
      
      Custom logging function. Will be used by Messenger.
      
    .. data:: asyncStorageName: string = 'dialog'

      IndexedDB database name used by Messenger for storing collections.
      
    .. function:: onRender() => void
      
      This callback will be passed as :code:`ReactDOM.render` callback.
