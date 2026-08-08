# Hard runtime comparison budgets

`just hard-runtime-budgets` moves budget enforcement inside multi-probe
candidate scanning. A workload never performs more candidate or dense-fallback
comparisons than its declared total limit; unused work carries to later queries.

The demo runs the transferred single-index policy at budget 8 and the
sequential three-index policy at budget 24 on localized drift, rotation, and
scaling. It reports recall, total comparisons, exhausted queries, completed
projection scans, unanimous answers, and dense fallbacks.

Metadata scans used to identify matching prefix buckets are not counted as
distance comparisons, matching the existing retrieval benchmark contract.
When the ensemble cannot finish or afford dense fallback, it returns the first
available indexed answer. This preserves the hard cap but can reduce quality.

All fixture rows obey their 8/24 total limits. Localized-drift recall remains
`0.5`/`1.0`, and scaling remains `1.0` for both modes. Rotation falls to `0.25`
for the single index and `0.5` for the ensemble as later candidate scans are
truncated. Hard enforcement converts the prior resource overrun into an
explicit quality/completeness tradeoff.
