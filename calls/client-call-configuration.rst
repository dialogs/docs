Client call configuration
=========================

- ``callsEnabled: Bool``, default is true. Sets if calls are enabled. If
  calls are disabled, all incoming calls will be ignored, call log tab is hidden
  and make call buttons are not shown.

- ``videoCallsEnabled: Bool``, default is true. Sets if video calls are enabled.
  If video calls are disabled, the video call button is hidden, incoming video
  is not shown and camera cannot be turned on while on call. This field is
  ignored if calls are disabled.

- ``groupCallsEnabled: Bool``, default is false. Sets if group calls are
  enabled. If group calls are disabled, the call button for group peers will be
  hidden or disabled. This field is ignored if calls are disabled.

- ``groupCallsMaxMembers: Int``, default is 5. Limits a number of group call
  participants. If a group has more than max members, the call button for this
  group will be hidden. This field is ignored if calls are disabled or if group
  calls are disabled.

- ``emojiSecurityEnabled: Bool``, default is false. Sets if the client
  should show emoji fingerprint. This field is ignored if calls are disabled.

- ``holdingEnalbed: Bool``, default is false. Sets if the client
  should support holding. If holding is disabled, the hold button will be
  hidden, however **incoming hold requests will be processed correctly**.

- ``webrtcConfiguration``. See below.

WebRTC Configuration
--------------------

- ``iceConnectionReceivingTimeout: Int32``, defult is 2500, and
  ``iceBackupCandidatePairPingInterval: Int32``, default is 2500. More info
  here: https://groups.google.com/forum/#!topic/discuss-webrtc/CZP8GdRHboY.
  These must be set to enable graceful network change, but not supported by most
  SIP PBX's.
- ``continualGatheringPolicy: .gatherOnce`` or ``.gatherContinually``. Whether
  to gather ICE candidates only in the beginning or throughout conversation.
  It must be set to enable graceful network change, but not supported by most
  SIP PBX's.
- ``rtcpMuxPolicy: .require`` or ``.negotiate``. RTCP mux mode. All clients
  must have the same mux policy in order to be compatible. If integrating with
  SIP PBX, check its mux mode.
- ``bundlePolicy: .balanced``, ``.maxCompat`` or ``.maxBundle``. WebRTC bundling
  policy. All clients must have compatible bundling modes. If integrating with
  SIP PBX, check its bundling mode.
- ``workaroundFreeSwitch10258: Bool``. Workaround for FreeSwitch bug `FS-10258
  <https://freeswitch.org/jira/browse/FS-10258>`_.
  Munges SDP and sets ``a=setup:passive`` manually.

Video Configuration
-------------------

- ``enabled: Bool``, default is true. Sets if video calls are enabled. If video
  calls are disabled, the video call button is hidden, incoming video is not
  shown and camera cannot be turned on while on call. This field is ignored if
  calls are disabled.

- ``togglingEnabled: Bool``, default is true. Sets if video can be turned on and
  off while on call. In SIP mode turning video on call causes reinvites, so
  the PBX must be ready for that. The setting is ignore if video is disabled.

- ``videoCallButtonShown: Bool``, default is false. Sets whether we need to show
  videocall button in additional to the regular call. This can be used for
  PBX's that do not support reinvites.

- ``screenSharingEnabled: Bool``, default is false. Web and android only. Sets
  if screen sharing button is enabled. Screen sharing works much like a regular
  one, adding an additional button to change video stream.
