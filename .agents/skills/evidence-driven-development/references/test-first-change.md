# Test-first change

Use this reference only for an explicitly approved implementation boundary.
Preserve unrelated working-tree changes and implement the minimum approved
change.

## Choose the evidence gate

For new or changed behavior:

1. Remove the entire untested behavior implementation from every repository
   and deployable path before RED. Do not retain, stash, comment, copy, or use
   it as an implementation reference.
2. Write one focused test for the desired behavior.
3. Run it and observe failure for the expected missing-behavior reason.
4. Implement the minimum GREEN change and rerun the focused test.
5. Refactor only within scope while the test remains green.

Do not enter GREEN if RED passes unexpectedly, fails for another reason, or
was not executed.

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
