---
draft: true
exam_objectives:
- 'Secure Service Communication'
---
# Secure Service Communication

This section covers secure communication between services. It explains workload certificates and SPIFFE identity in a service mesh (Istio), mutual TLS modes and port exceptions, identity-based authorization, what a mesh does not cover, and the public key infrastructure (PKI) behind the certificates: keys, chain verification, cluster certificate authorities, client certificates, rotation, expiry and compromise.

The section has two modules. Each has a playground, a graded lab and a summary, and the section ends with a capstone lab and a knowledge check. Each part is followed by the lab that practises it.

## Learning Outcomes

- Read a workload identity and validity period from a sidecar
- Choose PERMISSIVE or STRICT and predict what a client without a sidecar receives
- Write a PeerAuthentication with a port exception and an AuthorizationPolicy for one identity
- State what remains outside the mesh
- Read a certificate and verify a chain with openssl
- Issue a short-lived client certificate with the CertificateSigningRequest API
- Explain why a client certificate cannot be revoked, and plan rotation

## Contents

| Item | What it is |
| --- | --- |
| Mesh Identity And Certificates; Mutual TLS Modes And Peer Authentication; Authorization And Mesh Limits | Module 1 reading parts |
| Require mTLS And Open One Port | Graded module lab (intermediate) |
| Keys, Certificates And Chain Verification; Cluster PKI And Client Certificates; Rotation, Expiry And Compromise | Module 2 reading parts |
| Read The Cluster CA And Issue A Short-Lived Client Certificate | Graded module lab (intermediate) |
| Secure Service-To-Service Traffic With Istio | Section capstone lab (advanced) |
| Knowledge check | `quiz.yaml`, pass score 70 |

## Authoring Status

The labs and the playgrounds in this section are UNTESTED. They were built from documentation and checked only with static tools (`astrona validate`, `bash -n`, YAML parsing).
