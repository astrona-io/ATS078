---
estimated_duration: 20m
---

# Lab: Authorization And Effective Permissions

Graded lab. **Status: UNTESTED.** It was built and checked statically only (`astrona validate`, `bash -n`, YAML parsing). Nobody has run it or its reference solution yet. The task is in `question.md`; the walkthrough is in `solution.md`.

## Run it

```sh
astrona run --git ssh://git@github.com/astrona-io/ATS078.git -c sections/section-040/module-01/labs/lab-01
astrona submit --git ssh://git@github.com/astrona-io/ATS078.git -c sections/section-040/module-01/labs/lab-01
astrona destroy ats-078-lab-040-01
```

Authors run the local copy with `astrona run -c <lab>` and prove the reference solution with `astrona test -c <lab>`.

## Checks

| Script | What it proves |
| --- | --- |
| `validate-no-wildcards.sh` | Role ops in deck has no wildcard and still exists |
| `validate-kade-allowed.sh` | kade can list pods, read pod logs and scale deployments in deck |
| `validate-kade-denied.sh` | kade cannot read Secrets, create or delete pods, or exec in deck |
| `validate-no-public-binding.sh` | No binding grants a role to system:unauthenticated and anonymous cannot list pods |
| `validate-crane-intact.sh` | Deployment crane in deck is still available |
