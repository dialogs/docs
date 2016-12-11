Server-specific notes
=====================

For working with RPC topics server should use clean session to not get flooded by outdated requests after deploy. Moreover, request timeout does not make any sence if they aren't received by server in near-real-time.