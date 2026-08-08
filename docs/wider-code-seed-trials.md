# Wider-code recovery across seeds

`just wider-code-seed-trials` repeats localized-drift recovery at random-sign
widths 4, 8, and 12 for seeds 11, 17, 29, 47, and 83.

Each width reports exhaustive recall min/mean/max, the fraction of trials that
meet the `0.75` validation threshold, mean indexed recall, and mean candidate
comparisons at multi-probe radius 1. This distinguishes a reliable escalation
from one favorable projection.

Five seeds expose variability without claiming statistical confidence. Wider
codes can improve separability while also fragmenting prefix buckets; indexed
recall and work therefore remain separate from exhaustive Hamming recall.

Here widths 4 and 8 both validate in four of five trials with mean recall
`0.9`, while width 8 lowers mean indexed work from 12 to 8 comparisons. Width
12 validates in only three trials with mean recall `0.8`. Seed 29's recovery is
repeatable for most—but not all—seeds, and increasing width is not monotonic.
