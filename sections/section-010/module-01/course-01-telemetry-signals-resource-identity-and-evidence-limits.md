---
draft: true
exam_objectives:
- 'Observability Fundamentals: Traces, Metrics, Logs, and Events'
---
# Telemetry Signals, Resource Identity And Evidence Limits

Telemetry is recorded evidence about system activity. OpenTelemetry provides common APIs, instrumentation, data models and collection components for producing and moving that evidence. It does not turn every observation into a complete history, and it does not require a particular storage or analysis backend. Understanding the signal being collected is necessary before interpreting what the data can establish.

Metrics represent measurements through instruments and aggregated data points. A request counter can show how many operations were observed within a defined population. A duration histogram can show the distribution of recorded latency. These measurements are useful for trends and service indicators, but an aggregate series normally cannot explain the exact internal path of one request. Labels and attributes define the population the measurement describes.

Traces represent related operations as spans. A span has timing, identity and relationships that connect it to a trace. Distributed context allows a downstream operation to continue the request's causal structure. Traces help locate where observed time was spent, but sampling can mean only some requests are retained. Missing instrumentation can also leave gaps even in a retained trace.

Logs record events with timestamps, severity and a body according to their model. They can include structured attributes and correlation fields. A log explaining why a payment was rejected may answer a business question that a latency histogram cannot answer. The same log still needs interpretation: an emitted message describes what its author chose to record, not every possible state of the system.

Resource identity describes the entity producing telemetry, such as a service and its environment. Instrumentation scope describes the library or instrumentation source within that entity. Keeping these concepts distinct avoids treating a package version as the service identity or assigning unrelated services the same grouping key. Consistent identity makes cross-signal analysis more reliable.

Consider an ordering service whose latency metric worsens. Metrics show the affected population and time window. Traces can reveal that retained slow requests spent time waiting for an inventory dependency. Logs may explain a timeout or retry decision. These observations support a causal investigation when their identities and timestamps align. They do not automatically prove that every slow request had the same cause.

Correlation needs deliberate context. A log can carry a trace identifier when emitted within the relevant active context. A metric may use exemplars to connect selected observations to trace context where supported. Neither mechanism means that every aggregate point has a complete linked trace. The configured instrumentation, sampling and backend capabilities determine what relationships are available.

Evidence has costs and limits. High-cardinality attributes can multiply metric series. Detailed logs can expose sensitive values. Traces can consume significant storage and processing capacity. Collection failures, filtering and retention can remove observations. Design should choose information that answers useful questions while limiting confidential data and uncontrolled volume.

A sound investigation examines both the application and the telemetry path. If request logs disappear while traffic continues, the problem may be exporter failure rather than an absence of requests. If only a few traces show errors, the sample may not represent every user. State the population, time window and collection assumptions before drawing a conclusion from the data.

## Common pitfalls

> [!WARNING]
> Do not equate missing telemetry with missing activity. Metrics, traces and logs answer different questions and can have different sampling or retention. Preserve resource identity and avoid sensitive or unbounded attributes that make evidence unsafe or expensive.
