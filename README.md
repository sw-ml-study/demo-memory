# demo-memory

Runnable sw-MLPL experiments about one question: **how does a system find the
small part of memory that matters?** The sequence begins with hash-table probes
and is intended to lead through caches and filters to retrieval and sparse
attention.

This repository is deliberately a downstream forcing function for
[`sw-mlpl`](../sw-mlpl). A demo must distinguish:

- measurements the language can make honestly today;
- a runnable approximation that teaches the algorithm but not its physical
  layout; and
- a blocked experiment with a precise upstream capability request.

## What runs now

The first vertical slice compares ordinary linear probing with Robin Hood
insertion on the same collision-heavy workload. It reports load factor, total
insertion probes, worst displacement, successful lookup probes, and the full
displacement vectors. These are deterministic algorithmic measurements—not
wall-clock benchmark claims.

```sh
make demo
make test
make check       # required before each feature/fix commit
```

By default the scripts use `../sw-mlpl/target/debug/mlpl-repl`. Override that
with `MLPL=/absolute/path/to/mlpl-repl`.

## Repository map

```text
src/hash/open_addressing.mlpl       reusable measured implementations
demos/hash/probe_tradeoffs.mlpl    narrated, runnable comparison
tests/hash/open_addressing.mlpl     invariants and expected metrics
scripts/run-demo                    stable command-line entry point
scripts/test                        smoke/unit gate
scripts/check                       repository pre-commit gate
docs/upstream-contract.md           feature pressure on sw-mlpl
```

## Scope

The planned progression is `hash/`, `cache/`, `bloom/`, `lru/`, `kv/`,
`retrieval/`, and `attention/`. The next implementation should be chosen by
which boundary it makes executable, not by filling directories prematurely.
See [the upstream contract](docs/upstream-contract.md).
