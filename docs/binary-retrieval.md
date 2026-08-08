# Binary-code retrieval

`just binary-retrieval` compares exhaustive Hamming nearest-neighbor search
with a low-bit prefix shortlist. Distance is `popcount(bxor(query,candidate))`.
On the deterministic fixture, the prefix index preserves 100% nearest-neighbor
recall while reducing Hamming comparisons from 32 to 8; empty buckets safely
fall back to exhaustive search.

This is the first direct bridge from classical memory indexing to sparse ML
retrieval: compact codes select candidates, then exact distance ranks only the
shortlist. It is a teaching index, not yet BinaryPC or sparse attention.
