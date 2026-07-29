# Optional Superpowers composition

Superpowers is an optional process integration, never an activation
prerequisite for this Flutter standards skill. This skill remains usable in
every runtime and always retains its Flutter gates.

## Availability and fallback

Before naming, loading, or using a Superpowers skill for the current request,
discover the skills actually available in the runtime. Do not infer that a
skill is available from this reference or from a runtime-specific catalog.

Select the composition only from the discovered available skills. If any
mapped Superpowers skill is absent, follow
`references/standalone-workflow.md` for the whole request instead. The
fallback is deterministic: it preserves every Flutter audit, approval, TDD,
verification, security, and changelog gate; it does not skip or weaken a gate
because Superpowers is unavailable.

Route to the discovered Superpowers skill only when it is actually available.
This reference defines selection and ownership; it does not reproduce
Superpowers instructions.

## Scenario mapping

When every named skill in the applicable row is available, use this
composition in the stated order. Terms such as TDD and verification in the
table refer to the discovered Superpowers skills named in the relevant rows.

| Scenario | Required composition when available |
|---|---|
| New feature or behavior | `superpowers:brainstorming` → `superpowers:writing-plans` → `superpowers:test-driven-development` → `superpowers:verification-before-completion` |
| Refactor | `superpowers:brainstorming` when design changes → `superpowers:writing-plans` → characterization tests/TDD → verification |
| Bug | `superpowers:systematic-debugging` → `superpowers:test-driven-development` → `superpowers:verification-before-completion` |
| Audit only | Flutter audit contract; no creative workflow required |
| Incoming review feedback | `superpowers:receiving-code-review` → TDD when implementation changes |
| Important completion | `superpowers:requesting-code-review` plus verification |

## Flutter gates and ownership

Superpowers owns general process discipline. This skill owns Flutter-specific
architectural and UI decisions, and its requirements in
`references/engineering-standards.md` remain mandatory in either composition.

For an audit-only request, use `references/audit-contract.md` and remain
strictly read-only: inspect and report evidence and proposals, without a
creative workflow or implementation. Audit approval is not implementation
approval.

For incoming review feedback that changes implementation, retain the TDD
predicate: use the mapped TDD process when discovered, or the standalone RED,
GREEN, and REFACTOR gates when it is not. Review-only feedback remains
read-only under the audit contract.

For important completion, retain the verification predicate: request the
mapped review and complete fresh verification when both are discovered; if
either is absent, use the standalone review-diff and verification gates. Do
not claim completion until the applicable verification evidence is fresh.
