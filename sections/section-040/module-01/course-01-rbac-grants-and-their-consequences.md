---
draft: true
exam_objectives:
- 'Kubernetes Security Essentials'
---
# RBAC Grants And Their Consequences

After authentication, the API server asks its authorizers whether the identity may perform the request. This part covers what the authorizer looks at, how Roles and bindings combine, and how to test the result for any identity.

## Authorization modes

The `--authorization-mode` flag on the API server lists the authorizers in order. A typical cluster uses `Node,RBAC`. The Node authorizer lets each kubelet read only the objects that belong to Pods scheduled on its node. RBAC handles everyone else. A Webhook authorizer can call an external service.

The authorizers are asked in order. The first one that allows the request ends the process. If one denies, or if none has an opinion, the request is refused. A mode that always allows, `AlwaysAllow`, turns authorization off and must never be used outside a test cluster.

## What authorization sees

The API server builds a set of attributes from each request:

- the user name and groups from authentication
- the verb: `get`, `list`, `watch`, `create`, `update`, `patch`, `delete` or a special verb such as `bind`
- the API group and resource, for example `apps` and `deployments`
- the subresource, for example `pods/log` or `deployments/scale`
- the resource name, when the request targets one object
- the namespace, for namespaced resources

Authorization never reads the body of the request. It cannot decide that a Pod is allowed only when it has a certain image. That is the job of admission.

## Roles, ClusterRoles and bindings

A Role holds rules in one namespace. A ClusterRole holds rules that can apply to cluster-scoped resources, such as nodes, or to every namespace. A rule lists API groups, resources, verbs and optionally resource names. Nothing in a Role says who receives it.

A RoleBinding gives the rules of a Role or ClusterRole to subjects in one namespace. A ClusterRoleBinding gives the rules of a ClusterRole to subjects in every namespace and for cluster-scoped resources. A RoleBinding that points at a ClusterRole is a common and useful pattern: it reuses the rule list but limits it to one namespace.

```mermaid
flowchart LR
    S["Subject: user, group or ServiceAccount"] -->|"is named by"| B["RoleBinding or ClusterRoleBinding"]
    B -->|"points at"| R["Role or ClusterRole"]
    R -->|"lists"| P["Rules: groups, resources, verbs"]
    P -->|"all matching rules are added"| E["Effective permissions"]
```

## Rules only add

An identity may be named in many bindings, directly and through groups. Every rule reached is added to the set of permissions. There is no way to subtract. If a user holds a `view` grant and a separate grant to delete Pods, the user can delete Pods. To remove a permission you must remove or narrow the rule or binding that gives it, and the binding may belong to a group the user is in.

Aggregated ClusterRoles combine rules from other ClusterRoles through labels. The built-in `view`, `edit` and `admin` roles are aggregated. Adding a ClusterRole with the label `rbac.authorization.k8s.io/aggregate-to-view: "true"` widens `view` for everyone who has it.

## Create a Role and test it

Renew the playground and save this as `role-pod-reader.yaml`:

<!-- astrona:playground:renew -->

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: pod-reader
  namespace: starfleet
rules:
  - apiGroups: [""]
    resources: ["pods", "pods/log"]
    verbs: ["get", "list", "watch"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: pod-reader-mira
  namespace: starfleet
subjects:
  - kind: User
    name: mira
    apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io
```

Apply it and ask the API server what `mira` may do:

```sh
kubectl apply -f role-pod-reader.yaml
kubectl auth can-i list pods -n starfleet --as=mira
kubectl auth can-i get pods --subresource=log -n starfleet --as=mira
kubectl auth can-i delete pods -n starfleet --as=mira
kubectl auth can-i list pods -n outpost --as=mira
```

The first two answers are `yes`. The last two are `no`: no rule grants `delete`, and the binding exists only in `starfleet`. The command `kubectl auth can-i --list --as=mira -n starfleet` prints every rule that reaches her, including the rules that all authenticated users receive.

## Rules are matched literally

The core API group is the empty string. Deployments are in `apps`. A rule with `resources: ["pods"]` does not cover `pods/log` or `pods/exec`. Subresources must be named. A rule with `resourceNames` limits `get`, `update`, `patch` and `delete` to named objects, but `list`, `watch` and `create` cannot be limited that way, because the object name is not known when the request is made.

A `roleRef` is immutable. To point a binding at another role you delete and recreate it. This prevents someone who can edit bindings from quietly changing what an existing binding grants.

## Testing an identity from the other side

When a request fails with 403, the message gives the user, the verb, the resource and the namespace. Compare those with the rules you expect. A common mistake is a Role in one namespace and a request in another. The `kubectl auth can-i` command is only a hint, because it asks the API server for the answer but cannot show which rule matched. To find the matching rules, list bindings that mention the subject:

```sh
kubectl get rolebindings,clusterrolebindings -A -o json | jq -r '.items[] | select(any(.subjects[]?; .name == "mira")) | .kind + " " + .metadata.name'
```

## Common pitfalls

> [!WARNING]
> - Expecting a Role to deny something. RBAC rules only add.
> - Granting `resources: ["pods"]` and expecting log or exec access to follow, or the opposite: granting `pods/*` and receiving exec access.
> - Using a ClusterRoleBinding where a RoleBinding to the same ClusterRole would have limited the grant to one namespace.
> - Trusting `resourceNames` to limit `list` or `create`. It cannot.
> - Testing with your own administrator credentials. Impersonate the identity with `--as` and `--as-group`.
