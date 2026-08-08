# Monitoring across shift shapes

`just shift-shape-generalization` applies the calibrated reservoir-size-1,
threshold-`0.75` policy to three qualitatively different changes over five
deterministic seeds:

- shape 1 rotates arriving memory toward previously unseen axes;
- shape 2 scales query magnitudes without changing their directions; and
- shape 3 moves only the x-axis memory cluster into unseen axes.

Each row first reports stale full-query recall and whether that quality is
below threshold. Detection rate and censored delay then show whether monitoring
agrees; mean monitored queries states the cost. This distinction matters:
failure to trigger is correct for harmless scaling but a miss when stale recall
has degraded.

The cases test directional, magnitude-only, and localized drift. They are
small deterministic counterexamples, not a taxonomy of production drift.

In this fixture the policy detects rotational drift after two shifted queries,
correctly ignores magnitude-only scaling, and detects localized drift only
after four. Localized failures are therefore the harder monitoring case even
though their stale full-query recall has already fallen to `0.5`.
