# Route manifest final-fix report

## Status

The final-review fix wave is complete under the approved stop condition. All
RM1–RM5 checkpoints pass with raw and chronological evidence. The strict
R-regression matrix is not fully green: R1, R2, R5, and R7 are recorded as
failures. Per the governing direction, the Superpowers-specific R1, R5, and R7
variance and the R2 capture failure are non-load-bearing future direction; they
did not authorize another router redesign or evaluator reset.

## Finding-by-finding disposition

1. **RM4 lacked out-of-band proof.** Fixed in
   `skill-evals/enforcing-flutter-standards/scorecard.md:525`,
   `:543`, `:643`, and `:658`. Two distinct trace thread IDs prove the same
   effective Superpowers Bug route, three Flutter references, Bug composition,
   diagnosis, and correction. Run A remains metadata-free; Run B exposes only
   the requested safe projection.
2. **RM5 lacked chronological proof.** Fixed in
   `skill-evals/enforcing-flutter-standards/scorecard.md:526`,
   `:550`, `:681`, `:701`, and `:722`. One persistent thread records the
   initial manifest, a second turn with the updated package reference and zero
   command reads, then a third turn that reads only
   `packages-and-integrations.md`.
3. **R1–R7 had aggregate assertions without inspectable evidence.** Fixed in
   `skill-evals/enforcing-flutter-standards/scorecard.md:16`,
   `:518`, `:540`, and the raw blocks beginning at `:565`. The final table and
   verbatim captures now report actual results instead of an aggregate pass:
   R1 fail, R2 fail, R3 pass, R4 pass, R5 fail, R6 pass, R7 fail.
4. **Task 2 GREEN outputs had been whitespace-normalized.** Fixed by labeling
   those historical records as normalized and superseded at
   `skill-evals/enforcing-flutter-standards/scorecard.md:307`, and by adding
   byte-checked final-review captures at `:477`. Fourteen accepted raw outputs
   are embedded unchanged. R2 was not normalized into a pass: six technical
   captures with trailing-space Markdown hard breaks were rejected and hashed,
   so R2 remains a failure.
5. **Explicit selected-skill requests did not make routing metadata visible.**
   Fixed in `.agents/skills/enforcing-flutter-standards/SKILL.md:146`.
   Explicit manifest, route, workflow, skill, reference, or selection-reason
   requests now select `visibility: requested`; the safe projection may include
   selected skill names without private reasoning.
6. **The manifest validator omitted the absence-of-evidence invariant.** Fixed
   in `.agents/skills/enforcing-flutter-standards/SKILL.md:158`, including the
   explicit invariant at `:170`.
7. **README described only two workflows and incomplete fallback behavior.**
   Fixed in `README.md:95` and `README.md:98`. It now documents all four
   workflows, fallback when any required skill is absent, and strict
   Superpowers/standalone exclusivity.
8. **RM1–RM5 lacked named evaluator-only checkpoints.** Fixed in
   `skill-evals/enforcing-flutter-standards/behavior-scenarios.md:349`,
   `:374`, `:404`, `:436`, and `:461`. The approved RM1.1–RM5.6 rubrics are
   now present without changing agent-visible prompts.

The minimum neighboring router clarifications are at
`.agents/skills/enforcing-flutter-standards/SKILL.md:26` (separate dependency
or migration request/comparison/plan/approval), `:90` (harness framing is not
project audit evidence), and `:152` (`references_now` contains routed
reference paths, while selected skills remain separate).

## Evaluator harness

- CLI: `codex-cli 0.146.0-alpha.3.1`
- Model: `gpt-5.6-terra`
- Reasoning effort: `medium`
- Reasoning summary: `none`
- Isolation: ephemeral process, ignored user configuration and repository
  rules, strict configuration, read-only sandbox, empty working directory, and
  no rubric, scorecard, plan, findings, prior response, or intended answer.
- Evaluated router SHA-256:
  `71700cba3643c3e6f1f2a547b8fd6114132a29b9f484a1b3065d838fcb80bdd3`

The common fresh-run command shape was:

```text
codex -a never exec --ephemeral --ignore-user-config --ignore-rules --skip-git-repo-check --strict-config --sandbox read-only --model gpt-5.6-terra -c 'model_reasoning_effort="medium"' -c 'model_reasoning_summary="none"' --cd <empty-directory> --json --output-last-message <raw-path> -
```

RM1–RM4 and each accepted R capture used a fresh thread. RM5 used persistent
thread `<thread-id>` for its three required stages.
The exact historical R prompts were preserved byte-for-byte by a temporary
compatibility symlink. It was removed with `unlink`; both `test ! -e` and
`test ! -L` passed afterward.

## Raw and trace evidence

Accepted RM raw/JSONL pairs are under:

- `/private/tmp/route-manifest-final.PkD8IC/rm1/`
- `/private/tmp/route-manifest-final.PkD8IC/rm2/`
- `/private/tmp/route-manifest-final.PkD8IC/rm3/`
- `/private/tmp/route-manifest-final.PkD8IC/rm4a/`
- `/private/tmp/route-manifest-final.PkD8IC/rm4b/`
- `/private/tmp/route-manifest-final.PkD8IC/rm5/stage1/`
- `/private/tmp/route-manifest-final.PkD8IC/rm5/stage2/`
- `/private/tmp/route-manifest-final.PkD8IC/rm5/stage3/`

Accepted transport-valid R raw/JSONL pairs are:

