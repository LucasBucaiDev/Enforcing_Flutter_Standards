# Evidence-Driven Development scorecard

## Generic workflow

| ID | Required routing and behavior | Initial RED | Final GREEN | Observed evidence |
|---|---|---|---|---|
| G1 | Diagnosis only; load `diagnose.md` | Flutter fallback and premature context | Pass after routing fixes | Final isolated Node run showed `implementation` / `bug` / `diagnose`, read only the core and `diagnose.md`, bounded the unverified cause, and proposed no correction. |
| G2 | Feature design; load `design-and-approve.md` | No generic route | Pass | Isolated Python run showed `implementation` / `feature` / `design`, produced one bounded approvable batch, and read only the core and design reference. |
| G3 | Approved uncovered refactor uses characterization | Flutter workflow context | Pass | Isolated Java run showed `implementation` / `refactor` / `implement`, read only `test-first-change.md`, and required passing pre-refactor characterization evidence without inventing RED. |
| G4 | Read-only audit; report deferred | No formal generic finding | Pass after fixture rerun | Final Go fixture run showed `audit` / `audit-review` / `inspect`, read only `audit-and-review.md`, found the exact `a → b → a` cycle, kept `report-contracts.md` deferred, and issued a blocking current-change disposition. |
| G5 | Approved behavior change observes focused RED | Wrong route and Flutter context | Pass after scenario fix | Final Rust run showed `implementation` / `feature` / `implement`, read only `test-first-change.md`, executed the requested command, and reported `cargo` unavailable without fabricating a test result. |
| G6 | Completion loads only verification guidance | No generic completion route | Pass | Isolated TypeScript run showed `implementation` / `completion` / `verify`, read only `verify-and-complete.md`, and listed fresh format, lint, typecheck, test, build, diff, dependent, and changelog gates with honest skipped reasons. |
| G7 | Review feedback evaluated before mutation | Excessive Flutter context | Pass | Isolated review showed `review` / `review-feedback` / `inspect`, read only `audit-and-review.md`, rejected an authority-only queue migration, and made no mutation. |
| G8 | Documentation-only no-test predicate | Wrong generic scenario | Pass after scenario fix | Final Markdown run showed `implementation` / `feature` / `implement`, read only `test-first-change.md`, recorded the exact no-logic predicate and Markdown validation, and claimed no RED. |
| G9 | Untested implementation removed before RED | Flutter workflow context | Pass | Isolated C# run read only `test-first-change.md` and required removing every repository/deployable copy without stash, comment, copy, or implementation reference before the focused RED. |
| G10 | Route internal by default and safe on request | Inconsistent generic route | Pass | Run A read `diagnose.md` and printed no routing metadata. Run B read the same reference and exposed only the requested seven-field safe record with `implementation` / `bug` / `diagnose`. |

## Static context budget

| Gate | Initial RED | Final GREEN |
|---|---|---|
| Generic source exists and all generic files meet budgets | Missing source | Pass |
| Flutter core meets 140-line/800-word/7-KB budget | 251 lines, 1,619 words, 12,912 bytes | Pass |
| Active skills contain no legacy workflow route | Three active files matched | Pass |
| Four embedded Flutter workflow/audit contracts are retired | Four files active | Pass |

Final command output:

```text
Context budget GREEN: all static gates passed.
```

Every final run used an ephemeral isolated directory containing only the
deployable skill or skills required by the scenario and its synthetic fixture.
