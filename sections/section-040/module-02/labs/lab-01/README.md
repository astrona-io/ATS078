---
estimated_duration: 20m
---

# Lab: Authentication And Workload Credentials

Graded lab. **Status: UNTESTED.** It was built and checked statically only (`astrona validate`, `bash -n`, YAML parsing). Nobody has run it or its reference solution yet. The task is in `question.md`; the walkthrough is in `solution.md`.

## Run it

```sh
astrona run --git ssh://git@github.com/astrona-io/ATS078.git -c sections/section-040/module-02/labs/lab-01
astrona submit --git ssh://git@github.com/astrona-io/ATS078.git -c sections/section-040/module-02/labs/lab-01
astrona destroy ats-078-lab-040-02
```

Authors run the local copy with `astrona run -c <lab>` and prove the reference solution with `astrona test -c <lab>`.

## Checks

| Script | What it proves |
| --- | --- |
| `validate-mira-certificate.sh` | CSR mira-csr is approved and issued a certificate for CN=mira, O=crew |
| `validate-automount-disabled.sh` | ServiceAccount scout-sa disables automounting |
| `validate-scout-has-no-token.sh` | Running pods of scout have no ServiceAccount token volume |
| `validate-legacy-secret-removed.sh` | The legacy token Secret scout-sa-token is deleted |
| `validate-scout-intact.sh` | scout still uses scout-sa and is available |
