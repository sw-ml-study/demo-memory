# Prefix-width tradeoff

`just prefix-widths` sweeps one through five low prefix bits over 32 codes and
16 perturbed queries. Each row reports recall, exact comparisons, fallbacks,
average compared candidates, and reduction from exhaustive Hamming search.

Wider prefixes usually shrink buckets but can exclude the true neighbor or
produce empty buckets that trigger exhaustive fallback. The matrix makes that
recall/work tradeoff visible instead of presenting one favorable index size.
