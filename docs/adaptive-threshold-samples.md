# Adaptive thresholds and sample size

`just adaptive-threshold-samples` makes two policy choices visible: how much
recall evidence to collect and what threshold triggers a projection rebuild.

The deterministic four-query monitoring set begins with one query still
aligned with the old distribution, followed by three shifted queries. Four policies demonstrate
the failure modes and useful middle ground:

- a one-query sample at threshold `0.75` misses the shift;
- a mixed two-query sample at `0.75` detects it and rebuilds;
- threshold `0` disables rebuilding even with the full sample; and
- threshold `1.01` rebuilds despite a perfect one-query sample.

Each row reports sample recall, the decision, full-set recall and indexed
recall after the decision, and rebuild cells/power steps. The intentionally
small fixture teaches sampling bias; it does not estimate production sample
complexity or statistical confidence.
