# Native wall-clock benchmarks

`just timing-benchmark` uses `clock_ms()` after warmup and times repeated
batches, not individual tiny operations. It reports elapsed milliseconds and
operations per second for builds and lookups, plus calibrated clock-call cost.

These numbers include immutable MLPL evaluator and allocation overhead; they
compare executable implementations rather than production hash-table kernels.
They vary by machine and build profile, unlike deterministic probe metrics.
`clock_ms()` is native-only, so this demo targets CLI/connect mode and is not a
pure-browser capability.
