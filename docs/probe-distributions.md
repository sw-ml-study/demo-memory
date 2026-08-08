# Lookup probe distributions

Totals can hide tail behavior. The distribution benchmark therefore records
one probe count per lookup, bins those observations, and reports nearest-rank
p50 and p95 values alongside minimum, mean, and maximum.

Two versioned numeric schemas are emitted by `just probe-distributions`:

- `summary` rows have 12 columns: schema, implementation, workload, phase,
  capacity, count, total, mean, minimum, p50, p95, maximum;
- `histogram` rows have six metadata columns followed by 17 bins. Bin zero is
  one probe, and unused bins are zero-padded for capacity-11 workloads.

Phase `0` is successful lookup and phase `1` is unsuccessful lookup. The
implementation and workload IDs match [the workload schema](benchmark-schema.md).
Percentiles describe deterministic logical work, not elapsed-time latency.
