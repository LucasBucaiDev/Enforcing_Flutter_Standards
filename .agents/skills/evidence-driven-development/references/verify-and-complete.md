# Verify and complete

Use this reference when approved implementation is complete and ready for
fresh diff review, repository gates, changelog, and closure. Do not redesign or
extend the change.

## Review the complete diff

Inspect status and the full scoped diff. Account for every changed file and
separate preexisting user work. Confirm the approved behavior, generated
outputs, lifecycle changes, and public boundaries are present. Reject unrelated
cleanup, debug output, secrets, accidental dependencies or version changes,
and unexplained files before running completion gates.

## Run fresh gates

Discover and execute applicable repository-defined formatting, lint/static
analysis/typecheck, code generation, affected tests, full suite, coverage,
generated-file consistency, and build commands. Run applicable gates in each
modified local package and every affected direct dependent; a root suite is
not a substitute.

For every gate record:

```text
Gate: name
Command: exact command
Scope: root, package, target, or dependent
Result: exit status and observed output/count/threshold
Skipped reason: concrete reason, when not run
```

Never infer full success from a partial command or stale result. Later
implementation changes invalidate verification and require a new diff review
and fresh affected gates.

## Changelog and closure

After fresh verification and no later implementation change, add one concise
observable entry to the existing canonical changelog using its language,
format, and category. Use a package changelog only when that package is
independently released or repository convention requires it. Do not create a
missing changelog or bump a version without explicit approval.

Review the final status and diff, then classify the outcome as complete,
partial, or blocked. Completion requires all applicable gates to pass, every
skipped validation to have a reason, changelog disposition to be resolved, and
unfinished approved work to be separated from future debt.

Stop when the diff is unexplained, a required gate fails, a direct dependent
is omitted, evidence is stale, or a changelog/version decision is unresolved.
Report the exact gate and do not overstate success.
