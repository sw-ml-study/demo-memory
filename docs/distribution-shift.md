# Distribution shift and reindexing

A data-derived binary index describes the memory used to build it. New keys can
arrive from directions that its covariance projection never learned, causing
distinct memories to collapse onto the same code.

`just distribution-shift` makes that maintenance boundary visible. It fits an
initial projection, evaluates it before and after an orthogonal distribution
arrives, then rebuilds the projection and index over all memory.

The report separates retrieval quality from rebuild work:

- `before_recall`, `stale_recall`, and `rebuilt_recall` compare exhaustive
  Hamming retrieval with dense dot-product truth;
- `stale_indexed` and `rebuilt_indexed` report multi-probe shortlist recall;
- `rebuild_rows` and `rebuild_cells` state how much memory is reread; and
- `power_steps` reports the visible power-iteration budget (`20 * bits`).

These are deterministic algorithmic counts. They do not claim elapsed rebuild
time or byte-level storage cost.
