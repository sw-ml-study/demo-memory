# Logical Bloom filter

A Bloom filter uses several hashes to set and test positions in a bit vector.
It can prove that a key is absent; a positive result means only that the key
may be present. The demo compares every answer with an exact vector-membership
oracle, making false positives and the required absence of false negatives
directly observable.

Run `just bloom-benchmark`. Schema-v1 rows contain: schema, workload, logical
bit count, hash count, inserted count, query count, true positives, false
negatives, false positives, true negatives, set-bit count, logical bit density,
and false-positive rate.

The matrix also makes a classic tradeoff visible: adding hashes is not
automatically better. With too few bits, extra hashes saturate the vector and
increase false positives; increasing the bit budget lowers the rate.

## Honest representation boundary

The current implementation stores each logical bit as an element of a dense
numeric array. Its membership behavior and logical bit budget are meaningful;
its physical bytes and cache behavior are not representative of a packed Bloom
filter. Fixed-width unsigned values, bit operations, packed storage, and
observable allocation size remain upstream requirements before this demo can
report bytes per key or memory bandwidth.
