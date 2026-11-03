# Platform Observability, Security, and Conformance (ATS078)

Certified Cloud Native Platform Engineering Associate (CNPA): Platform Observability, Security, and Conformance, worth 20% of the official curriculum. This course belongs to ATP016.

Every module has deep-dive reading parts that explain mechanisms, responsible components, examples and limits, a playground (a clean Kubernetes cluster on kind), a graded lab and a summary. Every section has a capstone lab and a knowledge check (`quiz.yaml`), and a final knowledge check closes the domain. Technical content remains draft. The labs and playgrounds are UNTESTED: they were built from documentation and checked only statically.

## Course Outline

| Section | Module | Reading parts | Lab |
| --- | --- | --- | --- |
| 010 | 01 Metrics, Logs And Events As Evidence | Metrics, Logs And Events Compared; Structured Log Records And Request Identifiers; Kubernetes Events | Module lab |
| 010 | 02 Correlation, Sampling And Retention | Correlating Metrics And Logs; Collection, Sampling And Retention; Sensitive Data And Log Cost; Distributed Traces And Trace Context | Module lab |
| 010 | Capstone | Investigate A Failing Shop | Capstone lab |
| 020 | 01 Service Mesh Identity And Policy | Mesh Identity And Certificates; Mutual TLS Modes And Peer Authentication; Authorization And Mesh Limits | Module lab |
| 020 | 02 Certificates And Public Key Infrastructure | Keys, Certificates And Chain Verification; Cluster PKI And Client Certificates; Rotation, Expiry And Compromise | Module lab |
| 020 | Capstone | Secure Service-To-Service Traffic With Istio | Capstone lab |
| 030 | 01 Admission Policy And Extension Trust | The Admission Chain And Built-In Controllers; Pod Security Admission And Validating Admission Policy; Admission Webhooks, Failure And Exceptions | Module lab |
| 030 | Capstone | Close The Admission Gaps In Starfleet | Capstone lab |
| 040 | 01 Authorization And Effective Permissions | RBAC Grants And Their Consequences; Dangerous Permissions And Privilege Escalation | Module lab |
| 040 | 02 Authentication And Workload Credentials | How The API Server Authenticates Requests; ServiceAccount Tokens And Client Certificates | Module lab |
| 040 | Capstone | Authorization Capstone | Capstone lab |
| 050 | 01 Trust What You Deploy | Artifact Evidence And Sensitive Build Inputs; Connecting Verification To Execution Policy; Credentials And Service Account Tokens | Module lab |
| 050 | Capstone | Harden A Build Runner Workload | Capstone lab |

Each section ends with a knowledge check (`quiz.yaml`), and `sections/final-domain-quiz.yaml` closes the domain.

## Author Review

See [curriculum coverage](CURRICULUM.md), [primary sources](SOURCES.md), [quiz documentation](ASSESSMENTS.md) and [contribution instructions](CONTRIBUTING.md). Labs and playgrounds are UNTESTED: no runtime execution is claimed.
