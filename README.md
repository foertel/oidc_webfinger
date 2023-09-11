I hate every bit of this.

# Standalone Webfinger Service

Turns out someone invented a fancy lookup protocol just for people to put static files on their server and totally fancy "discover" that one service for that one identity they have. 

This is a hacky standalone service, serving a semi-dynamic webfinger config to be used in OIDC discovery. 

It returns the `http://openid.net/specs/connect/1.0/issuer` link specified for any `?resource` asked.

# How to

Start the container specifying your OIDC-issuer in env-var `OIDC_ISSUER_URL`. Using ingress or a reverse proxy point `.well-known/webfinger` to this service and it shall answer.