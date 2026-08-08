# Adaptive ensemble scheduling

`just adaptive-ensemble-scheduling` compares three ensemble schedules on
rotation under the same hard total of 24 comparisons:

- schedule 1 always attempts all three projections and requires unanimity;
- schedule 2 stops after two completed projections agree, otherwise runs the
  third and uses majority; saved work carries to later queries; and
- schedule 3 applies the same adaptive rule inside fair per-query quotas.

The report includes recall, actual work, exhausted queries, completed
projection scans, early agreements, third projections, and dense fallbacks.
Early stopping is useful only when two-index agreement is reliable; unlike the
strict ensemble, a shared wrong pair can be accepted without a third vote.

On rotation, shared adaptive scheduling raises recall from `0.5` to `0.75` at
the same 24 comparisons. Two queries stop after early agreement, only two run a
third projection, and exhausted queries fall from 2 to 1. Fair adaptive quotas
remain at `0.5` recall and use only 22 comparisons because savings cannot move
between queries. Carrying early-stop savings is the useful mechanism here.
