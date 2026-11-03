---
draft: true
exam_objectives:
- 'Kubernetes Security Essentials'
---
# Authorization And Effective Permissions

Authorization is the second check the API server makes. It receives an identity from authentication and a description of the request, and answers allow or deny. In most clusters the answer comes from role-based access control (RBAC): a list of rules that grant permissions, and a list of bindings that attach those rules to users, groups and ServiceAccounts.

RBAC has no deny rule. The effective permissions of an identity are the union of every rule that reaches it. That makes the sum of small grants the real risk, and it makes a few verbs far more powerful than their names suggest. This module explains how a request is matched against rules and then covers the permissions that let a caller gain more access than it was given.

The module has two parts. **RBAC Grants And Their Consequences** covers authorization modes, request attributes, Roles, ClusterRoles, bindings and how to test an identity. **Dangerous Permissions And Privilege Escalation** covers wildcards, Secret access, `create pods`, `escalate`, `bind`, `impersonate` and bindings to broad groups.

## Learning objectives

After this module you can:

- Compare Role, ClusterRole, RoleBinding and ClusterRoleBinding.
- Evaluate the effective permissions of an identity.
- Identify verbs and bindings that allow privilege escalation.
- Apply least privilege to a user and a workload identity.

## Your playground

The playground is a single-node `kind` cluster running Kubernetes 1.35. It has the namespaces `starfleet` and `outpost` with the workloads `scout`, `probe`, `shuttle` and `drifter`. You run every command as the cluster administrator and test other identities with impersonation.

Launch the playground now and keep it running while you read:

<!-- astrona:playground -->
