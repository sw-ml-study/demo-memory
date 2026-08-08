# Native wall-clock benchmarks

`just timing-benchmark` uses `clock_ms()` after warmup and times repeated
batches, not individual tiny operations. It reports elapsed milliseconds and
operations per second for builds and lookups, plus calibrated clock-call cost.
It also runs three independent trials and reports min, median, mean, and max
throughput, making run-to-run variability visible.

Before numeric rows, the runner emits schema-v1 `meta` lines containing the
UTC timestamp, sw-MLPL version and commit, executable and inferred build
profile, platform and architecture, workload/timing schema versions, and trial
count. Saved output therefore retains the context required for comparison.

`just benchmark-report` saves a complete run under ignored `out/`. Compare two
runs with `just compare-reports out/BEFORE.txt out/AFTER.txt`; the comparator
reports percentage changes in median insert and lookup throughput for each
matching implementation/workload pair.

These numbers include immutable MLPL evaluator and allocation overhead; they
compare executable implementations rather than production hash-table kernels.
They vary by machine and build profile, unlike deterministic probe metrics.
`clock_ms()` is native-only, so this demo targets CLI/connect mode and is not a
pure-browser capability.
