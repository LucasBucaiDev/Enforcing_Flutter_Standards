# Flutter audit report template

Load this reference only after audit evidence and classifications are complete
and the report is ready to be formatted. The binding audit rules remain in
`audit-contract.md`.

## Complete finding example

The following is illustrative and shows the required shape without asserting
that these files exist in the audited project:

```text
Severity: blocking
Location: packages/api_client/pubspec.yaml:18 and
  packages/auth_repository/pubspec.yaml:21; dependency edges
  api_client → auth_repository → api_client
Evidence: The read-only inspector reported the directed cycle
  ["api_client", "auth_repository", "api_client"]. The two cited path
  dependencies reproduce those edges, and auth_repository is already consumed
  by api_client for token access.
Impact: Neither package is a lower stable boundary. The cycle prevents a
  directed package architecture, couples HTTP infrastructure upward to the
  auth repository, and makes isolated resolution, testing, and replacement
  unsafe.
Recommendation: Introduce a small token/session provider contract at a lower
  stable boundary. Let auth_repository implement it and inject it into
  api_client, then remove the api_client → auth_repository edge and rerun the
  package-cycle check plus tests for both packages and their direct dependents.
  Treat any new package extraction as a separately named package decision.
Scope classification: current change
```

## Example audit summary and implementation order

```text
Audit scope: changed package manifests and their direct dependents.
Evidence sources: scoped Git diff, the two manifests named above, and the
read-only package-graph inventory.
Findings: 1 blocking, 0 important, 0 improvement.
Current change: the blocking package cycle.
Future debt: none supported by the inspected evidence.

Proposed implementation order:
1. Batch: B1 — Restore acyclic token dependency direction.
   Findings and exact scope: the blocking current-change package-cycle finding
   above; only the lower token/session boundary and affected package edges.
   Files/boundaries: the lower token/session contract, auth_repository
   implementation, api_client injection, and affected manifests.
   Tests/characterization: focused RED/GREEN boundary tests for injected token
   access, plus existing tests for both affected packages and direct
   dependents.
   Separate decisions/approvals: explicit approval of B1; separate approval if
   the contract requires a new package or dependency.
   Verification: applicable format, analysis, code generation, focused and
   full tests, coverage, generated consistency, package/direct-dependent
   checks, build, and dependency-cycle verification.
   Changelog: the existing canonical changelog, with a concise entry in its
   established category for the approved boundary change.
   Dependencies on batches: none.

Implementation status: not started. The audit remains read-only while waiting
for explicit approval of B1.
```
