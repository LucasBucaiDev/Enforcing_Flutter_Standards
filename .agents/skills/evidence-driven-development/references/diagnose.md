# Diagnose from evidence

Use this reference only to reproduce and diagnose a bug or failure. Do not
design or implement a correction in this phase.

## Establish the boundary

State the reported symptom, affected scope, expected behavior, and evidence
needed to distinguish causes. Inspect the smallest relevant path: entry point,
data or control flow, failing boundary, tests, configuration, and direct
dependencies. Preserve secret values; report only their kind and exposure
path.

Prefer a deterministic reproduction. Record the exact command, input or state,
observed output, exit status, and environment facts that affect the result.
When execution is unavailable, distinguish supplied facts from verified facts
and never fabricate a reproduction.

## Investigate systematically

Trace backward from the symptom. Compare working and failing cases when
available. Test one hypothesis at a time with the least invasive read-only
check. Separate mechanical observations—imports, stack traces, diffs, command
output—from technical interpretation.

For each viable hypothesis, state:

```text
Observation: reproducible fact
Hypothesis: causal explanation tested by that fact
Check: read-only discriminator
Result: supported | rejected | unresolved
```

Do not treat correlation, authority, familiarity, or the first plausible
explanation as root cause. Do not use broad refactoring as diagnosis.

## Conclude or stop

A diagnosis is complete only when it explains the dependency or execution
path from triggering condition to symptom, identifies the violated behavior or
boundary, and accounts for the observed evidence without contradiction.

Report the root cause with exact locations and impact. Keep solution direction
out of the diagnosis unless the user asks to enter design; then update the
route before loading design guidance.

Stop when the symptom cannot be reproduced from available evidence, competing
hypotheses remain indistinguishable, a required artifact cannot be read, or a
product/security decision is missing. State the missing evidence and the
smallest next read-only check.
