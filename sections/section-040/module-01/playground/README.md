# Authorization And Effective Permissions - Playground

- **Slug:** ats-078-playground-040-01
- **Type:** Astrona playground, a clean environment with no task and no grading
- **Status:** UNTESTED. Built from static checks only (`astrona validate`).

A single-node kind cluster (Kubernetes 1.35) with the Starfleet workloads in `starfleet` and `outpost`. You are the cluster administrator and test other identities with `--as` and `--as-group`.

## Run it

```sh
astrona run -c .
astrona destroy ats-078-playground-040-01
```

`astrona destroy` takes the environment name, not the config path.
