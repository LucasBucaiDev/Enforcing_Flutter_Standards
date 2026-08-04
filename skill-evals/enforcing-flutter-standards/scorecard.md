# Flutter composition scorecard

## Active composition suite

| ID | Required behavior | Initial RED | Final GREEN | Observed evidence |
|---|---|---|---|---|
| F1 | Generic feature design plus Flutter architecture/state only | Missing dependency and excessive context | Pass | Fresh isolated run read both cores, `design-and-approve.md`, then `architecture-and-state.md`; route was `implementation` / `feature` / `design` and Freezed remained conditional on project policy and approval. |
| F2 | Missing generic dependency blocks without fallback | Local fallback continued | Pass | Fresh catalog containing only Flutter read its core, reported the required dependency missing, read no reference, and stopped. |
| F3 | Generic diagnosis plus Flutter networking only | Missing dependency and premature context | Pass after routing fix | Final isolated rerun showed `implementation` / `bug` / `diagnose` and read both cores, `diagnose.md`, then `networking-and-errors.md`; no quality, design, or completion reference. |
| F4 | Generic audit plus Flutter architecture; report deferred | Local audit ownership and premature template | Pass after routing fix | Final isolated rerun showed `audit` / `audit-review` / `inspect` and read both cores, `audit-and-review.md`, then `architecture-and-state.md`; report and Flutter quality remained unloaded. |
| F5 | Approved UI behavior uses test-first plus Flutter UI/quality | Local fallback composition | Pass | Fresh isolated run read both cores, `test-first-change.md`, `flutter-quality.md`, then `ui-implementation.md` and required focused widget RED before implementation. |
| F6 | Completion covers local package and direct dependent | Excessive local workflow context | Pass | Fresh isolated run read both cores, `verify-and-complete.md`, `packages-and-integrations.md`, then `flutter-quality.md`; it required fresh gates in both package and dependent. |
| F7 | Organized features still expose deliberate barrels and consumers use them | Missing feature barrel; consumers retained per-file cross-feature imports | Pass | Fresh isolated run read both cores, `design-and-approve.md`, then `architecture-and-state.md`; it required one deliberate feature barrel, replaced cross-feature implementation imports, kept internal imports direct, and rejected layer barrels without an observed cross-layer consumer. |

The F3 first composition attempt had correct reference selection but omitted the
requested route record. The core was tightened and the fresh rerun passed. The
F4 first attempt anticipated `flutter-quality.md`; Flutter routing was narrowed
and the fresh rerun passed with only the required domain reference.

## Static and inspector gates

| Gate | Result | Evidence |
|---|---|---|
| Context budgets and active-route cleanup | Pass | `Context budget GREEN: all static gates passed.` |
| Inspector regression | Pass | `inspect_flutter_project_test.dart`: 10/10 tests. |

Historical scorecards are non-executable evidence under
`docs/superpowers/evals/`.
