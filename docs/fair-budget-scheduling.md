# Fair scheduling under hard budgets

`just fair-budget-scheduling` compares three ways to spend the same hard total
on four rotation queries:

- schedule 1 greedily lets early queries consume the shared remainder;
- schedule 2 gives every query `floor(total / queries)` comparisons; and
- schedule 3 distributes leftover tokens round-robin after the equal quota.

Single-index mode receives 8 total comparisons; ensemble mode receives 24.
Rows report recall, actual comparisons, exhausted queries, completed projection
scans, and unanimous ensemble answers.

These totals divide evenly by four, so equal and round-robin allocations are
intentionally identical. An uneven-budget unit test demonstrates that
round-robin spends remainder tokens (`10 -> [3,3,2,2]`) while equal floor
quotas leave them unused. Fairness prevents one query from consuming every
token but may spread an insufficient budget too thinly.

On rotation, fair allocation raises single-index recall from `0.25` to `0.5`
under the same 8 comparisons. Ensemble recall remains `0.5`; fair schedules
reduce completed projection scans from 8 to 6 and unanimous answers from 2 to
0. Balancing queries helps the single index but fragments the three-member
budget too aggressively.
