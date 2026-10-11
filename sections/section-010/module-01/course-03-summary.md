---
draft: true
exam_objectives:
- 'Observability Fundamentals: Traces, Metrics, Logs, and Events'
---
# Summary

Telemetry describes selected observations of a running system. Metrics summarize measurements, traces connect timed operations, and logs record events. Resource identity and propagated context allow these observations to be correlated without making them equivalent. Collection, sampling and retention shape what remains visible. Missing telemetry is therefore evidence about the observation path as well as the system, and cannot automatically prove that an operation never occurred.

Metrics describe numerical behavior across time, while logs and events preserve individual observations and their context. Structured identity and timestamps make records useful for correlating symptoms with activity.

Collection scope, sampling and retention limit the conclusions supported by a search. Protect sensitive fields and preserve enough context to investigate without treating every log line as a complete or trustworthy account.
