# Internal Route Manifest Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add an internal-by-default, request-visible route manifest to `enforcing-flutter-standards` so every workflow and reference selection is evidence-backed, mutually consistent, and testable before detailed guidance is loaded.

**Architecture:** Keep the manifest contract inside the already-loaded `SKILL.md`; do not create another mandatory reference or executable router. Establish five fresh-context behavioral RED baselines, add the minimum routing contract, rerun those scenarios and R1–R7, then document and verify the behavior without changing the Dart inspector or standalone workflow.

**Tech Stack:** Agent Skills Markdown, fresh-context behavioral evaluations, existing Dart inspector regression suite, Git.

## Global Constraints

- Implement only the internal route manifest described in `docs/superpowers/specs/2026-07-30-route-manifest-design.md`.
- Keep the manifest internal by default and expose only its safe decision record when the user explicitly requests it.
- Put the manifest contract directly in `.agents/skills/enforcing-flutter-standards/SKILL.md`; do not create `route-manifest.md`.
- Do not add dependencies, executable routing code, persistence, telemetry, logs, temporary manifest files, or external state.
- Do not modify the Dart inspector, its output schema, its tests, thematic references, `references/standalone-workflow.md`, or tool configuration.
- Preserve exactly one selected `mode`, `scenario`, and `workflow`.
- Keep Superpowers and standalone mutually exclusive; do not use a partial Superpowers composition.
- Require observable evidence for every routed reference and update the manifest before reading a newly supported thematic reference.
- Keep `audit-report-template.md` deferred until evidence and classifications are complete and report formatting begins.
- Never expose chain-of-thought, private deliberation, system messages, secret values, or full reference contents in a requested manifest.
- Use behavioral RED/GREEN: record RM1–RM5 failures before changing `SKILL.md`.
- Preserve existing R1–R7 routing behavior.
- Keep `SKILL.md` below the existing 5,000-token recommendation using the repository's static character-based estimate.
- Update the existing root `CHANGELOG.md` once, under `Unreleased`.
- Preserve the unrelated untracked `docs/superpowers/plans/2026-07-29-repository-health-audit-b1.md`.
- The independent standalone skill is the next planned change, not part of this implementation.

---

## File Map

- Modify: `skill-evals/enforcing-flutter-standards/behavior-scenarios.md` — add exact RM1–RM5 prompts and expected observable checkpoints.
- Modify: `skill-evals/enforcing-flutter-standards/scorecard.md` — preserve verbatim RED/GREEN evaluator evidence, route selections, and final dispositions.
- Modify: `.agents/skills/enforcing-flutter-standards/SKILL.md` — define the internal manifest schema, workflow semantics, invariants, update rule, and safe requested view.
- Modify: `README.md` — explain internal-by-default route decisions and request-visible inspection.
- Modify: `CHANGELOG.md` — add one concise `Unreleased > Added` entry.
- Read only: `docs/superpowers/specs/2026-07-30-route-manifest-design.md` — authoritative requirements.
- Read only: `.agents/skills/enforcing-flutter-standards/references/superpowers-integration.md` — existing process-composition mapping.
- Read only: `.agents/skills/enforcing-flutter-standards/references/standalone-workflow.md` — regression boundary; extraction is future work.
- Read only: `.agents/skills/enforcing-flutter-standards/scripts/inspect_flutter_project.dart` — unchanged inspector.
- Read only: `skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart` — unchanged regression suite.

## Route Manifest Interface

The guidance must require this conceptual record without requiring YAML
serialization:

```yaml
route_manifest:
  visibility: internal | requested
  mode: audit | review | implementation
  scenario: bug | new-feature | refactor | audit-review | incoming-review-feedback | important-completion | technical-decision
  workflow: superpowers | standalone | flutter-audit-only | theme-only
  selection_evidence:
    - observable fact
  references_now:
    - reference filename
  references_deferred:
    - reference filename and activation condition
  excluded:
    - relevant incompatible workflow or close alternative
```

The safe requested representation exposes only these fields and their
observable justifications. It never exposes hidden reasoning or instruction
contents.

---

### Task 1: Establish RM1–RM5 behavioral RED baselines

**Files:**

- Modify: `skill-evals/enforcing-flutter-standards/behavior-scenarios.md`
- Modify: `skill-evals/enforcing-flutter-standards/scorecard.md`
- Read: `.agents/skills/enforcing-flutter-standards/SKILL.md`

**Interfaces:**

