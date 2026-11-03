# Question

Solve this question on: `terminal`

The user `kade` runs day-to-day operations in the namespace `deck`. A previous administrator gave `kade` a Role named `ops` that allows every verb on every resource. A second ClusterRoleBinding, `public-read`, gives the `view` ClusterRole to every unauthenticated caller. `kubectl` points at the cluster as the cluster administrator.

1. Rewrite the Role `ops` in `deck` so it has no wildcards. `kade` must be able to list pods, read pod logs and scale Deployments in `deck`.
2. `kade` must not be able to read or list Secrets, create or delete pods, run exec into pods or create RoleBindings in `deck`.
3. Remove the binding that gives access to unauthenticated callers.
4. Keep the Role `ops`, its RoleBinding and the Deployment `crane` in place.

Test your work with `kubectl auth can-i ... --as=kade`.
