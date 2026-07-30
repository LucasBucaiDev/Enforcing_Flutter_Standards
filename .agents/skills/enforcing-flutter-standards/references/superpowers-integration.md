# Optional Superpowers composition

## Availability rule

Discover whether Superpowers itself and the skills required for the current
request are actually available; never infer either from this reference or a
runtime catalog. Use this composition only when Superpowers is discoverable
and every skill required by the applicable scenario is available. Otherwise
use `references/standalone-workflow.md` for the whole request. Never combine a
partial Superpowers route with the standalone workflow.

## Scenario mapping

Follow only the applicable row and the loaded skills' own instructions.

| Scenario | Required composition when available |
|---|---|
| New feature or behavior | `superpowers:brainstorming` → `superpowers:writing-plans` → `superpowers:test-driven-development` → `superpowers:verification-before-completion` |
| Refactor | `superpowers:brainstorming` when design changes → `superpowers:writing-plans` → `superpowers:test-driven-development` when behavior changes → `superpowers:verification-before-completion` |
| Bug | `superpowers:systematic-debugging` → `superpowers:test-driven-development` → `superpowers:verification-before-completion` |
| Audit or read-only review | No Superpowers skill; use the Flutter audit contract read-only |
| Incoming review feedback | `superpowers:receiving-code-review` → `superpowers:test-driven-development` and `superpowers:verification-before-completion` when implementation changes |
| Important completion | `superpowers:requesting-code-review` → `superpowers:verification-before-completion` |

## Flutter ownership

Superpowers owns general process composition. The Flutter references selected
by the router own architecture, state, packages, integrations, networking,
errors, persistence, navigation, security, environments, quality, delivery,
audit, and UI decisions. Apply every loaded Flutter reference throughout the
selected composition.
