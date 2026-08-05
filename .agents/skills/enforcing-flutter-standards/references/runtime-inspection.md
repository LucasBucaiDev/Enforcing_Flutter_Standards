# Flutter runtime inspection protocol

<!-- provenance: project-policy-runtime-inspection -->

Use this protocol only when the task requires runtime evidence: launching an
app, inspecting its widget tree or semantics, observing layout, performing an
interaction, or capturing a render. Static work remains independent.

## Capability discovery

Before choosing a command or adapter:

1. Inspect the capabilities, skills, tool schemas, resources, repository
   commands, and connected targets actually available in the current session.
2. Map verified capabilities to launch, target selection, widget-tree or layout
   inspection, semantics inspection, interaction, logs, and capture.
3. Confirm required arguments and limits from the exposed schema or repository
   evidence. Prefer a read-only probe when support is uncertain.
4. Classify the usable scope as complete, partial, or unavailable.

Never invent a tool, command, device, or successful connection. A Flutter or
Dart MCP server, repository harness, browser controller, emulator or device
CLI, and screenshot facility are possible adapters, not assumed dependencies.
Names in examples are non-normative and do not establish availability.

## Preconditions and evidence record

Require an approved executable target and inspect repository-owned launch
commands before using a generic default. Record:

| Field | Required evidence |
|---|---|
| Target | target entrypoint and requested journey or screen |
| Configuration | flavor, environment kind without secret values, and launch command or adapter |
| Runtime | device or platform, target ID when safe, viewport dimensions, orientation, locale, and text scale when relevant |
| Baseline | initial state, fixtures or owned test data, and external boundaries |
| Execution | actions performed in order and their observable outcomes |
| Result | evidence obtained, captures or logs, unsupported capabilities, and validation left pending |

Do not expose tokens, credentials, personal data, or other secret values in the
record, logs, captures, or report.

## Inspection sequence

1. Establish the named target, initial state, dimensions, platform, and
   non-destructive boundary.
2. Launch with a verified repository command or available adapter and record
   its actual result. A process start alone is not evidence that the UI loaded.
3. Capture the initial observable state using every relevant verified
   capability: render, widget tree, constraints, semantics, logs, or screenshot.
4. Perform one approved interaction at a time. Record the action before
   observing the resulting state so failures remain attributable.
5. Reinspect the affected evidence and compare it with the requirement or
   exact source of truth.
6. Stop the target only through a known safe lifecycle command. Record any
   process or state that could not be cleaned up safely.

## Capability and fallback matrix

| Availability | Required behavior | Permitted claim |
|---|---|---|
| Launch, inspection, interaction, and capture are available | Execute the scoped sequence and preserve evidence for each required capability. | Only the observed target, state, dimensions, platform, and actions. |
| Some runtime capabilities are available | Use the safe subset, declare the result partial, and name every unavailable observation and fallback. | Only evidence produced by the available subset. |
| Runtime capabilities are unavailable | Continue independent static analysis or tests; provide the exact manual launch, interaction, and capture checklist when repository evidence supports it. Mark runtime validation pending. | No runtime, visual, interaction, or cross-platform success claim. |

An unavailable MCP server, emulator, browser, or capture facility never blocks
independent static work. Installing or configuring one, downloading an SDK, or
starting an external service requires separate approval.

## Safety and stop conditions

- Use fixtures, local state, disposable accounts, or repository-owned test data
  when available. Never assume a production account or shared dataset is safe.
- Reading local runtime state does not authorize mutating external state.
- Before an action can submit, purchase, publish, delete, message, change remote
  data, cross authentication, or become destructive, stop and obtain explicit
  approval for that exact effect and target.
- Do not bypass permission dialogs, security controls, consent, or platform
  protections to complete an interaction.
- Stop when the connected target, flavor, account, or initial state differs
  materially from the approved boundary.

## Completion boundary

Separate observed evidence from inference and pending validation. Never claim
visual fidelity without an actual capture comparison, semantics correctness
without inspecting semantics, interaction success without observing the result,
or support for a platform or viewport that was not exercised.
