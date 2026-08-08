# Selecting retrieval under a comparison budget

`just retrieval-budget-selector` measures three modes on the localized-drift
validation fixture:

- mode 1: one seed-sensitive 8-bit index;
- mode 2: a unanimous three-index ensemble with disagreement fallback; and
- mode 3: exact dense retrieval.

For budgets 8, 16, 24, and 32, the selector chooses the feasible mode with the
highest measured validation recall, breaking quality ties toward lower work.
Rows report feasibility, selected mode, validated recall, and comparisons.

This is offline validation-informed selection, not a per-query oracle. Its
decision generalizes only as far as the validation workload does. The point is
to make resource policy explicit: a tight budget may knowingly accept lower
quality, while a larger budget should not choose a dominated expensive mode.
