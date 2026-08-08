# Unlabeled online order selection

`just online-order-selection` probes candidate first pairs 11/17, 11/29, and
17/29 on the first two queries. It chooses the pair with highest agreement,
breaking ties toward lower probe work, then runs that adaptive order under hard
retrieval budget 24.

Rows report chosen pair, prefix agreement, total unlabeled selection-probe
work, selected recall/work, best recall among the three orders in hindsight,
and regret. Probe work is separate from the retrieval budget and is therefore
not free.

Agreement is a confidence proxy, not correctness. The hindsight oracle is
reported only to evaluate the unlabeled rule; it is not available to the
selector.

The proxy has zero regret on all three fixture workloads: it chooses pair
17/29 for rotation and 11/17 for localized drift and scaling. Selection itself
costs 28 comparisons on rotation and 24 on each other workload, before
retrieval spends another 24/16/16. The labels are unnecessary, but the probe is
more expensive than the retrieval it configures.