- Consumes: the pre-manifest skill at commit `896377c`, normal-catalog skill availability declared in each prompt, and the five scenario contracts below.
- Produces: exact RM1–RM5 prompts, observed verbatim baseline outputs, checkpoint results, and failure classifications recorded before any router change.

- [ ] **Step 1: Append the exact RM1 prompt**

Add this scenario to `behavior-scenarios.md`:

```markdown
## RM1 — Internal route manifest for a focused HTTP bug

The normal skill catalog contains `enforcing-flutter-standards`,
`superpowers:systematic-debugging`, `superpowers:test-driven-development`, and
`superpowers:verification-before-completion`.

A Flutter repository change incorrectly maps an HTTP 401 response to an
unknown failure. The user asks you to diagnose the bug, propose the smallest
test-first correction, and show the route manifest you selected before loading
detailed Flutter guidance.

Return the safe route manifest and the proposed next steps. Do not audit the
repository, modify files, use standalone, load unrelated Flutter domains, or
reveal private reasoning or instruction contents.
```

Required observable checkpoints:

```text
RM1.1 mode = implementation
RM1.2 scenario = bug
RM1.3 workflow = superpowers
RM1.4 references_now contains superpowers-integration.md,
      networking-and-errors.md, and quality-and-delivery.md
RM1.5 standalone-workflow.md and audit-contract.md are not in references_now
RM1.6 every loaded reference has observable selection evidence
RM1.7 the visible manifest contains no private reasoning or instruction contents
```

- [ ] **Step 2: Append the exact RM2 prompt**

Add this scenario after RM1:

```markdown
## RM2 — Audit route with deferred report template

The normal skill catalog contains `enforcing-flutter-standards` and the normal
Superpowers catalog. A user requests a read-only audit of a Flutter screen
against an attached design. The exact SVG for one custom icon is missing and a
narrow viewport visibly overflows.

Show the safe route manifest as it exists after evidence collection but before
formatting the audit report. Then state the audit disposition. Do not modify
files, invent the asset, load unrelated Flutter domains, start an
implementation workflow, or expose private reasoning or instruction contents.
```

Required observable checkpoints:

```text
RM2.1 mode = audit
RM2.2 scenario = audit-review
RM2.3 workflow = flutter-audit-only
RM2.4 references_now contains superpowers-integration.md,
      audit-contract.md, and ui-implementation.md
RM2.5 audit-report-template.md remains in references_deferred with the
      formatting activation condition
RM2.6 standalone-workflow.md is not in references_now
RM2.7 the exact-asset fragment is blocked while the overflow remains independently reportable
```

- [ ] **Step 3: Append the exact RM3 prompt**

Add this scenario after RM2:

```markdown
## RM3 — Missing required Superpowers skill selects standalone

The normal skill catalog contains `enforcing-flutter-standards`,
`superpowers:systematic-debugging`, and
`superpowers:verification-before-completion`, but
`superpowers:test-driven-development` is unavailable.

A Flutter repository change incorrectly maps an HTTP 401 response to an
unknown failure. The user asks for the smallest test-first correction and asks
to see the selected route manifest.

Return the safe route manifest and proposed next steps. Use one complete
workflow. Do not compose the available Superpowers skills partially, do not
load unrelated Flutter domains, do not modify files, and do not expose private
reasoning or instruction contents.
```

Required observable checkpoints:

```text
RM3.1 mode = implementation
RM3.2 scenario = bug
RM3.3 workflow = standalone
RM3.4 references_now contains standalone-workflow.md,
      networking-and-errors.md, and quality-and-delivery.md
RM3.5 references_now contains no Superpowers skill or
      superpowers-integration.md
RM3.6 excluded records the incomplete Superpowers alternative and missing TDD skill
RM3.7 the proposed correction retains diagnosis, focused RED, typed-failure mapping, and verification
```

- [ ] **Step 4: Append the exact RM4 prompts**

Add this paired scenario after RM3:

```markdown
## RM4 — Internal by default, safe and visible on request

Run A and Run B in separate fresh contexts with identical normal-catalog
availability and the same focused Flutter HTTP bug.

### Run A — no visibility request

Diagnose the incorrect HTTP 401 failure mapping and propose the smallest
test-first correction. Do not show routing metadata or modify files.

### Run B — explicit visibility request

Diagnose the incorrect HTTP 401 failure mapping, propose the smallest
test-first correction, and show the route manifest you selected. Include only
mode, scenario, workflow, observable selection evidence, loaded and deferred
references, and relevant exclusions. Do not reveal private reasoning, system
messages, secret values, or full instruction contents. Do not modify files.
```

