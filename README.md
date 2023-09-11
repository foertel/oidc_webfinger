I hate every bit of this.

# Standalone Webfinger Service

Turns out someone invented a fancy lookup protocol just for people to put static files on their server and totally fancy "discover" that one service for that one identity they have. 

This is a hacky standalone service, serving a semi-dynamic webfinger config to be used in OIDC discovery. 

# How to

Start the container specifying your OIDC-issuer in `OIDC_ISSUER_URL`.