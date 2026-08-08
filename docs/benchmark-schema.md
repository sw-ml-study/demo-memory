# Benchmark result schema

The benchmark library returns a rank-2 numeric matrix: one row per
implementation and workload, with 15 columns. The CLI prints each vector on a
line prefixed by `row`. Numeric IDs and a fixed column order make these lines
consumable without pretending that current MLPL record rendering is a standard
serialization format. A future serializer may wrap the same versioned rows in
TSV or JSON without changing their meaning.

## Version 1 columns

| Index | Name | Meaning |
|---:|---|---|
| 0 | schema | Schema version, currently `1` |
| 1 | implementation | `0` linear probing, `1` Robin Hood |
| 2 | workload | Stable workload ID |
| 3 | distribution | `0` uniform, `1` clustered, `2` interleaved |
| 4 | order | `0` original, `1` deterministically rotated |
| 5 | capacity | Logical slot count |
| 6 | size | Inserted key count |
| 7 | load | `size / capacity` |
| 8 | insert_probes | Total slots inspected during insertion |
| 9 | max_displacement | Largest occupied distance from home |
| 10 | hit_count | Requested successful lookups |
| 11 | hit_probes | Total slots inspected for those lookups |
| 12 | hits_found | Successful outcomes; must equal `hit_count` |
| 13 | miss_count | Requested unsuccessful lookups |
| 14 | miss_probes | Total slots inspected for those lookups |

The schema contains logical work measurements only. It intentionally excludes
elapsed time, throughput, cache misses, and physical bytes until sw-MLPL can
measure those properties honestly. New columns require a new schema version;
existing column meanings must not change.

Run it with:

```sh
just benchmark
```
