---
draft: true
exam_objectives:
- Secure Service Communication
---
# Summary

A service mesh can implement communication identity, encryption and selected traffic policy through configured components. Mutual TLS verifies peers, while authorization determines permitted operations.

Encrypted boundaries end where termination or another hop changes the contract. Certificate trust, rotation and component authority need protection, and application user permissions and safe retries remain separate responsibilities.

PKI binds identities to public keys through trusted issuers, while private keys prove possession and require protection. Chain, identity, validity and intended use determine whether a certificate is accepted.

TLS and mutual TLS establish defined peer identities for protected connections, not universal authorization. Rotation and compromise response must follow actual consumer reload, issuer and validation behavior, with issuance reliability supporting service availability.
