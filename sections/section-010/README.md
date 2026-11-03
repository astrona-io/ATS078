---
draft: true
exam_objectives:
- 'Observability Fundamentals: Traces, Metrics, Logs, and Events'
---
# Observability Fundamentals: Traces, Metrics, Logs, and Events

This section covers the observability signals of a platform: metrics, logs, events and traces. It explains what each signal holds, how a structured log record and a request identifier work, how Kubernetes events record changes, how to correlate a metric with log records, how collection, sampling and retention decide which records exist, how sensitive data and cost are controlled, and how a distributed trace connects the spans of one request.

The section has two modules. Each has a playground, a graded lab and a summary, and the section ends with a capstone lab and a knowledge check. Each part is followed by the lab that practises it.

## Learning Outcomes

- Explain the difference between a metric, a log record, an event and a trace, and say which question each answers
- Read a structured JSON log record and find the record of one request from its request identifier
- Read Kubernetes events with `kubectl` and explain their retention
- Correlate a metric symptom with log records by route, instance and time, and explain why a match in time is not proof of a cause
- Explain how rotation, sampling and retention remove records, and why a failure ratio must come from a counter
- Recognise personal data in log records and apply redaction, access control and volume controls
- Describe a trace as a tree of spans and explain how `traceparent` carries context between services

## Contents

| Item | What it is |
| --- | --- |
| Metrics, Logs And Events Compared; Structured Log Records And Request Identifiers; Kubernetes Events | Module 1 reading parts |
| Correlate A Failed Request With Its Log Record And Route Metric | Graded module lab (intermediate) |
| Correlating Metrics And Logs; Collection, Sampling And Retention; Sensitive Data And Log Cost; Distributed Traces And Trace Context | Module 2 reading parts |
| Measure Log Sampling And Find The Sensitive Field | Graded module lab (intermediate) |
| Logs And Events Capstone: Investigate A Failing Shop | Section capstone lab (advanced) |
| Knowledge check | `quiz.yaml`, pass score 70 |

## Authoring Status

The labs and the playgrounds in this section are UNTESTED. They were built from documentation and checked only with static tools (`astrona validate`, `bash -n`, YAML parsing).
