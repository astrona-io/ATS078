---
draft: true
exam_objectives:
- 'Kubernetes Security Essentials'
---
# Summary

Authentication turns the credentials in a request into a user name and groups. The API server tries its configured authenticators in turn: client certificates, bearer tokens, OIDC and anonymous access. A failure at this stage returns 401. A request that passes authentication and fails authorization returns 403 and names the identity it saw. Kubernetes stores no user objects, so any valid certificate with a given Common Name is that user.

ServiceAccount tokens are signed JWTs bound to a Pod, with an audience and an expiry. The kubelet projects them into containers. Automounting is on by default, and `automountServiceAccountToken: false` removes the volume for new Pods. Legacy token Secrets never expire and should be deleted. The CertificateSigningRequest API issues client certificates through an approval step. The API server cannot revoke a certificate, so the lifetime is the only limit.

- `kubectl auth whoami` shows the identity the API server derived.
- 401 means authentication failed. 403 means authorization refused a known identity.
- Bound tokens expire and die with their Pod. Legacy Secrets do not.
- A CSR signer writes the subject the requester asked for, so approvers must read it.

<!-- astrona:playground:destroy -->
