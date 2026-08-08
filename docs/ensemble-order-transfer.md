# Adaptive ensemble order transfer

`just ensemble-order-transfer` freezes the rotation-tuned order 17→29→11 and
compares it with neutral order 11→17→29 on rotation, localized drift, and
harmless scaling under hard total budget 24.

Rows report recall, comparisons, exhausted queries, completed projections,
early agreements, third projections, and tuned-minus-neutral recall delta.
The delta is repeated on both order rows to keep the numeric schema flat.

This is a transfer test, not target-side order selection. A tuned first pair can
save work by agreeing early, but shared wrong agreement can also remove the
third vote that would have corrected it.

The tuned order improves rotation recall from `0.75` to `1.0`. Localized drift
stays at full recall and 16 comparisons for both orders. Scaling also keeps full
recall, but tuned work rises from 16 to 20 because two queries require the third
projection. Quality transfers in this fixture; the early-stop efficiency gain
does not.
