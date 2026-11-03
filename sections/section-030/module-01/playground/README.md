# Admission Control: Playground

- **Slug:** ats-078-playground-030-01
- **Author:** Paris Nakita Kejser
- **Type:** Astrona playground, clean environment, no task, no grading
- **Status:** UNTESTED: built from documentation, not yet booted.

Clean cluster with compliant Starfleet workloads in `starfleet` and `outpost` and no admission policy.

## Run it

```sh
astrona run --git ssh://git@github.com/astrona-io/ATS078.git -c sections/section-030/module-01/playground
astrona destroy ats-078-playground-030-01
```

Authors run the local copy with `astrona run -c .` inside this folder. `astrona destroy` takes the environment name, not the path.
