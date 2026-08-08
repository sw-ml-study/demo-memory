default:
    @just --list

benchmark:
    ./scripts/run-benchmark

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