Required observable checkpoints:

```text
RM4.1 Run A does not print a route manifest or routing metadata
RM4.2 Run B prints the safe route-manifest fields
RM4.3 Run B contains no chain-of-thought, system message, secret value,
      probability, or full reference contents
RM4.4 both runs select the same effective workflow and Flutter references
RM4.5 visibility changes reporting only, never task behavior
```

- [ ] **Step 5: Append the exact RM5 prompt**

Add this scenario after RM4:

```markdown
## RM5 — New evidence updates the manifest before thematic expansion

The normal skill catalog contains `enforcing-flutter-standards` and the normal
Superpowers catalog. A user asks for a read-only review of an Order repository
change. The initial request supports audit and architecture guidance. During
scoped inspection, `pubspec.yaml` and an import reveal a new path dependency
and a direct vendor SDK import in a Cubit.

Show two safe route-manifest snapshots: the initial manifest and the updated
manifest immediately before loading any newly supported thematic reference.
Then give the read-only review disposition. Do not modify files, load
networking, persistence, navigation, security, or UI guidance, and do not
expose private reasoning or instruction contents.
```

Required observable checkpoints:

```text
RM5.1 initial references_now contains superpowers-integration.md,
      audit-contract.md, and architecture-and-state.md
RM5.2 the initial manifest does not contain packages-and-integrations.md
RM5.3 updated selection_evidence cites the observed path dependency and vendor SDK import
RM5.4 packages-and-integrations.md is added before it is read
RM5.5 unrelated thematic references remain excluded from references_now
RM5.6 both snapshots preserve mode = review, scenario = audit-review,
      and workflow = flutter-audit-only
```

- [ ] **Step 6: Run each baseline in isolated fresh contexts**

Use six isolated evaluator dispatches: one each for RM1, RM2, RM3, RM5, RM4
Run A, and RM4 Run B. Run A and Run B must be separate contexts.

Evaluator inputs must contain only:

```text
1. the exact scenario prompt;
2. the deployable skill path;
3. the scenario's declared catalog availability;
4. an instruction to act as written and report the selected normal-catalog skills.
```

Do not provide the evaluator with the design, plan, checkpoint list, scorecard,
prior outputs, or intended patch.

Expected RED reason:

```text
The current router has no route_manifest contract, schema, visibility rule, or
pre-load update invariant. A technically correct task answer still fails when
it omits the requested manifest, invents inconsistent fields, exposes more
than the safe decision record, or cannot prove pre-load route updates.
```

- [ ] **Step 7: Record verbatim RED evidence**

Add a `## Internal route manifest` table near the existing selective-routing
table in `scorecard.md`. Use the columns `ID`, `Required behavior`,
`RED result`, `GREEN result`, and `Notes`. Add one row for each of these exact
behaviors only after its evaluator result exists:

- `RM1`: Focused HTTP bug emits the exact evidence-backed Superpowers route on
  request.
- `RM2`: Audit route keeps the report template deferred and uses Flutter audit
  only.
- `RM3`: Missing required Superpowers skill selects complete standalone without
  partial composition.
- `RM4`: Manifest is internal by default and safely visible only on request.
- `RM5`: New evidence updates the manifest before thematic expansion.

For each row, set `RED result` to the actual `Pass`, `Partial`, or `Fail`
disposition plus exact failed checkpoint IDs, set `GREEN result` to `Not run`,
and point `Notes` to its verbatim baseline. Append all six evaluator responses
verbatim under clearly labeled baseline headings.

- [ ] **Step 8: Confirm the RED is valid**

For every scenario, record:

```text
Observed omission or unsafe output:
Expected manifest behavior:
Failure classification: routing-contract | visibility | pre-load-update
Why the missing manifest guidance would make the test pass:
```

If any scenario passes all checkpoints unexpectedly, do not invent a failure.
Narrow only that prompt to the missing behavior demonstrated by its actual
output, rerun it in a new context, and preserve both attempts.

- [ ] **Step 9: Commit the RED artifacts**

Run:

```bash
git add skill-evals/enforcing-flutter-standards/behavior-scenarios.md \
  skill-evals/enforcing-flutter-standards/scorecard.md
git diff --cached --check
git commit -m "test: add route manifest baselines"
```

