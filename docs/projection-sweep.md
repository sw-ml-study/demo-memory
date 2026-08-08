# Projection width and seed sweep

`just projection-sweep` evaluates 4-, 8-, 12-, and 16-bit sign projections
across seeds 11, 29, and 47. Each row reports min/mean/max exhaustive Hamming
recall, indexed recall, and indexed comparison reduction.

The sweep separates a robust width trend from seed luck and makes projection
variance a first-class part of the retrieval experiment.
