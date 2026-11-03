---
draft: true
exam_objectives:
- 'Kubernetes Security Essentials'
---
# Summary

Authorization decides whether an authenticated identity may perform a request. The API server evaluates the user, groups, verb, API group, resource, subresource, name and namespace against its authorizers, usually Node and RBAC. RBAC rules only add: the effective permissions of an identity are the union of every Role and ClusterRole bound to it directly or through a group. A RoleBinding to a ClusterRole limits the rules to one namespace. A `roleRef` cannot be edited.

Some permissions are stronger than they look. Wildcards cover future resources. `list` on Secrets returns every value. `create` on Pods reads Secrets and uses ServiceAccounts through volume mounts. `escalate`, `bind` and `impersonate` remove escalation prevention. Bindings to `system:unauthenticated` and `system:authenticated` reach callers that nobody meant to include.

- Test with `kubectl auth can-i` and `--as`, and list bindings with a `jq` filter.
- Rules cannot deny. Remove or narrow the grant.
- A subresource such as `pods/exec` needs its own rule.
- Review ClusterRoleBindings and RoleBindings for cluster-admin, wildcards and broad groups.

<!-- astrona:playground:destroy -->