- R1:
  `/private/tmp/route-manifest-final.PkD8IC/r-regression-agent/r1.raw`
  and `.trace.jsonl` — oracle fail.
- R3:
  `/private/tmp/route-manifest-final.PkD8IC/r-regression-agent/r3.raw`
  and `.trace.jsonl` — pass.
- R4: `/private/tmp/route-manifest-final.PkD8IC/r4/final.raw` and
  `trace.jsonl` — pass.
- R5: `/private/tmp/route-manifest-final.PkD8IC/r5/final.raw` and
  `trace.jsonl` — setup/workflow-evidence fail.
- R6: `/private/tmp/route-manifest-final.PkD8IC/r6/final.raw` and
  `trace.jsonl` — pass.
- R7: `/private/tmp/route-manifest-final.PkD8IC/r7/final.raw` and
  `trace.jsonl` — exclusivity fail.

R2 has no accepted raw. Six rejected capture hashes and the reasons are
preserved in the scorecard. Rejected and pre-final attempts remain under the
same temporary root and were neither normalized nor used as passing evidence.
The repository scorecard contains all fourteen accepted raw responses verbatim,
their read chronology, and the actual oracle dispositions.

For every accepted pair, the final validation proved one `thread.started`, one
`turn.started`, one `turn.completed`, no `error`/`turn.failed`, byte identity
between the raw file and the final JSONL `agent_message`, and no trailing
whitespace.

## Actual evaluator dispositions

| Scenario | Result |
|---|---|
| RM1 | Pass — RM1.1–RM1.7 |
| RM2 | Pass — RM2.1–RM2.7 |
| RM3 | Pass — RM3.1–RM3.7 |
| RM4 | Pass — RM4.1–RM4.5 |
| RM5 | Pass — RM5.1–RM5.6 |
| R1 | Fail — explicit root cause follows the correction steps |
| R2 | Fail — no admissible whitespace-clean verbatim capture |
| R3 | Pass |
| R4 | Pass |
| R5 | Fail — declared feature composition was not readable |
| R6 | Pass |
| R7 | Fail — partial Superpowers references precede standalone |

The independent final diff reviewer found two Important inconsistencies: the
R3 chronology was reversed in prose, and R5 was incorrectly marked passing
despite unreadable required skills. Both were corrected. After receiving the
governing non-load-bearing Superpowers direction, the reviewer reported no
remaining Critical or Important finding.

## Verification commands and actual results

```text
CI=true dart run skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart
```

Final run: exit `0`; `PASS: 10 tests`. An earlier sandboxed invocation exited
`1` only because Flutter could not write its SDK cache; the required
out-of-sandbox rerun above passed.

```text
git diff --check
git diff --cached --check
```

Both final pre-commit checks exited `0` with no output.

```text
wc -w -c .agents/skills/enforcing-flutter-standards/SKILL.md
```

Result: `1641` words and `12912` bytes, below the 5,000-token recommendation's
existing conservative 20,000-character proxy.

The final acceptance loop used `jq` to count trace lifecycle/error events,
reconstructed each final `agent_message`, compared it with `cmp -s`, checked
each raw with `rg -q '[[:blank:]]+$'`, and extracted each scorecard block for a
second `cmp -s`. Result:

```text
ACCEPTED_RAW_TRACE_VALID=14
VERBATIM_EMBEDS_VALID=14
RM1_CHECKPOINTS=7
RM2_CHECKPOINTS=7
RM3_CHECKPOINTS=7
RM4_CHECKPOINTS=5
RM5_CHECKPOINTS=6
REFERENCES_MISSING=0
REFERENCE_DIFF_COUNT=0
CHANGELOG_ROUTE_ENTRY_COUNT=1
COMPATIBILITY_SHIM=absent
DIFF_CHECK=pass
```

`git diff --name-only 5d5495a` before the implementation commit returned only:

```text
.agents/skills/enforcing-flutter-standards/SKILL.md
README.md
skill-evals/enforcing-flutter-standards/behavior-scenarios.md
skill-evals/enforcing-flutter-standards/scorecard.md
```

Flutter formatting, analysis, code generation, coverage, and builds were not
applicable to the Markdown-only implementation. The full Dart inspector suite
was nevertheless run as required. No dependency, lockfile, configuration,
script, test, thematic reference, or standalone workflow file changed.

## Changelog

`CHANGELOG.md` already contains exactly one route-manifest entry:

```text
- Added an internal, request-visible route manifest for evidence-backed workflow and reference selection.
```

It was not duplicated or modified.

## Commits

- Base for this fix wave: `5d5495a`
- Implementation and evidence: `73397599fbeef74d64c1bf2a7f05dde982809972`
- This report is stored in the subsequent documentation commit; that commit's
  hash is necessarily reported in the parent handoff rather than
  self-referenced here.

## Final scope and concerns

Implementation scope is limited to the four planned files listed by the final
`git diff --name-only`; this mandated report is the only additional file.

Remaining concerns are explicit:

- R1 meets its reference and technical oracle but diagnoses after proposing.
- R2 has no whitespace-compliant verbatim response despite technical passes.
- R5 could not prove the declared complete Superpowers feature composition.
- R7 reads a forbidden partial Superpowers route before standalone.
- Future exact R-prompt runs still require a controlled compatibility step for
  the historical worktree path.
- Superpowers is planned to be replaced by local skills; these failures are
  recorded for that future direction and were not used to broaden this change.

No remaining approved implementation work is hidden by this report.