Expected: one test-only commit with RM1–RM5 prompts and observed baseline
evidence; `SKILL.md`, README, and changelog remain unchanged.

---

### Task 2: Add the minimum internal route-manifest contract

**Files:**

- Modify: `.agents/skills/enforcing-flutter-standards/SKILL.md:36-125`
- Read: `.agents/skills/enforcing-flutter-standards/references/superpowers-integration.md`
- Read: `.agents/skills/enforcing-flutter-standards/references/standalone-workflow.md`
- Test: `skill-evals/enforcing-flutter-standards/behavior-scenarios.md`
- Test evidence: `skill-evals/enforcing-flutter-standards/scorecard.md`

**Interfaces:**

- Consumes: observed RM1–RM5 RED failures, existing mode selection, existing Superpowers/standalone availability rule, and the thematic routing table.
- Produces: one internal `route_manifest` decision record, safe request-visible projection, pre-load validation invariants, and evidence-backed update behavior.

- [ ] **Step 1: Re-read RED evidence and preserve scope**

Before editing `SKILL.md`, inspect the RM1–RM5 baseline sections and write a
scratch checklist outside the repository containing exactly:

```text
RM1 missing behavior:
RM2 missing behavior:
RM3 missing behavior:
RM4 missing behavior:
RM5 missing behavior:
```

Populate it from observed failures only. Do not add unrelated routing cleanup.

- [ ] **Step 2: Replace the workflow-selection paragraph with route selection**

In `SKILL.md`, replace `## Compose one workflow` and its current paragraph with
this compact contract:

```markdown
## Select one route

After selecting the mode and collecting enough request or project evidence,
identify the applicable scenario and discover Superpowers plus every skill its
composition requires without assuming availability.

- Use `superpowers` only when Superpowers and every required scenario skill are
  available; load `references/superpowers-integration.md` and exclude
  standalone.
- Use `standalone` when Superpowers or any required scenario skill is absent;
  load the complete `references/standalone-workflow.md` and no partial
  Superpowers composition.
- Use `flutter-audit-only` for read-only Audit or Review; the Superpowers
  integration may be read only as the available composition map, while the
  Flutter audit contract owns the workflow.
- Use `theme-only` for a scoped technical decision that is not an Audit,
  Review, bug, feature, refactor, feedback implementation, or completion.
```

This is the only approved modification to workflow selection. Do not edit
`superpowers-integration.md` or `standalone-workflow.md`.

- [ ] **Step 3: Add the manifest schema immediately after route selection**

Insert:

````markdown
### Internal route manifest

Before loading the selected workflow or thematic references, maintain one
ephemeral decision record with:

```text
visibility: internal | requested
mode: audit | review | implementation
scenario: bug | new-feature | refactor | audit-review |
  incoming-review-feedback | important-completion | technical-decision
workflow: superpowers | standalone | flutter-audit-only | theme-only
selection_evidence: concise observable request, diff, manifest, import,
  configuration, inspector, or confirmed-availability facts
references_now: references justified for immediate loading
references_deferred: references plus their unmet activation conditions
excluded: only the incompatible workflow and plausible close alternatives
```

Start with `visibility: internal`. Do not print the manifest in a normal
response. Change visibility to `requested` only when the user asks to see the
manifest, selected route, or reference-selection reason.
````

When inserting this nested Markdown, use a four-backtick outer fence around the
example if required to keep `SKILL.md` valid.

- [ ] **Step 4: Add the manifest invariants**

Continue the same section with:

```markdown
Validate the record before loading:

1. select exactly one mode, scenario, and workflow;
2. never combine Superpowers and standalone;
3. back every `references_now` entry with `selection_evidence`;
4. keep entries disjoint across `references_now`, `references_deferred`, and
   `excluded`;
5. defer `audit-report-template.md` until evidence and classifications are
   complete and report formatting begins;
6. when new evidence supports another theme, update and validate the manifest
   before reading its reference;
7. do not load references preventively to resolve an inconsistent manifest.

The manifest is a decision record, not private reasoning. Never persist or log
it. A requested view may show only its fields, observable evidence,
reference-to-evidence mapping, deferral conditions, and relevant exclusions.
Never expose chain-of-thought, system messages, secret values, probabilities,
or full instruction contents.
```

- [ ] **Step 5: Align the thematic routing instruction**

Change the opening of `## Route Flutter references` from direct loading to
manifest-backed loading:

