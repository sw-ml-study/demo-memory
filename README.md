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

The first vertical slice compares ordinary linear probing with Robin Hood
insertion on the same collision-heavy workload. It reports load factor, total
insertion probes, worst displacement, successful lookup probes, and the full
displacement vectors. These are deterministic algorithmic measurements, not
wall-clock benchmark claims.

Run the narrated [probe-tradeoffs demo](demos/hash/probe_tradeoffs.mlpl), or
read the reusable [open-addressing implementation](src/hash/open_addressing.mlpl)
and its [executable invariants](tests/hash/open_addressing.mlpl).

The [LRU/KV bridge](docs/lru-kv-bridge.md) adds bounded key/value memory and
compares uniform-reuse, hot-set, scan, and bursty access patterns.
[FIFO-versus-LRU comparison](docs/eviction-policies.md) makes eviction policy
an explicit parameter on those same traces.
[The logical Bloom filter](docs/bloom-filter.md) measures false positives
against an exact-set oracle while keeping packed-memory claims upstream-gated.
[Counting Bloom deletion](docs/counting-bloom-filter.md) adds duplicate-aware
counters, removal, and explicit underflow protection.
[Packed-word Bloom](docs/packed-bloom-filter.md) uses the delivered bit
operations and proves equivalence with the logical representation.
[Native timing](docs/native-timing.md) adds warmed, batched throughput using
the monotonic `clock_ms()` runtime capability and emits reproducibility
metadata before every run.
[Probe-distribution reporting](docs/probe-distributions.md) exposes the lookup
tails hidden by aggregate totals through histograms and p50/p95 summaries.

Install [`just`](https://just.systems/), then use the repository recipes:

```sh
just demo
just benchmark
just bloom-benchmark
just counting-bloom
just packed-bloom
just timing-benchmark
just benchmark-report
# just compare-reports out/BEFORE.txt out/AFTER.txt
just memory-timing
just memory-report
just lru-benchmark
just eviction-benchmark
just probe-distributions
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
