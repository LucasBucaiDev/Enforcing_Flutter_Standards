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
1. B1 — Restore acyclic token dependency direction.
   Scope: the lower token/session contract, auth_repository implementation,
   api_client injection, affected manifests, focused boundary tests, direct
   dependent tests, cycle verification, and the existing canonical changelog.
   Approval needed: explicit approval of B1; separate approval if the contract
   requires a new package or dependency.

Implementation status: not started. The audit remains read-only while waiting
for explicit approval of B1.
```
