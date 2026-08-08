default:
    @just --list

benchmark:
    ./scripts/run-benchmark

benchmark-report:
    ./scripts/save-benchmark-report

compare-reports before after:
    ./scripts/compare-benchmark-reports {{before}} {{after}}

bloom-benchmark:
    ./scripts/run-bloom-benchmark

counting-bloom:
    ./scripts/run-counting-bloom

lru-benchmark:
    ./scripts/run-lru-benchmark

probe-distributions:
    ./scripts/run-probe-distributions

check:
    ./scripts/check

demo:
    ./scripts/run-demo

eviction-benchmark:
    ./scripts/run-eviction-benchmark

test:
    ./scripts/test

timing-benchmark:
    ./scripts/run-timing-benchmark
