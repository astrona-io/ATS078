# Overview: Authorization And Effective Permissions (Playground)

This is a playground, not a lab. It starts a cluster with the example workloads and waits. There is no task, no `astrona submit` and no pass or fail. Experiment, run `astrona destroy` and start again.

## What is in the box

- A single-node `kind` cluster running Kubernetes 1.35, with `kubectl` pointed at it as the cluster administrator.
- The namespaces `starfleet` and `outpost` with the workloads `scout`, `probe`, `shuttle` and `drifter`.
- The default RBAC objects that Kubernetes installs, including `cluster-admin`, `view`, `edit` and `admin`.

## Practice tasks

- Create a Role that reads pods and pod logs, bind it to the user `mira` and test it with `kubectl auth can-i ... --as=mira`.
- Bind the built-in `view` ClusterRole with a RoleBinding in `starfleet` and check that it does not apply in `outpost`.
- Run `kubectl auth can-i --list --as=mira -n starfleet` and read the rules every authenticated user receives.
- Grant `create pods` only and show how a Pod that mounts a Secret reads its value.
- List every binding to `cluster-admin` with the `jq` filter from the reading.
- Add a ClusterRole with the label `rbac.authorization.k8s.io/aggregate-to-view: "true"` and see how `view` changes.
- Try to edit the `roleRef` of an existing binding and read the error.
