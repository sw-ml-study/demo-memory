# Adaptive projection rebuilds

`just adaptive-rebuild` turns the fixed-cadence comparison into a measurable
policy: evaluate a deterministic recall sample and rebuild only when recall is
below `0.75`.

For each shift level, the report separates:

- `observed_recall`, measured before the decision;
- `post_recall` and `post_indexed`, measured after any rebuild;
- the Boolean `rebuilt` decision; and
- cumulative cells reread and power-iteration steps.

On the shared shift fixture, the first batch remains healthy, the second
crosses the threshold and triggers one rebuild, and the rebuilt model remains
useful through the final batch. This matches the quality of the successful
periodic policy without assuming its cadence in advance.

The sample is an oracle-backed teaching mechanism: dense dot-product retrieval
provides truth here. A production system would need representative labeled
queries or another quality signal. No byte-level or cache-locality claim is
made while packed layouts remain upstream-queued.
