# Projected binary codes

`just projected-codes` multiplies continuous vectors by a deterministic random
projection, thresholds signs, and packs the LSB-first bit vector with
`from_bits`. It compares dense dot-product nearest neighbors with exhaustive
Hamming retrieval and radius-one indexed retrieval.

This replaces hand-authored codes with an embedding-to-index pipeline. Recall
loss can now come from binary projection as well as shortlist selection, and
the benchmark reports both boundaries separately.
