# Flutter navigation

<!-- provenance: flutter-navigation, flutter-deep-linking, flutter-deep-link-validation, project-policy-navigation -->

Load this reference for Navigator, declarative routing, deep links, URL state,
authentication redirects, or route-migration decisions supported by observable
project evidence.

## Navigation

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| Existing navigation is coherent and meets requirements. | Retain it. | Migration requires evidence of a gap, dependency comparison, scoped plan, and explicit approval. | Name the current solution, requirements checked, and retention/migration decision. |
| The app or flow is small, linear, modal, local, or has no URL-state requirement. | Use Navigator for the local/simple flow. | None beyond normal feature approval. | Record flow shape and absence of declarative-routing predicates. |
| Deep links, web URL state, authentication redirects, complex declarative parameters/routes, persistent nested navigation, or growing imperative complexity are present. | Retain a coherent declarative router. When none is suitable, compare `go_router` for primary routes; Navigator may still handle local interactions. | Adding the dependency or migrating navigation requires justification and approval. | Name the current solution and gap; record any comparison/approval, route scope, and navigation tests. |

## Deep links and nested navigation

Preserve a coherent existing router. Before changing it, inventory route names
and paths, parameter parsing, redirect ownership, nested navigation stacks,
back behavior, URL serialization, unknown routes, and current platform setup.
Adding `go_router`, another package, or a migration remains separately approved.

1. Define one canonical URI contract and expected destination, parameters,
   authentication behavior, stack, and back result for each supported link.
2. Keep parsing and serialization symmetric. Make redirects finite and retain
   the intended nested navigation branch or shell state.
3. Configure only supported targets: Android intent filters/App Links; iOS
   Universal Links or custom schemes; web path/hash strategy plus hosting rewrite
   and direct-refresh behavior. Avoid double handling with an installed plugin.
4. Add focused route/parser tests and an app-level test when stack restoration,
   redirects, or nested navigation require the complete router.

## Platform validation

Derive schemes, hosts, paths, package IDs, devices, and commands from the project.
Candidates, only when consistent with its tooling, are:

- Android: launch the URI with `adb shell am start` and the project's package;
- iOS Simulator: use `xcrun simctl openurl booted <uri>`;
- Android and iOS: inspect configuration with the DevTools Deep Link Validator;
- web: open the direct URL, refresh it, and exercise browser back/forward against
  the deployed hosting rewrite, not only the development root route.

Record URI, cold/warm state, platform and target, resulting screen and parameters,
stack/back behavior, command, and result. One platform does not validate another.
