---
draft: true
exam_objectives:
- Kubernetes Security Essentials
---
# Summary

Roles define API permissions and bindings grant them to subjects. Namespace scope, API group, resource and verb determine the action being allowed. RoleBindings and ClusterRoleBindings provide different grant scopes.

Applicable RBAC grants combine, and indirect consequences can make apparently simple permissions sensitive. Least privilege requires examining every effective grant and the resources the identity can use to reach other authority.

Authentication establishes a caller identity through the configured credential mechanism. ServiceAccounts identify workloads, and projected tokens can limit audience and lifetime. A valid token still needs careful protection.

Identity does not grant every requested action. Authorization and admission remain separate checks. Avoid mounting unnecessary credentials and investigate failures at the stage indicated by the evidence.
