# Flutter navigation

Load this reference for Navigator, declarative routing, deep links, URL state,
authentication redirects, or route-migration decisions supported by observable
project evidence.

## Navigation

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| Existing navigation is coherent and meets requirements. | Retain it. | Migration requires evidence of a gap, dependency comparison, scoped plan, and explicit approval. | Name the current solution, requirements checked, and retention/migration decision. |
| The app or flow is small, linear, modal, local, or has no URL-state requirement. | Use Navigator for the local/simple flow. | None beyond normal feature approval. | Record flow shape and absence of declarative-routing predicates. |
| Deep links, web URL state, authentication redirects, complex declarative parameters/routes, persistent nested navigation, or growing imperative complexity are present. | Propose `go_router` for primary routes; Navigator may still handle local interactions. | Adding the dependency or migrating navigation requires justification and approval. | List satisfied predicates, comparison/approval, route scope, and navigation tests. |
