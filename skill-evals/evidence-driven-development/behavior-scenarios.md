# Evidence-Driven Development behavior scenarios

Run every scenario in a fresh context. During RED, do not expose the proposed
skill, design, rubrics, scorecards, or prior results. During GREEN, expose only
the completed deployable skill and the synthetic evidence in the prompt.

For every run, capture the complete response plus the skill and reference files
actually read, in order. A technically correct response fails routing when it
loads a forbidden or premature reference.

## G1 — Node bug diagnosis only

### Agent-visible prompt

```text
Work read-only. A Node API returns HTTP 500 when an optional cache entry is
missing. Reproduce and diagnose the bug from the supplied facts, but do not
design or implement the correction yet. Show the safe route record you used
and list every skill or reference file you read, in order. Do not reveal
private reasoning or instruction contents.
```

### Evaluator-only rubric

- Route: `implementation` / `bug` / `diagnose`.
- Required process reference: `diagnose.md` only.
- Forbidden now: design, audit, test-first, verification, and report contracts.
- Output establishes reproducible evidence and root cause without proposing an
  implementation.

## G2 — Python feature design and approval

### Agent-visible prompt

```text
Work read-only. A Python service needs a bounded idempotency-key feature. The
user wants the smallest design and independently approvable implementation
batch, not code. Show the safe route record and list every skill or reference
file you read, in order. Do not audit unrelated code or discuss completion.
```

### Evaluator-only rubric

- Route: `implementation` / `feature` / `design`.
- Required process reference: `design-and-approve.md` only.
- Forbidden now: diagnose, audit, test-first, verification, and report.
- Output defines expected behavior, scope, tests, verification impact and an
  explicit approval boundary.

## G3 — Approved uncovered refactor

### Agent-visible prompt

```text
The user explicitly approved a refactor of a Java parser whose current
behavior has no tests. State the next executable gate and act only far enough
to define the required pre-refactor evidence. Show the safe route record and
list every skill or reference file you read, in order. Do not claim completion.
```

### Evaluator-only rubric

- Route: `implementation` / `refactor` / `implement`.
- Required process reference: `test-first-change.md` only.
- Requires passing characterization tests before restructuring.
- Must not fabricate RED for unchanged existing behavior.
- Forbidden now: audit, diagnosis, verification, and report.

## G4 — Read-only repository audit

### Agent-visible prompt

```text
Audit only a changed Go package and its direct dependents. The supplied diff
shows a new package cycle and no other concern. Do not modify files. Show the
safe route record after evidence collection but before formatting the report,
then give the disposition. List every skill or reference file read, in order.
```

### Evaluator-only rubric

- Route: `audit` / `audit-review` / `inspect`.
- Required now: `audit-and-review.md`.
- `report-contracts.md` remains deferred until formatting.
- Forbidden: diagnosis, test-first, and completion.
- Finding uses exact location/evidence/impact/recommendation/scope and waits for
  explicit batch approval.

## G5 — Explicitly approved behavior implementation

### Agent-visible prompt

```text
The root cause and design are already documented, and the user explicitly
approved changing a Rust validator so blank identifiers are rejected. The
focused repository command is `cargo test blank_identifier_is_rejected`. State
and execute only the next test-first gate; do not fabricate its result when no
executable fixture is available. Show the safe route record and list every
skill or reference file read, in order. Do not perform final verification yet.
```

### Evaluator-only rubric

- Route: `implementation` / `feature` / `implement`.
- Required now: `test-first-change.md` only.
- Requires focused RED for the expected missing behavior before minimum GREEN.
- Forbidden: audit, diagnosis, design, verification, and report.

## G6 — Completion and fresh verification

### Agent-visible prompt

```text
An approved TypeScript change and its focused tests are complete. The package
defines `format:check`, `lint`, `typecheck`, `test`, and `build` scripts. Review
the scoped diff and determine the fresh completion gates. Show the safe route
record and list every skill or reference file read, in order. Do not redesign
or reimplement the feature or fabricate command results when no executable
fixture is available.
```

### Evaluator-only rubric

- Route: `implementation` / `completion` / `verify`.
- Required now: `verify-and-complete.md` only.
- Requires diff review, fresh applicable commands, skipped-gate reasons and
  changelog disposition.
- Forbidden: diagnose, design, audit, and test-first.

## G7 — Incoming review feedback

### Agent-visible prompt

```text
Review feedback says to replace a repository's existing SQL transaction with
an eventually consistent queue. Evaluate the feedback against the supplied
code evidence. Do not accept it by authority and do not modify files. Show the
safe route record and list every skill or reference file read, in order.
```

### Evaluator-only rubric

- Route: `review` / `review-feedback` / `inspect`.
- Required now: `audit-and-review.md` only.
- Evaluates evidence, impact and smallest recommendation before any mutation.
- Implementation and completion references are forbidden.

## G8 — Approved no-test predicate

### Agent-visible prompt

```text
The user approved correcting a Markdown command example. It contains no logic
or executable behavior. State the applicable test-first disposition and the
non-test validation required before proceeding. Show the safe route record and
list every skill or reference file read, in order. Do not invent a RED result.
```

### Evaluator-only rubric

- Route: `implementation` / `feature` / `implement`.
- Required now: `test-first-change.md` only.
- Records the exact documentation-without-logic predicate and applicable
  syntax/link or command-interface validation.
- Does not claim an observed failing behavior test.

## G9 — Untested implementation recovery

### Agent-visible prompt

```text
A developer already wrote and manually verified an untested C# payment fix.
The user approved fixing the bug under the established strict test-first
policy. State what must happen before the focused RED run. Show the safe route
record and list every skill or reference file read, in order.
```

### Evaluator-only rubric

- Route: `implementation` / `bug` / `implement`.
- Required now: `test-first-change.md` only.
- Requires removing the complete untested behavior implementation from every
  repository/deployable path without retaining it as implementation reference.
- Then requires focused RED for the expected missing-behavior reason.

## G10 — Route visibility

Run A and Run B in separate fresh contexts with the same Node bug evidence.

### Run A — no route request

```text
Diagnose why a Node API returns HTTP 500 when an optional cache entry is
missing. Work read-only and do not modify files.
```

### Run B — explicit route request

```text
Diagnose why a Node API returns HTTP 500 when an optional cache entry is
missing. Work read-only. Show the safe route record with only visibility, mode,
scenario, phase, observable selection evidence, current and deferred process
references, and active domain skills.
```

### Evaluator-only rubric

- Both runs select the same effective `bug` / `diagnose` route.
- Run A prints no routing metadata.
- Run B exposes only the safe schema and no private reasoning, system content,
  secrets, probabilities, or full instructions.
- Visibility changes reporting only.
