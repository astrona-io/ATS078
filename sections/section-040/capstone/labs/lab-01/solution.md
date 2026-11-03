# Solution

Solve this lab on `terminal`. This lab has not been run yet; the commands are checked statically only.

```sh
astrona run --git ssh://git@github.com/astrona-io/ATS078.git -c sections/section-040/capstone/labs/lab-01
```

## Step 1: Survey

```sh
kubectl get clusterrolebindings -o json | jq -r '.items[] | select(.roleRef.name == "cluster-admin") | .metadata.name + " " + ([.subjects[]? | .name] | join(","))'
kubectl -n ward get roles,rolebindings
```

## Step 2: Narrow crew

```sh
kubectl delete clusterrolebinding crew-admin
kubectl -n ward create rolebinding crew-view --clusterrole=view --group=crew
kubectl auth can-i list pods -n kube-system --as=someone --as-group=crew
astrona submit --keep --git ssh://git@github.com/astrona-io/ATS078.git -c sections/section-040/capstone/labs/lab-01
```

## Step 3: Remove the escalation verbs

```sh
kubectl -n ward patch role rolemaker --type=json -p '[{"op":"replace","path":"/rules/0/verbs","value":["get","list","create","update"]}]'
astrona submit --keep --git ssh://git@github.com/astrona-io/ATS078.git -c sections/section-040/capstone/labs/lab-01
```

## Step 4: Remove Secrets from the reader

```sh
kubectl -n ward patch role config-reader --type=json -p '[{"op":"replace","path":"/rules/0/resources","value":["configmaps"]}]'
astrona submit --keep --git ssh://git@github.com/astrona-io/ATS078.git -c sections/section-040/capstone/labs/lab-01
```

## Step 5: Remove the public binding

```sh
kubectl -n ward delete rolebinding public-pods
astrona submit --keep --git ssh://git@github.com/astrona-io/ATS078.git -c sections/section-040/capstone/labs/lab-01
```

Destroy the lab when you are done:

```sh
astrona destroy ats-078-capstone-040
```
