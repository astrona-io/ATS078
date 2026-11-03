# Cluster PKI And Client Certificates: Playground

- **Slug:** ats-078-playground-020-02
- **Author:** Paris Nakita Kejser
- **Type:** Astrona playground, clean environment, no task, no grading
- **Status:** UNTESTED: built from documentation, not yet booted.

Clean cluster with one workload. Use the control plane node to inspect the cluster certificates and issue a client certificate.

## Run it

```sh
astrona run --git ssh://git@github.com/astrona-io/ATS078.git -c sections/section-020/module-02/playground
astrona destroy ats-078-playground-020-02
```

Authors run the local copy with `astrona run -c .` inside this folder. `astrona destroy` takes the environment name, not the path.
