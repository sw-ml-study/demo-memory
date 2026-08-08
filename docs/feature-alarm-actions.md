# Acting on feature alarms

`just feature-alarm-actions` compares two policies after the covariance
residual crosses `0.10`:

- policy 1 immediately rebuilds the projection; and
- policy 2 waits for sampled recall below `0.75`, checking at two and four
  arrivals.

The cases are orthogonal rotation, harmless queries shifted outside the fitted
subspace, and localized harmful drift. Each policy reports early recall,
whether and when it rebuilt, cells reread, and final full-query recall.

Immediate action minimizes recovery delay but assumes every feature change
matters. Confirmation can avoid work when retrieval remains correct, at the
cost of waiting until failures become observable. The benchmark keeps both
costs explicit rather than treating an alarm as proof of quality loss.

The fixture separates three outcomes. Rotation is harmful immediately and
both policies rebuild at delay 2, restoring full recall. The harmless
out-of-subspace case also alarms, but confirmation preserves full recall while
avoiding a 32-cell rebuild. Localized drift alarms before recall falls, yet the
eventual 32-cell rebuild restores no recall: this covariance/sign-code model is
itself insufficient for that distribution. An alarm can justify investigation
without proving that rebuilding the same index will fix the problem.
