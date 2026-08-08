# Sparse Hamming-weighted aggregation

`just sparse-aggregation` attaches numeric values to binary keys. Dense mode
scores every key with `1 / (1 + Hamming distance)^2`; sparse mode scores only
prefix buckets within radius zero or one. Rows report mean/max output error and
candidate-scoring reduction versus dense aggregation.

This is a small sparse-attention analogue: indexing chooses memory candidates,
exact scores weight their values, and approximation quality is measured at the
output rather than only by nearest-neighbor recall.
