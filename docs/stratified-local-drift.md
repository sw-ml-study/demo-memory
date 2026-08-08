# Stratified monitoring for localized drift

`just stratified-local-drift` compares two policies on the localized-cluster
fixture over five deterministic seeds:

- policy 1 keeps one global reservoir over the combined query stream; and
- policy 2 keeps one reservoir query from each explicit x/y cluster stratum.

Both use threshold `0.75`. The report includes detection rate, censored p50/p95
delay, mean queries evaluated by the time of detection, and false-trigger rate
on an all-healthy x/y control stream.

Stratification uses supplied cluster labels; discovering or maintaining those
labels is outside this experiment. Its extra sample is worthwhile only if it
reduces localized detection delay without introducing healthy false triggers.

It does not pay off in this fixture. Both policies detect every seed after four
shifted queries with no healthy false triggers, while the stratified policy
raises mean monitoring work from 3 to 4 queries. The result is deliberately
retained as a negative benchmark: cluster labels alone do not overcome stale
samples within the affected stratum.