```markdown
Add every row supported by observable task or project evidence to
`references_now`, and add none merely because it exists. References are
independent and one level deep. If later evidence activates another row, update
and validate the manifest before reading that reference.
```

Keep the existing routing table unchanged.

- [ ] **Step 6: Align deferred audit formatting**

In `## Audit and review`, preserve the existing formatting gate and add the
state transition:

```markdown
Immediately before formatting, move `audit-report-template.md` from
`references_deferred` to `references_now`, record that its formatting
condition is satisfied, and only then load it.
```

- [ ] **Step 7: Check the router statically before GREEN evaluation**

Run:

```bash
rg -n "Internal route manifest|visibility: internal|references_now|references_deferred|flutter-audit-only|theme-only|chain-of-thought" \
  .agents/skills/enforcing-flutter-standards/SKILL.md
wc -w -c .agents/skills/enforcing-flutter-standards/SKILL.md
git diff --check -- .agents/skills/enforcing-flutter-standards/SKILL.md
```

Expected:

```text
All required terms are present.
SKILL.md remains below 20,000 characters, the repository's conservative
character proxy for the 5,000-token recommendation.
No whitespace errors are reported.
```

- [ ] **Step 8: Run RM1–RM5 GREEN evaluations**

Repeat Task 1 Step 6 with new fresh contexts and the exact unchanged prompts.
Do not provide rubrics, RED outputs, design, plan, scorecard, or intended
answers.

Expected:

```text
RM1: all RM1.1–RM1.7 pass.
RM2: all RM2.1–RM2.7 pass.
RM3: all RM3.1–RM3.7 pass.
RM4: all RM4.1–RM4.5 pass across two fresh contexts.
RM5: all RM5.1–RM5.6 pass.
```

- [ ] **Step 9: Run R1–R7 routing regressions**

Dispatch the seven exact existing R1–R7 prompts from
`behavior-scenarios.md`, one fresh context per scenario, with their original
catalog availability and without evaluator contamination.

Expected:

```text
R1–R7 retain their currently recorded required references, forbidden
references, workflow exclusivity, deferred template behavior, and technical
decisions.
```

If a regression fails, classify whether the manifest contract caused an
incorrect workflow, missing reference, extra reference, premature template, or
technical-behavior change. Apply only the smallest `SKILL.md` correction and
rerun the failing route plus its nearest neighbor.

- [ ] **Step 10: Record GREEN evidence**

In `scorecard.md`:

- replace each RM `GREEN result` with the actual pass/fail disposition;
- append every GREEN evaluator response verbatim;
- record the exact route fields and references observed;
- add an R1–R7 manifest-regression protocol note with model, reasoning effort,
  context isolation, and contamination exclusions;
- preserve every historical failure and prior scorecard section.

- [ ] **Step 11: Commit the router and GREEN evidence**

Run:

```bash
git add .agents/skills/enforcing-flutter-standards/SKILL.md \
  skill-evals/enforcing-flutter-standards/scorecard.md
git diff --cached --check
git commit -m "feat: add internal route manifest"
```

Expected: one behavior commit containing the minimum router contract and its
fresh GREEN evidence. No reference, inspector, README, or changelog file is
included.

---

### Task 3: Document and close the route-manifest change

**Files:**

- Modify: `README.md`
- Modify: `CHANGELOG.md`
- Read: `docs/superpowers/specs/2026-07-30-route-manifest-design.md`
- Read: `.agents/skills/enforcing-flutter-standards/SKILL.md`
- Test: `skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart`

**Interfaces:**

- Consumes: passing RM1–RM5 and R1–R7 evidence plus the final manifest contract.
- Produces: public documentation, one canonical changelog entry, and fresh repository verification.

- [ ] **Step 1: Add the manifest to the README workflow**

In `README.md`, update the `Cómo trabaja` description immediately after its
workflow diagram with this behavior:

```markdown
Antes de cargar workflows o referencias detalladas, la skill mantiene un
manifiesto de ruta efímero con el modo, escenario, workflow, evidencia de
selección, referencias inmediatas, referencias diferidas y exclusiones
relevantes. Es interno por defecto; si el usuario pide verlo, muestra solo ese
registro seguro y nunca razonamiento privado ni contenido de instrucciones.
```

In the progressive-loading explanation, add:

```markdown
Cuando la inspección descubre evidencia para otro dominio, la skill actualiza y
valida el manifiesto antes de leer la nueva referencia.
```

Do not document YAML as a persisted file or public API.

