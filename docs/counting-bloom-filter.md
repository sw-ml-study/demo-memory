# Counting Bloom deletion

A counting Bloom filter replaces logical bits with counters, enabling removal
and duplicate accounting. Run `just counting-bloom` to compare counter sums and
maximum counters across bit/hash configurations.

Removal is counter-safe: it rejects an operation if any selected counter is
zero, so counters never underflow. This does not prove the key was inserted.
Removing a false-positive key can decrement counters shared by real keys and
create false negatives; callers must remove only known occurrences.

Counters are dense f64 values today. Packed fixed-width counters, overflow
policy, and credible bytes-per-key measurements remain upstream-gated.
