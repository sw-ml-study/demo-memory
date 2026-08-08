# Packed-word Bloom filter

`just packed-bloom` stores 61 logical bits in two exact 32-bit integer-valued
MLPL words using `shl`, `bor`, `band`, `bmask`, and `popcount`. Tests require
membership and set-bit equivalence with the original 61-element logical array.

This faithfully expresses bit packing and reduces logical array elements from
61 to 2. It still cannot claim physical bytes: MLPL values remain f64 arrays,
and observable packed allocation size is a separate upstream requirement.
The demo also reports native logical-versus-word query throughput.
