# FIFO versus LRU eviction

This benchmark makes eviction policy an explicit parameter while holding
capacity and access traces constant.

- FIFO evicts the earliest-loaded key; hits never change its order.
- LRU evicts the least-recently-accessed key; hits promote reused keys.

Schema-v1 rows contain: schema, policy, workload, pattern, capacity, accesses,
hits, misses, promotions, evictions, and final size. Policy `0` is LRU and
policy `1` is FIFO. Workload and pattern IDs match the
[LRU/KV bridge](lru-kv-bridge.md).

Run `just eviction-benchmark`. The comparison demonstrates when extra recency
metadata buys something: fitting working sets and scans behave alike, while a
hot set benefits from promotion.
