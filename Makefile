.PHONY: benchmark check demo lru-benchmark probe-distributions test

benchmark:
	./scripts/run-benchmark

lru-benchmark:
	./scripts/run-lru-benchmark

probe-distributions:
	./scripts/run-probe-distributions

check:
	./scripts/check

demo:
	./scripts/run-demo

test:
	./scripts/test
