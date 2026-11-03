---
draft: true
exam_objectives:
- 'Kubernetes Security Essentials'
---
# Kubernetes Security Essentials

This section covers authorization and authentication in Kubernetes. It explains RBAC grants and their consequences, dangerous permissions and privilege escalation, how the API server authenticates a request, ServiceAccount tokens and client certificates.

The section has two modules. Each has a playground, a graded lab and a summary, and the section ends with a capstone lab and a knowledge check. Each part is followed by the lab that practises it.

## Learning Outcomes

- Compare Role, ClusterRole, RoleBinding and ClusterRoleBinding
- Evaluate effective permissions with impersonation
- Identify verbs and bindings that allow privilege escalation
- Apply least privilege to users and ServiceAccounts
- Name the credential types the API server accepts and distinguish a 401 from a 403
- Explain bound ServiceAccount tokens and automounting

## Contents

| Item | What it is |
| --- | --- |
| RBAC Grants And Their Consequences; Dangerous Permissions And Privilege Escalation | Module 1 reading parts |
| Least Privilege RBAC Lab | Graded module lab (intermediate) |
| How The API Server Authenticates Requests; ServiceAccount Tokens And Client Certificates | Module 2 reading parts |
| Workload Credentials Lab | Graded module lab (intermediate) |
| Authorization Capstone | Section capstone lab (advanced) |
| Knowledge check | `quiz.yaml`, pass score 70 |

## Authoring Status

The labs and the playgrounds in this section are UNTESTED. They were built from documentation and checked only with static tools (`astrona validate`, `bash -n`, YAML parsing).