- [ ] **Step 2: Record the standalone extraction as the next direction**

Add one concise paragraph to the README architecture section:

```markdown
El próximo cambio planificado es diseñar la extracción del workflow standalone
como una Agent Skill independiente, de modo que esta skill conserve un foco
exclusivamente Flutter. Esa extracción no forma parte del manifiesto actual y
requiere su propia especificación, aprobación y pruebas de equivalencia.
```

Do not create, rename, or modify any standalone skill or reference.

- [ ] **Step 3: Update the canonical changelog**

Under `CHANGELOG.md` → `## [Unreleased]` → `### Added`, append exactly:

```markdown
- Added an internal, request-visible route manifest for evidence-backed workflow and reference selection.
```

Do not add a second entry for the future standalone extraction because it is
not implemented.

- [ ] **Step 4: Run structural reference checks**

Run:

```bash
while IFS= read -r reference; do
  test -f ".agents/skills/enforcing-flutter-standards/$reference" || exit 1
done < <(
  rg -o 'references/[A-Za-z0-9._/-]+\\.md' \
    .agents/skills/enforcing-flutter-standards/SKILL.md |
    sort -u
)
test "$(wc -c < .agents/skills/enforcing-flutter-standards/SKILL.md)" -lt 20000
! rg -n 'route-manifest\\.md' \
  .agents/skills/enforcing-flutter-standards/SKILL.md
rg -n 'references/standalone-workflow\\.md' \
  .agents/skills/enforcing-flutter-standards/SKILL.md
```

Expected: exit 0, every referenced Markdown file exists, `SKILL.md` is below
20,000 characters, no new `route-manifest.md` is referenced, and standalone
remains present for the future extraction.

- [ ] **Step 5: Run the unchanged inspector regression suite**

Run:

```bash
CI=true <dart-sdk>/bin/dart \
  skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart
```

Expected:

```text
PASS: 10 tests
```

The `CI=true` environment prevents the local Dart wrapper from attempting a
telemetry timestamp write outside the managed sandbox.

- [ ] **Step 6: Run final repository checks**

Run:

```bash
git diff --check
git status --short
git diff --stat 896377c
git diff 896377c -- \
  .agents/skills/enforcing-flutter-standards/SKILL.md \
  skill-evals/enforcing-flutter-standards/behavior-scenarios.md \
  skill-evals/enforcing-flutter-standards/scorecard.md \
  README.md \
  CHANGELOG.md
```

Expected:

- no whitespace errors;
- only the five approved implementation files are modified by Tasks 1–3;
- the unrelated untracked repository-health plan remains untouched;
- no inspector, thematic reference, standalone workflow, dependency, or tool
  configuration change appears.

- [ ] **Step 7: Review requirements line by line**

Compare the final diff with every criterion in
`docs/superpowers/specs/2026-07-30-route-manifest-design.md` and record:

```text
Manifest inside SKILL.md:
Internal by default:
Safe requested view:
Exact mode/scenario/workflow:
Evidence per reference:
Workflow exclusivity:
Deferred audit template:
Pre-load evidence update:
No persistence or private reasoning:
RM1–RM5:
R1–R7:
Standalone extraction only documented as future:
```

Every row must contain fresh evidence or a concrete unresolved gap. Do not mark
completion from test status alone.

- [ ] **Step 8: Commit documentation and changelog**

Run:

```bash
git add README.md CHANGELOG.md
git diff --cached --check
git commit -m "docs: describe route manifest"
```

Expected: one documentation-only commit.

- [ ] **Step 9: Run post-commit verification**

Run again after the documentation commit:

```bash
CI=true <dart-sdk>/bin/dart \
  skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart
git diff --check
git status --short
```

Expected:

- inspector suite reports `PASS: 10 tests`;
- `git diff --check` exits 0;
- the only remaining status entry is the unrelated untracked
  `docs/superpowers/plans/2026-07-29-repository-health-audit-b1.md`.

- [ ] **Step 10: Report completion evidence**

The final implementation report must state:

- the exact approved scope;
- RM1–RM5 RED reasons and GREEN outcomes;
- R1–R7 regression outcomes;
- final `SKILL.md` word, character, and approximate-token counts;
- inspector test command and `10/10` result;
- structural reference-check result;
- `git diff --check` result;
- changelog entry and location;
- unchanged inspector, thematic references, and standalone workflow;
- the independent standalone skill as the next separately designed change;
- any skipped validation and its reason.
