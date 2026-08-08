# demo-memory

Runnable sw-MLPL experiments about one question: **how does a system find the
small part of memory that matters?** The sequence begins with hash-table probes
and is intended to lead through caches and filters to retrieval and sparse
attention.

This repository is deliberately a downstream forcing function for
[sw-mlpl](https://github.com/sw-ml-study/sw-mlpl). A demo must distinguish:

- measurements the language can make honestly today;
- a runnable approximation that teaches the algorithm but not its physical
  layout; and
- a blocked experiment with a precise upstream capability request.

## What runs now

### Hash tables and probe behavior

The first vertical slice compares ordinary linear probing with Robin Hood
insertion on the same collision-heavy workload. It reports load factor, total
insertion probes, worst displacement, successful lookup probes, and the full
displacement vectors. These are deterministic algorithmic measurements, not
wall-clock benchmark claims.

Run the narrated [probe-tradeoffs demo](demos/hash/probe_tradeoffs.mlpl), or
read the reusable [open-addressing implementation](src/hash/open_addressing.mlpl)
and its [executable invariants](tests/hash/open_addressing.mlpl).

The [probe-distribution report](docs/probe-distributions.md) exposes the lookup
tails hidden by aggregate totals through histograms and p50/p95 summaries.

### Bounded memory and eviction

The [LRU/KV bridge](docs/lru-kv-bridge.md) adds bounded key/value memory and
compares uniform-reuse, hot-set, scan, and bursty access patterns.
[FIFO-versus-LRU comparison](docs/eviction-policies.md) makes eviction policy
an explicit parameter on those same traces.

### Bloom filters

[The logical Bloom filter](docs/bloom-filter.md) measures false positives
against an exact-set oracle while keeping packed-memory claims upstream-gated.
[Counting Bloom deletion](docs/counting-bloom-filter.md) adds duplicate-aware
counters, removal, and explicit underflow protection.
[Packed-word Bloom](docs/packed-bloom-filter.md) uses the delivered bit
operations and proves equivalence with the logical representation.

### Binary retrieval and sparse aggregation

[Binary-code retrieval](docs/binary-retrieval.md) uses Hamming shortlists as
the bridge from classical indexing toward sparse ML retrieval.
[Prefix-width tradeoffs](docs/prefix-width-tradeoff.md) sweep index selectivity
against recall, comparisons, and fallback rate.
[Multi-probe retrieval](docs/multiprobe-retrieval.md) searches nearby prefix
buckets to recover recall for controlled extra work.
[Sparse aggregation](docs/sparse-aggregation.md) attaches values and measures
output error after Hamming-indexed candidate selection.

### Learned projections

[Projected binary codes](docs/projected-binary-codes.md) derive indexes from
continuous vectors and separate projection recall from shortlist recall.
[Projection sweeps](docs/projection-sweep.md) measure width trends and seed
variance instead of relying on one projection.
[Data-derived projection](docs/data-derived-projection.md) extracts covariance
directions from memory itself as a small BinaryPC-like bridge.
[Distribution shift and reindexing](docs/distribution-shift.md) shows recall
loss when that learned index becomes stale and the recovery after rebuilding.
[Shift severity and rebuild cadence](docs/shift-rebuild-cadence.md) compares
never, periodic, and every-batch rebuild policies as the memory drifts.
[Adaptive projection rebuilds](docs/adaptive-rebuild.md) trigger from sampled
recall instead of assuming a fixed maintenance interval.
[Adaptive thresholds and sample size](docs/adaptive-threshold-samples.md)
exposes missed degradation and unnecessary rebuilds from policy choices.
[Reservoir monitoring](docs/reservoir-shift-detection.md) replaces hand-picked
samples and measures shift-detection delay against monitoring work.
[Reservoir seed trials](docs/reservoir-seed-trials.md) report detection rate
and delay percentiles without relying on one replacement sequence.
[Monitoring-policy calibration](docs/monitoring-policy-calibration.md) crosses
sample size and threshold against both shifted and healthy control streams.
[Shift-shape generalization](docs/shift-shape-generalization.md) checks the
calibrated policy on rotational, magnitude-only, and localized drift.
[Stratified localized monitoring](docs/stratified-local-drift.md) compares a
global reservoir with explicit per-cluster samples.
[Recency monitoring](docs/recency-local-drift.md) tests whether forgetting
stale samples detects localized drift sooner.
[Proactive feature-drift alarms](docs/feature-drift-alarm.md) compare
covariance-subspace residuals with failure-based recall monitoring.
[Feature-alarm actions](docs/feature-alarm-actions.md) expose the cost of
immediate rebuilding versus recall confirmation.
[Failed-rebuild escalation](docs/failed-rebuild-escalation.md) tests wider
codes, broader probing, and dense correctness fallback.
[Wider-code seed trials](docs/wider-code-seed-trials.md) measure whether
random-projection recovery survives width and seed variation.
[Projection ensembles](docs/projection-ensemble-fallback.md) use unanimous
indexed answers and dense fallback on seed disagreement.
[Retrieval budget selection](docs/retrieval-budget-selector.md) chooses among
single-index, ensemble, and dense modes from validated quality and work.
[Budget-selector transfer](docs/budget-selector-transfer.md) freezes those
choices and measures quality/work drift on other workloads.
[Hard runtime budgets](docs/hard-runtime-budgets.md) stop candidate scanning
inside the comparison cap instead of trusting validation-time estimates.
[Fair budget scheduling](docs/fair-budget-scheduling.md) compares greedy,
equal-quota, and round-robin token allocation across queries.
[Adaptive ensemble scheduling](docs/adaptive-ensemble-scheduling.md) stops
after two agreeing projections and carries saved work forward.

### Honest native measurements

[Native timing](docs/native-timing.md) adds warmed, batched throughput using
the monotonic `clock_ms()` runtime capability and emits reproducibility
metadata before every run.

## Run the demos

Install [`just`](https://just.systems/), then use the repository recipes:

```sh
# Guided starting point
just demo

# Hash tables
just benchmark
just probe-distributions
just timing-benchmark
just benchmark-report
# just compare-reports out/BEFORE.txt out/AFTER.txt

# Bloom filters
just bloom-benchmark
just counting-bloom
just packed-bloom

# Binary and sparse retrieval
just binary-retrieval
just prefix-widths
just multiprobe
just sparse-aggregation

# Projection-based retrieval
just projected-codes
just projection-sweep
just data-derived-projection
just distribution-shift
just shift-rebuild-cadence
just adaptive-rebuild
just adaptive-threshold-samples
just reservoir-shift-detection
just reservoir-seed-trials
just monitoring-policy-calibration
just shift-shape-generalization
just stratified-local-drift
just recency-local-drift
just feature-drift-alarm
just feature-alarm-actions
just failed-rebuild-escalation
just wider-code-seed-trials
just projection-ensemble-fallback
just retrieval-budget-selector
just budget-selector-transfer
just hard-runtime-budgets
just fair-budget-scheduling
just adaptive-ensemble-scheduling

# Bounded-memory policies and timing
just memory-timing
just memory-report
just lru-benchmark
just eviction-benchmark

# Verification
just test
just check       # required before each feature/fix commit
```

By default the scripts use `../sw-mlpl/target/debug/mlpl-repl`. Override that
with `MLPL=/absolute/path/to/mlpl-repl`.

## Repository map

```text
src/hash/open_addressing.mlpl       reusable measured implementations
demos/hash/probe_tradeoffs.mlpl    narrated, runnable comparison
tests/hash/open_addressing.mlpl     invariants and expected metrics
scripts/run-demo                    stable command-line entry point
scripts/run-benchmark               deterministic workload matrix
scripts/run-bloom-benchmark         logical Bloom false-positive matrix
scripts/run-lru-benchmark           LRU/KV access-pattern matrix
scripts/run-eviction-benchmark      FIFO versus LRU policy matrix
scripts/run-probe-distributions     lookup histogram and tail summaries
scripts/test                        smoke/unit gate
scripts/check                       repository pre-commit gate
docs/benchmark-schema.md            stable numeric result contract
docs/upstream-contract.md           feature pressure on sw-mlpl
```

## Scope

The planned progression is `hash/`, `cache/`, `bloom/`, `lru/`, `kv/`,
`retrieval/`, and `attention/`. The next implementation should be chosen by
which boundary it makes executable, not by filling directories prematurely.
See [the upstream contract](docs/upstream-contract.md).

## License

Copyright (c) 2026 Michael A Wright. Distributed under the [MIT License](LICENSE).
