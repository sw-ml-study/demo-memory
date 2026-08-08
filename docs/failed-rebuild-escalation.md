# Escalating after a failed rebuild

`just failed-rebuild-escalation` starts from the localized-drift case where a
fresh covariance/sign-code index fails validation. It compares:

- four covariance bits at multi-probe radius 1 and 2;
- eight deterministic random sign bits at radius 1 and 2; and
- validation-gated dense fallback after the widest/radius-2 attempt.

Every row reports exhaustive Hamming recall, indexed recall, candidate work,
fallback work, total selection work, and final selected recall. Dense work is
the explicit `memory rows * queries` comparison count.

Four covariance bits collapse this fixture, and larger radius only adds work.
Eight seeded random sign bits capture the vectors' small off-axis differences
and restore full recall at radius 1. Exact collinear magnitudes would remain
indistinguishable to origin-centered sign bits, but these keys are not exact
collinear duplicates. Dense fallback is also reported after the failed
four-bit validation as a correctness escape hatch, not a claim that the index
has been fixed.
