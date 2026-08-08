# Upstream contract

This file records the difference between an algorithm being expressible and
its systems claim being measurable. It is the handoff surface from
`demo-memory` to `sw-mlpl`.

## Available now

- Dense numeric arrays model slots and parallel metadata.
- Records model immutable table values.
- `scatter` models an indexed update.
- User functions, recursion, conditionals, and seeded `random`/`randn` make
  deterministic algorithms and workloads executable.
- Demo-owned counters measure probes, collisions, and displacement without
  pretending that evaluator overhead is table throughput.

## Requests earned by the first demo

1. **Monotonic high-resolution clock.** A builtin suitable for elapsed-time
   measurement, documented with resolution and units. Until then the suite
   reports operation counts, not inserts/sec or latency percentiles.
2. **Fixed-width unsigned integers and bit operations.** At minimum `u8`,
   `u16`, `u32`, shifts, masks, popcount, and explicit conversions. This is
   needed to implement Swiss control bytes, Bloom filters, and binary-code
   indexes without representing bits as f64 values.
3. **Packed layout with observable size.** A way to request packed buffers or
   records and query their storage footprint/alignment. Logical arrays can
   teach tiny-pointer navigation, but cannot test its bytes/key claim.
4. **Seeded RNG value.** Current seeded array generation is reproducible, but
   an explicit splittable/passable RNG would make randomized insertion,
   shuffle, and adaptive hashing composable rather than seed bookkeeping.

## Planned forcing sequence

| Demo | Runs with current surface | Upstream pressure |
|---|---|---|
| Linear vs Robin Hood probing | Yes | clock for throughput |
| Bloom/counting filters | Logical Bloom filter runs; packed form blocked | unsigned bits, popcount, packed storage |
| Tiny-pointer navigation | Logical approximation | packed widths/layout/size |
| LRU and KV eviction | Yes | clock only for performance claims |
| Binary-code sparse retrieval | Numeric approximation | bits, popcount, top-k/index APIs |
| KV-cache acceleration | Not yet end-to-end here | stable generation-state API and backend telemetry |

An upstream request graduates from this document only when a small demo or
test can state the observable behavior it needs. Pointer arithmetic is not a
request: bounded indices, offsets, and handles preserve the language's safer
model and are enough for these structures.
