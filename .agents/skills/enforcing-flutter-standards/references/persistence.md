# Flutter persistence

Load this reference for local storage, secure storage, structured persistence,
Hive, Drift, ObjectBox, or migration decisions supported by observable project
evidence.

## Local persistence

Choose storage from data shape and criticality, not isolated library
preference.

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| New data is a simple, non-sensitive, non-critical key/value preference or flag. | Use Shared Preferences; prefer `SharedPreferencesAsync` for new code. Use a cached API only for a demonstrated need with understood consistency behavior. | Adding or changing the dependency follows dependency approval. | Describe data shape/criticality, selected API, and consistency tests. |
| Data is a token, credential, secret, business-critical record, serialized collection acting as a database, relationship, query, transaction, or offline-sync dataset. | Do not store it in Shared Preferences. Select secure or structured storage by the applicable predicate. | Storage changes and migrations require approval. | Record data classification and selected boundary/store without reproducing secret values. |
| A small secret needs local storage and target platforms are compatible. | Prefer compatible secure storage such as `flutter_secure_storage`. Review platform configuration, backup, migration, and restore behavior. | Dependency and storage decision require explicit approval. | Record platforms, security/backup/migration review, approval, and tests. |
| Hive is the established structured store and a feature needs boxes, fields, adapters, queries, or migrations. | Extend Hive using project conventions. | Drift or ObjectBox may be introduced only by an explicit technology-migration request and approval. | Required storage output: name Hive as the retained primary store, scoped schema/query change, migration/versioning, approval boundary, and tests. |
| A new app needs structured persistence with relational queries, joins, transactions, controlled migrations, or reactive streams. | Select exactly one primary structured store; propose Drift. | Present platform, data-model, migration, testing, weight, lock-in, and operational comparison and obtain approval before adoption. | Record predicates, comparison, selected single source of truth, approval, and tests. |
| A new app needs object-oriented, high-volume, performance-sensitive offline persistence and platform support fits. | Select exactly one primary structured store; propose ObjectBox. | Present the same full comparison and obtain approval before adoption. | Record volume/performance evidence, platform fit, selected single source of truth, approval, and tests. |
| An app already has one coherent primary structured store. | Reuse it for new features. Keep Shared Preferences for simple preferences and secure storage for secrets; these are not competing domain databases. | Changing the primary store requires an explicit architectural reason, migration request, and approval. | Name the established store and whether it was retained. |
| A storage migration is explicitly requested and approved. | Define source and destination schemas; versioned idempotent execution; conversion validation; partial-failure behavior; backup and recovery/rollback; representative-data tests; the source of truth at every phase; temporary encapsulated coexistence only; no permanent dual writes; and removal of the old store. | Approve the technology choice and migration plan before implementation. Any destructive cutover or external action needs its own explicit authorization. | Report every migration contract item, versions, test fixtures/results, source-of-truth transitions, old-store removal, and any unexecuted recovery action. |

When a non-secret serialized collection meets the structured-data predicate
above because it acts as a database or offline dataset, is stored in Shared
Preferences, and Hive is the established structured store, the required output
states unconditionally that the collection moves from Shared Preferences to
Hive through an approved migration. Name both stores; do not leave the
correction conditional.

Features depend on owned persistence contracts rather than concrete storage
types. Package extraction is outside this reference's decision scope.

## Pressure counters

| Rationalization or pressure wording | Binding rule |
|---|---|
| “The feature is already being touched,” so adding Drift beside existing Hive is within scope. | Touching a Hive feature is not approval for a storage migration. Extend Hive; Drift or ObjectBox requires an explicit migration request, full plan, and approval. |
