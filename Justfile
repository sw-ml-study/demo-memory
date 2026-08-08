default:
    @just --list

benchmark:
    ./scripts/run-benchmark

adaptive-rebuild:
    ./scripts/run-adaptive-rebuild

adaptive-threshold-samples:
    ./scripts/run-adaptive-threshold-samples

adaptive-ensemble-scheduling:
    ./scripts/run-adaptive-ensemble-scheduling

benchmark-report:
    ./scripts/save-benchmark-report

retrieval-budget-selector:
    ./scripts/run-retrieval-budget-selector

budget-selector-transfer:
    ./scripts/run-budget-selector-transfer

binary-retrieval:
    ./scripts/run-binary-retrieval

compare-reports before after:
    ./scripts/compare-benchmark-reports {{before}} {{after}}

memory-timing:
    ./scripts/run-memory-timing

multiprobe:
    ./scripts/run-multiprobe

monitoring-policy-calibration:
    ./scripts/run-monitoring-policy-calibration

memory-report:
    ./scripts/save-memory-report

compare-memory-reports before after:
    ./scripts/compare-memory-reports {{before}} {{after}}

bloom-benchmark:
    ./scripts/run-bloom-benchmark

counting-bloom:
    ./scripts/run-counting-bloom

packed-bloom:
    ./scripts/run-packed-bloom

lru-benchmark:
    ./scripts/run-lru-benchmark

probe-distributions:
    ./scripts/run-probe-distributions

prefix-widths:
    ./scripts/run-prefix-widths

projected-codes:
    ./scripts/run-projected-codes

projection-ensemble-fallback:
    ./scripts/run-projection-ensemble-fallback

projection-sweep:
    ./scripts/run-projection-sweep

reservoir-shift-detection:
    ./scripts/run-reservoir-shift-detection

reservoir-seed-trials:
    ./scripts/run-reservoir-seed-trials

recency-local-drift:
    ./scripts/run-recency-local-drift

feature-drift-alarm:
    ./scripts/run-feature-drift-alarm

feature-alarm-actions:
    ./scripts/run-feature-alarm-actions

failed-rebuild-escalation:
    ./scripts/run-failed-rebuild-escalation

wider-code-seed-trials:
    ./scripts/run-wider-code-seed-trials

check:
    ./scripts/check

demo:
    ./scripts/run-demo

data-derived-projection:
    ./scripts/run-data-derived-projection

distribution-shift:
    ./scripts/run-distribution-shift

shift-rebuild-cadence:
    ./scripts/run-shift-rebuild-cadence

shift-shape-generalization:
    ./scripts/run-shift-shape-generalization

eviction-benchmark:
    ./scripts/run-eviction-benchmark

test:
    ./scripts/test

sparse-aggregation:
    ./scripts/run-sparse-aggregation

stratified-local-drift:
    ./scripts/run-stratified-local-drift

timing-benchmark:
    ./scripts/run-timing-benchmark

hard-runtime-budgets:
    ./scripts/run-hard-runtime-budgets

fair-budget-scheduling:
    ./scripts/run-fair-budget-scheduling
