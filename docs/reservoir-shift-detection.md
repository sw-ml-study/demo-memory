# Reservoir monitoring and detection delay

`just reservoir-shift-detection` replaces hand-picked monitoring queries with
deterministic reservoir samples over a stream containing four healthy queries
followed by four shifted queries.

Reservoir sizes 1, 2, and 4 are evaluated after zero, two, and four shifted
queries have arrived. Each row reports sampled recall, whether the `0.75`
threshold triggers, full-prefix recall after the decision, cumulative queries
monitored, and rebuild cells. The first triggered row for a reservoir size is
its detection delay in `shifted_seen`.

With this seed, reservoirs 1 and 2 detect after two shifted queries. The
four-query reservoir measures exactly `0.75`; because the policy rebuilds only
when recall is *below* the threshold, it does not fire. The boundary case makes
threshold inclusivity an explicit policy choice rather than an accident.

The reservoir algorithm is visible MLPL: each incoming position draws one
seeded replacement decision and retains a sample without replacement. Because
MLPL does not yet expose a passable RNG stream, the demo derives a seed from
the base seed and stream position. That bookkeeping is deterministic and
adequate for this experiment; an RNG value would improve composition, not
unblock the retrieval result.
