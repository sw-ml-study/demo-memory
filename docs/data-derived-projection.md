# Data-derived binary projection

`just data-derived-projection` centers the memory vectors, forms their
covariance matrix, extracts directions with visible power iteration and
deflation, and thresholds those projections into binary codes. It compares
training-free covariance codes with three deterministic random projections.

This is a small BinaryPC-like bridge: the index directions come from the memory
distribution rather than arbitrary hyperplanes. It is not a reproduction of
BinaryPC's full algorithm or GPU index.
