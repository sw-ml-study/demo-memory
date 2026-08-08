# Budget-selector transfer

`just budget-selector-transfer` freezes the modes selected on localized-drift
validation at budgets 8 and 24, then applies those exact choices to orthogonal
rotation and harmless scaling.

Each row reports selected mode, validation recall/work, target recall/work,
recall delta, and whether target work exceeds the original budget. Work can
change because prefix occupancy and ensemble disagreement are workload
properties even when code width and query count stay fixed.

The experiment exposes validation overfitting rather than recalibrating on each
target. A transferred policy needs both quality and resource monitoring; a
validation-time comparison budget is not automatically a runtime guarantee.

Quality does transfer in this fixture: both frozen modes reach full recall on
rotation and scaling. Work does not. Rotation raises the single mode from 8 to
16 comparisons and the ensemble from 24 to 70; scaling raises the ensemble to
40. The main overfit is resource prediction, not retrieval quality.
