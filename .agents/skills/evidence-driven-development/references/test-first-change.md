# Test-first change

Use this reference only for an explicitly approved implementation boundary.
Preserve unrelated working-tree changes and implement the minimum approved
change.

## Protect the main branch

Before any repository mutation, inspect the current Git branch. Never mutate on `main`.
When the current branch is `main`, derive a task branch from `main` and request
explicit approval to create and switch to it. Stop before editing until the
approved branch is active.

- For a bug, use `bug/<task-description>`.
- For a feature, use `feature/<task-description>`.
- Derive `<task-description>` from the user-visible task objective in concise,
  lowercase kebab-case; for example, `bug/fix-login-timeout` or
  `feature/add-profile-photo`.
- For another mutating scenario, request the branch name instead of inventing a
  convention.

Preserve preexisting changes while switching. Never stash, reset, clean, or
discard work to create the branch. If branch creation, ancestry, naming, or
ownership is ambiguous, or the derived branch name already exists, stop and
request direction instead of inventing a suffix.

Before mutation, confirm that approval names the approved batch and plan revision
and that every intended edit fits the approved implementation map. The map is
the mutation ceiling, not a starting point for adjacent work. If current
evidence requires a material change to the objective, criteria, map, sequence,
test strategy, dependencies, risks and recovery, or exclusions, stop and
return to design; increment the revision and obtain new approval before RED.

## Choose the evidence gate

For new or changed behavior:

1. Inspect the current baseline and diff; identify which existing changes are
   preexisting and which, if any, belong to the current agent and batch.
2. Write one focused test before changing production behavior.
3. Run it against the integrity-preserving baseline. For a bug, RED reproduces
   the observed defect; for a feature, RED demonstrates the missing behavior.
4. Enter GREEN only after that expected RED. Implement the minimum change,
   rerun the focused test, and refactor only within scope while it stays green.

Never delete, hide, overwrite, or seek permission to discard preexisting user
or repository work merely to manufacture RED. If this agent added production
behavior prematurely in the current batch, it may remove only its exact,
bounded diff when ownership is identifiable and all preexisting work can be
preserved. Use no destructive command, stash, or broad restoration.

If the focused test passes initially, declare neither RED nor GREEN. Reevaluate
whether the requirement already exists, the test is insufficient, or the
design is stale. Also stop when RED fails for another reason, was not executed,
ownership is ambiguous, or no integrity-preserving baseline can be established;
request an approved exception with alternative validation instead of altering
the baseline to force failure.

For an uncovered behavior-preserving refactor, write and run characterization
tests before restructuring. They must pass and lock down the behavior that the
refactor preserves. Do not call this a RED unless separate changed behavior
actually failed first. Rerun them after each material refactor.

No behavior test is required only for an observed predicate such as generated
output, documentation, configuration without logic, or a purely visual change
without testable behavior. Record the exact predicate and run its applicable
non-test validation; never claim a fabricated RED.

## Exceptions and stop conditions

Any approved exception must record:

```text
Rule: binding rule not followed
Observation: concrete evidence
Technical reason: why compliance is impossible or disproportionate
Impact: risk and affected scope
Approval: explicit approver and boundary
Alternative validation: exact command or inspection
```

Run focused tests after GREEN and after scoped refactoring. Stop if a test
fails, the work requires an unapproved file/boundary, a dependency or migration
appears, or evidence invalidates the design. Return to design and approval
instead of expanding scope.

Before completion, inspect the scoped diff for accidental files, debug output,
secrets, dependency/version changes, and unrelated cleanup. Enter verification
only after implementation and scoped refactoring are complete.
