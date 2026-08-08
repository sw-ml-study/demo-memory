# Projection ensembles with disagreement fallback

`just projection-ensemble-fallback` combines three 8-bit random-sign indexes.
For each query it accepts an indexed result only when all three projections
return the same memory row; any disagreement invokes exact dense retrieval.

Three overlapping seed triplets report agreement coverage, correctness among
agreed queries, fallback count, final recall, summed index comparisons, dense
fallback comparisons, and total selection work.

Unanimity is deliberately conservative. It can catch seed-sensitive answers
without a labeled validation query, but running three indexes has a fixed cost
and unanimous mistakes remain possible. Dense fallback guarantees correctness
only on disagreement; `agreed_recall` exposes the remaining risk.

All three fixture triplets reach full recall and every unanimous answer is
correct. Two agree on all queries for 24 comparisons. The third falls back on
two queries and costs 40 comparisons—more than the 32-comparison dense
baseline. The ensemble improves reliability, but its worst observed work is
dominated by going dense immediately.
