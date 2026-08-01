# Evidence-Driven Development scorecard

## Generic workflow

| ID | Required routing and behavior | Initial RED | Final GREEN | Observed evidence |
|---|---|---|---|---|
| G1 | Diagnosis only; load `diagnose.md` | Flutter fallback and premature context | Pass after routing fixes | Final isolated Node run showed `implementation` / `bug` / `diagnose`, read only the core and `diagnose.md`, bounded the unverified cause, and proposed no correction. |
| G2 | Feature design produces a revisioned, approvable plan; load `design-and-approve.md` | Strengthened RED — omitted immutable revision, numbered criteria, exact map/sequence, formal test matrix, and risks/recovery | Pass after fixture clarification | Final isolated Python run showed `implementation` / `feature` / `design`, read only the core and design reference, and emitted every required plan field with no material store-contract unknown. |
| G3 | Approved uncovered refactor uses characterization | Flutter workflow context | Pass | Isolated Java run showed `implementation` / `refactor` / `implement`, read only `test-first-change.md`, and required passing pre-refactor characterization evidence without inventing RED. |
| G4 | Read-only audit; report deferred | No formal generic finding | Pass after fixture rerun | Final Go fixture run showed `audit` / `audit-review` / `inspect`, read only `audit-and-review.md`, found the exact `a → b → a` cycle, kept `report-contracts.md` deferred, and issued a blocking current-change disposition. |
| G5 | Approved behavior change observes focused RED | Wrong route and Flutter context | Pass after scenario fix | Final Rust run showed `implementation` / `feature` / `implement`, read only `test-first-change.md`, executed the requested command, and reported `cargo` unavailable without fabricating a test result. |
| G6 | Completion loads only verification guidance | No generic completion route | Pass | Isolated TypeScript run showed `implementation` / `completion` / `verify`, read only `verify-and-complete.md`, and listed fresh format, lint, typecheck, test, build, diff, dependent, and changelog gates with honest skipped reasons. |
| G7 | Review feedback evaluated before mutation | Excessive Flutter context | Pass | Isolated review showed `review` / `review-feedback` / `inspect`, read only `audit-and-review.md`, rejected an authority-only queue migration, and made no mutation. |
| G8 | Documentation-only no-test predicate | Wrong generic scenario | Pass after scenario fix | Final Markdown run showed `implementation` / `feature` / `implement`, read only `test-first-change.md`, recorded the exact no-logic predicate and Markdown validation, and claimed no RED. |
| G9 | Safe baseline RED across bug, absent feature, present behavior, preexisting user work, premature agent work, and ambiguous ownership | Strengthened RED — preexisting user work still required deletion authorization; ambiguous ownership still allowed later deletion; premature agent work inherited global-removal language | Pass across six isolated variants | Final runs preserved user work, removed only an exact bounded agent-owned diff, stopped on ambiguous ownership, rejected RED/GREEN for an initially passing test, required expected bug/feature RED, and used the exception contract when no integrity-preserving RED was available. |
| G10 | Route internal by default and safe on request | Inconsistent generic route | Pass | Run A read `diagnose.md` and printed no routing metadata. Run B read the same reference and exposed only the requested seven-field safe record with `implementation` / `bug` / `diagnose`. |
| G11 | Approval must identify batch and plan revision | RED — accepted approval by batch name, entered `implement`, and loaded test-first guidance | Pass after clean routing rerun | Final isolated run remained in `approve`, read only the core and `design-and-approve.md`, rejected the batch-only approval, and requested `Idempotency guard` plus revision 7. |
| G12 | A material change increments revision and invalidates prior approval | Behavioral baseline passed by prudent inference; static contract RED because no binding material-change rule existed | Pass | Final isolated run classified the criteria and map expansion as material, invalidated revision 3, required revision 4 approval, and read only the core and design reference. |
| G13 | Delegation preserves one route, bounded authority, safe mutation isolation, evidence provenance, and coordinator-owned integration/verification | Static RED — 12 missing routing, topology, delegation, and verification guarantees | Pass across five fresh-agent runs | Read-only inspection used bounded task contracts and one synthesis; competing diagnosis stayed unresolved pending a discriminator; isolated worktrees allowed bounded parallel mutation while shared-tree/generated/lockfile work serialized; verification serialized mutating gates, invalidated an integration-affected delegated test, and retained final ownership in the coordinator. |

## Static context budget

| Gate | Initial RED | Final GREEN |
|---|---|---|
| Generic source exists and all generic files meet budgets | Missing source | Pass |
| Flutter core meets 140-line/800-word/7-KB budget | 251 lines, 1,619 words, 12,912 bytes | Pass |
| Active skills contain no legacy workflow route | Three active files matched | Pass |
| Four embedded Flutter workflow/audit contracts are retired | Four files active | Pass |
| Approvable-plan fields, material-change rule, approval identity, and mutation-map ceiling are explicit | Ten missing-contract failures | Pass |
| Delegation reference, task schema, execution topology, mutation isolation, provenance, and gate invalidation are explicit | Twelve missing-contract failures | Pass |

Final command output:

```text
Context budget GREEN: all static gates passed.
```

G1–G12 final runs used ephemeral isolated directories containing only the
deployable skill or skills required by each scenario and its synthetic fixture.
G13 used five fresh agent contexts pointed read-only at the deployable skill;
the prompts excluded plans, rubrics, evaluations, changelog, and Git history,
and no forward-test artifacts were created.
