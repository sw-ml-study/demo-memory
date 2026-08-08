# Recency monitoring for localized drift

`just recency-local-drift` compares the calibrated global reservoir with
one-query and two-query recency windows on the localized-drift stream. All
policies check after two and four shifted queries at threshold `0.75`.

The report retains detection rate, censored p50/p95 delay, mean monitoring
work, and false-trigger rate on an all-healthy control. Recency is deterministic,
so its result is repeated over the same five-trial count only to keep schemas
comparable; it has no seed variance.

A recency window forgets stale evidence quickly but is more exposed to a
transient bad query. This fixture tests detection speed, not robustness to
isolated noise or alternating regimes.

Neither recency window improves this fixture. The one-query window matches the
global reservoir's delay 4 and work 3; the two-query window keeps delay 4 while
doubling work to 6. The first two localized queries are still retrieved
correctly, so there is no quality failure for any oracle-backed monitor to
observe. The delay comes from evidence arrival, not stale reservoir contents.
