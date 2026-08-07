.PHONY: benchmark check demo lru-benchmark test

benchmark:
	./scripts/run-benchmark

lru-benchmark:
	./scripts/run-lru-benchmark

check:
	./scripts/check

demo:
	./scripts/run-demo

test:
	./scripts/test
