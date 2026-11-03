# Authentication And Workload Credentials - Playground

- **Slug:** ats-078-playground-040-02
- **Type:** Astrona playground, a clean environment with no task and no grading
- **Status:** UNTESTED. Built from static checks only (`astrona validate`).

A single-node kind cluster (Kubernetes 1.35) with the Starfleet workloads in `starfleet` and `outpost`. You are the cluster administrator. Practice reading your identity, requesting tokens and issuing a client certificate.

## Run it

```sh
astrona run -c .
astrona destroy ats-078-playground-040-02
```

`astrona destroy` takes the environment name, not the config path.
