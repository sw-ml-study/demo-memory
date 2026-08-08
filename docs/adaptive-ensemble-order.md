# Adaptive ensemble order sensitivity

`just adaptive-ensemble-order` runs all six orders of seeds 11, 17, and 29 on
the rotation workload under the same hard total of 24 comparisons.

Each row reports seed order, recall, comparisons, exhausted queries, completed
projection scans, early agreements, and third-projection count. A final row
summarizes recall min/mean/max across orders.

Order matters because the first two completed projections can terminate a
query before the third vote. The sweep distinguishes a robust early-stop rule
from a favorable first pair; it does not select an order using target labels.

All six orders reach at least `0.75` recall, so the improvement over the strict
ensemble's `0.5` is robust. Orders with seeds 17 and 29 first reach `1.0`, stop
early on all four queries, and never run seed 11. The other first pairs reach
`0.75`; mean recall across orders is `0.8333`. Choosing the best order from this
target would itself be validation overfitting.
