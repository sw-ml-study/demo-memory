# Proactive feature-drift alarms

`just feature-drift-alarm` compares failure-based recall monitoring with a
proactive covariance-subspace statistic. The initial memory fits two principal
directions. Incoming queries report the fraction of squared centered energy
that cannot be reconstructed from that subspace.

At the first two arrivals, residual ratio at or above `0.10` raises an alarm.
The three shift shapes report stale recall, whether rebuilding is warranted,
recall-monitor delay, residual ratio, and feature-alarm delay.

The residual has a useful invariance in this fixture: magnitude scaling within
the learned directions remains inside the subspace, while unseen-axis rotation
and localized drift create residual energy. It is not a quality metric—feature
change can be harmless, and quality can degrade without leaving a subspace—so
the benchmark keeps stale recall beside every alarm.
