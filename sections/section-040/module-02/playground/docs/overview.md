# Overview: Authentication And Workload Credentials (Playground)

This is a playground, not a lab. It starts a cluster with the example workloads and waits. There is no task, no `astrona submit` and no pass or fail. Experiment, run `astrona destroy` and start again.

## What is in the box

- A single-node `kind` cluster running Kubernetes 1.35, with `kubectl` pointed at it as the cluster administrator (`kubernetes-admin`).
- The namespaces `starfleet` and `outpost` with the workloads `scout`, `probe`, `shuttle` and `drifter`.
- The tools `openssl`, `jq` and `base64` are expected on your path.

## Practice tasks

- Run `kubectl auth whoami` and decode the administrator certificate from your kubeconfig with `openssl x509 -noout -subject`.
- Run `kubectl --as=system:anonymous get pods -n starfleet` and read the 403 message.
- Request a token with `kubectl -n starfleet create token default --duration=10m` and decode its payload with `cut`, `base64 -d` and `jq`.
- Create a ServiceAccount with `automountServiceAccountToken: false`, run a Pod with it and check that `spec.volumes` is empty.
- Create a Secret of type `kubernetes.io/service-account-token` with the annotation `kubernetes.io/service-account.name` and read how the token controller fills it.
- Create a CertificateSigningRequest for `CN=mira, O=crew`, approve it and read the subject from `status.certificate`.
- Run `kubectl --as=mira auth can-i list pods -n starfleet` before and after you create a RoleBinding.
