# Flutter networking and errors

Load this reference for HTTP clients, request cancellation, retries, transport
boundaries, typed failures, result handling, or user-visible error decisions
supported by observable project evidence.

## Networking

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| The project has a coherent, testable HTTP client that meets the requirements. | Preserve it. Do not migrate merely because another client is preferred. | Migration requires a demonstrated gap, dependency comparison, bounded plan, and explicit approval. | Name the existing client, inspected capabilities, and retention or approved-migration decision. |
| A new general REST client needs a dedicated HTTP solution. | Prefer Dio, subject to the full dependency decision. | Adding Dio requires explicit approval. | Record requirements, comparison, approval, version resolution, and checks. |
| A small isolated integration has limited needs and another client has lower weight and surface area. | Preserve or propose the smaller encapsulated client when it wins the dependency comparison. | Adding or changing the client still requires approval. | Record isolation boundary and comparison. |
| A request may become irrelevant before completion. | Propagate cancellation through the integration boundary. | None. | Identify cancellation token/signal flow and test. |
| A retry is proposed. | Retry only an approved idempotent operation under an explicit policy. | Retry policy requires approval. | Record operation idempotence, attempts/backoff policy, approval, and tests. |

Inject one configured client instead of creating ad hoc clients. Declare base
URL, timeouts, and required headers. Give interceptors small explicit
responsibilities. Map HTTP, transport, and format errors to owned errors. Redact
tokens, credentials, bodies, headers, query values, and responses. Keep
`Response`, `DioException`, and other vendor types inside infrastructure.
Serialize justified DTO contracts with Freezed and JSON. Test requests,
responses, cancellation, and error mapping at the package boundary without
real external calls.

## Errors and results

Services and data sources call APIs, plugins, and other external sources.
Repositories map external exceptions to owned typed failures. Blocs and Cubits
turn results into explicit states. UI consumes those states and never
interprets exceptions or displays raw technical messages.

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| An SDK or external source can throw. | Catch at the external boundary and map the exception to a typed failure before returning a result. `Either` does not remove this catch requirement. | Adding `fpdart` or another result dependency requires comparison and approval; retain coherent existing `dartz` or `fpdart` usage. | Name caught exception families, failure mapping, result type, and boundary tests. |
| Code consumes a typed result. | Exhaustively consume both branches with `fold` or `match` and map them to explicit state or behavior. | None. | Cite the fold/match site and tests for success and failure. |
| UI-visible failure handling is added. | Present a product-appropriate message/state; keep raw technical errors out of UI. | Product-copy ambiguity may require a user/product decision. | Record the typed failure-to-state/message mapping. |

Unsafe result access is prohibited:

```dart
final order = result.asRight() as Order;       // unsafe branch assumption
final failure = result.asLeft() as AppFailure; // unsafe branch assumption
final value = result.value as Order;           // unchecked value access
final error = result.failure as AppFailure;    // unchecked failure access
```

Do not add equivalent helpers or casts under different names. Consume every
branch:

```dart
return result.fold(
  (failure) => OrderState.failure(failure),
  (order) => OrderState.success(order),
);

return result.match(
  (failure) => OrderState.failure(failure),
  (order) => OrderState.success(order),
);
```
