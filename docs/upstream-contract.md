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
- Native `clock_ms()` supports honest elapsed-time and throughput reports.
- Fixed-width bit operations support faithful packed-word algorithms, Hamming
  distance, and binary retrieval indexes.

## Requests earned by the first demo

1. **Monotonic high-resolution clock -- delivered.** `clock_ms()` now supports
   native CLI/connect elapsed-time and throughput measurements. Pure-browser
   timing remains outside that native capability boundary.
2. **Fixed-width integer views and bit operations -- delivered.** At
   `797037e1`, sw-MLPL provides masking, shifts, Boolean bit operations,
   popcount, and LSB-first bit-vector conversion over exact integer-valued f64
   arrays. Packed storage size remains a separate request.
3. **Packed layout with observable size.** A way to request packed buffers or
   records and query their storage footprint/alignment. Logical arrays can
   teach tiny-pointer navigation, but cannot test its bytes/key claim.
4. **Seeded RNG value.** Current seeded array generation is reproducible, but
   an explicit splittable/passable RNG would make randomized insertion,
   shuffle, and adaptive hashing composable rather than seed bookkeeping.

## Planned forcing sequence

| Demo | Runs with current surface | Upstream pressure |
|---|---|---|
| Linear vs Robin Hood probing | Yes, including native timing | none for current claims |
| Bloom/counting filters | Logical, counting, and packed-word forms run | packed storage for credible bytes/key claims |
| Tiny-pointer navigation | Logical approximation | packed widths/layout/size |
| LRU and KV eviction | Yes, including native timing | packed layouts for locality/size claims |
| Binary-code sparse retrieval | Yes, with faithful bit operations | runtime index APIs only for scaling beyond demo-owned indexes |
| KV-cache acceleration | Not yet end-to-end here | stable generation-state API and backend telemetry |

An upstream request graduates from this document only when a small demo or
test can state the observable behavior it needs. Pointer arithmetic is not a
request: bounded indices, offsets, and handles preserve the language's safer
model and are enough for these structures.
