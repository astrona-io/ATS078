# Solution

Solve this lab on `terminal`. This lab has not been run yet; the commands are checked statically only.

```sh
astrona run --git ssh://git@github.com/astrona-io/ATS078.git -c sections/section-040/module-01/labs/lab-01
```

## Step 1: Look at what kade has

```sh
kubectl auth can-i --list --as=kade -n deck
kubectl -n deck get role ops -o yaml
```

## Step 2: Replace the wildcard Role

Save this as `role-ops.yaml`:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: ops
  namespace: deck
rules:
  - apiGroups: [""]
    resources: ["pods", "pods/log"]
    verbs: ["get", "list", "watch"]
  - apiGroups: ["apps"]
    resources: ["deployments", "deployments/scale"]
    verbs: ["get", "list", "watch"]
  - apiGroups: ["apps"]
    resources: ["deployments/scale"]
    verbs: ["patch", "update"]
```

```sh
kubectl apply -f role-ops.yaml
kubectl auth can-i get secrets -n deck --as=kade
kubectl auth can-i patch deployments --subresource=scale -n deck --as=kade
astrona submit --keep --git ssh://git@github.com/astrona-io/ATS078.git -c sections/section-040/module-01/labs/lab-01
```

## Step 3: Remove the public binding

```sh
kubectl delete clusterrolebinding public-read
kubectl auth can-i list pods -n deck --as=system:anonymous --as-group=system:unauthenticated
astrona submit --keep --git ssh://git@github.com/astrona-io/ATS078.git -c sections/section-040/module-01/labs/lab-01
```

Destroy the lab when you are done:

```sh
astrona destroy ats-078-lab-040-01
```
