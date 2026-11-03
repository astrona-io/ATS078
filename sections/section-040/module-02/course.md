---
draft: true
exam_objectives:
- 'Kubernetes Security Essentials'
---
# Authentication And Workload Credentials

Authentication is the first check the API server makes on every request. It answers one question only: who is calling. It does not decide what the caller may do. A request can be authenticated and still be forbidden, and a request that fails authentication never reaches authorization.

This module follows the mechanism. It shows how the API server turns a certificate, a token or no credential at all into a user name and a list of groups, how workloads get ServiceAccount tokens, and how a person receives a client certificate through a CertificateSigningRequest. It also shows where credentials leak and how to limit them.

The module has two parts. **How The API Server Authenticates Requests** covers the authenticator chain, client certificates, bearer tokens, anonymous access and the difference between a 401 and a 403 response. **ServiceAccount Tokens And Client Certificates** covers bound tokens, automounting, legacy token Secrets and the CertificateSigningRequest flow.

## Learning objectives

After this module you can:

- Name the credential types the API server accepts and what identity each produces.
- Distinguish a 401 response from a 403 response.
- Explain bound ServiceAccount tokens, their audience and their lifetime.
- Stop a workload from receiving a token it does not need.
- Issue a user certificate through the CertificateSigningRequest API.

## Your playground

The playground is a single-node `kind` cluster running Kubernetes 1.35. It has the namespaces `starfleet` and `outpost` with the workloads `scout`, `probe`, `shuttle` and `drifter`. You run every command as the cluster administrator.

Launch the playground now and keep it running while you read:

<!-- astrona:playground -->
