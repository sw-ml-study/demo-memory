# Reservoir detection across seeds

`just reservoir-seed-trials` repeats the stream detector for seeds 11, 17, 29,
47, and 83 at reservoir sizes 1, 2, and 4. This prevents the monitoring result
from resting on the favorable or unfavorable replacements made by one seed.

The summary reports detection rate, nearest-rank p50/p95 delay in shifted
queries, and mean queries monitored. Detection is checked after two and four
shifted queries. A delay of `6` is an explicit right-censored sentinel meaning
the trial did not detect within the four shifted queries; censored trials stay
in percentile calculations instead of disappearing from the result.

Five seeds make variance visible but do not provide a confidence interval.
Larger trial counts remain directly expressible, while a passable RNG stream
would simplify seed management rather than change the algorithm.
