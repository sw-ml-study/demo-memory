# Multi-probe binary retrieval

`just multiprobe` compares exact-prefix search (radius 0) with the exact bucket
plus all one-bit-neighbor prefixes (radius 1) for widths three through five.
It reports recall recovery alongside added comparisons, average candidates,
fallbacks, and remaining reduction from exhaustive Hamming search.

Multi-probe search is the next sparse-retrieval idea: spend a controlled amount
of extra index work to recover candidates lost by an aggressively narrow hash.
