# Question

Solve this question on: `terminal`

The namespace `ward` has four excessive RBAC grants. `kubectl` points at the cluster as the cluster administrator. Test identities with `kubectl auth can-i ... --as=<name> --as-group=<group>`.

1. The group `crew` is bound to `cluster-admin` through a ClusterRoleBinding. Crew members only need to read objects in `ward`. Remove the cluster-wide grant and let `crew` list pods in `ward` with the built-in `view` role. `crew` must not read Secrets in `ward`, and must not list pods in `kube-system`.
2. The ServiceAccount `builder-sa` creates Roles and RoleBindings in `ward`, and must keep that ability. It must not be able to use the `bind` or `escalate` verbs.
3. The ServiceAccount `reader-sa` reads ConfigMaps in `ward`. It must keep that access and lose all access to Secrets.
4. A RoleBinding gives the `view` role to unauthenticated callers in `ward`. Remove it.
5. Do not change the Deployment `scout`.
