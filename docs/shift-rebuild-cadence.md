# Shift severity and rebuild cadence

`just shift-rebuild-cadence` evaluates three equal-sized deterministic arrival
batches that rotate progressively away from the distribution used to fit the
original covariance projection. Holding batch size constant isolates shift
severity from memory growth.

It compares three maintenance policies at every batch:

- `never` keeps the original projection;
- `cadence2` rebuilds after every second arrival batch; and
- `every` rebuilds after every batch.

Recall columns measure exhaustive Hamming codes against dense dot-product
truth. Indexed columns apply the same multi-probe shortlist used by the other
retrieval demos. Cumulative `*_cells` columns count memory elements reread by
each policy's rebuilds.

The sweep deliberately reports the tradeoff rather than declaring a universal
threshold. A production policy would choose a minimum acceptable recall and
rebuild when observed quality crosses it. Timing and allocation costs remain
separate upstream/runtime questions.

In the fixture, rebuilding every batch is not automatically best: the first
small mixed distribution produces unstable covariance directions, while the
second-batch model remains useful through the final shift. This is a reason to
gate rebuilds on measured retrieval quality rather than arrival count alone.
