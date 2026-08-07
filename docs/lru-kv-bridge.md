# LRU to KV memory bridge

The LRU demo models bounded key/value memory as parallel arrays. Numeric slot
handles replace pointers, and a logical clock records recency. Every access
either promotes an existing entry or demand-loads a missing entry, evicting
the least-recently-used key when full.

This is deliberately both a classical cache and a vocabulary bridge toward ML
memory: capacity, hits, misses, promotion, eviction, and access distribution
also govern model-serving caches. It does not yet claim to be a transformer KV
cache or to measure backend memory traffic.

## Access patterns

- `0` uniform reuse: a working set exactly fits capacity;
- `1` hot set: two frequent keys with occasional cold keys;
- `2` scan: a one-pass working set larger than capacity;
- `3` bursty: repeated local bursts separated by new keys.

## Result schema

Each schema-v1 row has ten numeric columns:

| Index | Name |
|---:|---|
| 0 | schema version |
| 1 | workload ID |
| 2 | access-pattern ID |
| 3 | capacity |
| 4 | accesses |
| 5 | hits |
| 6 | misses |
| 7 | promotions |
| 8 | evictions |
| 9 | final size |

Run the comparison with `make lru-benchmark`. These are deterministic event
counts. Elapsed time and physical memory measurements remain upstream-gated.
