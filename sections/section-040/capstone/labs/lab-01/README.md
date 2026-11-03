---
estimated_duration: 30m
---

# Lab: Authorization Capstone

Graded lab. **Status: UNTESTED.** It was built and checked statically only (`astrona validate`, `bash -n`, YAML parsing). Nobody has run it or its reference solution yet. The task is in `question.md`; the walkthrough is in `solution.md`.

## Run it

```sh
astrona run --git ssh://git@github.com/astrona-io/ATS078.git -c sections/section-040/capstone/labs/lab-01
astrona submit --git ssh://git@github.com/astrona-io/ATS078.git -c sections/section-040/capstone/labs/lab-01
astrona destroy ats-078-capstone-040
```

Authors run the local copy with `astrona run -c <lab>` and prove the reference solution with `astrona test -c <lab>`.

## Checks

| Script | What it proves |
| --- | --- |
| `validate-crew-scope.sh` | crew has no cluster-admin binding, can list pods in ward and cannot read Secrets or list pods in kube-system |
| `validate-builder-no-escalation.sh` | builder-sa can create roles in ward but has no bind or escalate permission |
| `validate-reader-no-secrets.sh` | reader-sa can read configmaps in ward and cannot read or list Secrets |
| `validate-no-unauthenticated.sh` | No binding grants a role to system:unauthenticated in ward and anonymous cannot list pods |
| `validate-no-wildcards.sh` | No Role in ward uses a wildcard, bind, escalate or impersonate |
| `validate-scout-intact.sh` | Deployment scout in ward is still available |
