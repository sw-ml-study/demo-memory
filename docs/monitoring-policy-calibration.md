# Monitoring-policy calibration

`just monitoring-policy-calibration` crosses reservoir sizes 1, 2, and 4 with
recall thresholds `0.50`, `0.75`, and `1.01` over five deterministic seeds.

Every policy runs on two streams:

- the healthy-to-shifted stream measures detection rate, censored p50/p95
  delay, and mean monitoring work; and
- an all-healthy control stream measures false-trigger rate.

This makes the policy frontier explicit. A low threshold can miss real drift;
a threshold above perfect recall detects everything by rebuilding healthy
indexes too; and larger reservoirs spend more monitoring work while their
average can sit exactly on a strict threshold. The useful choices are those
that improve detection or delay without adding false triggers or dominated
monitoring work.

The fixture and five seeds are a deterministic teaching benchmark, not a
statistical guarantee. Non-detection remains encoded as delay `6`, beyond the
four shifted queries observed.

For this fixture, reservoir 1 at threshold `0.50` or `0.75` is nondominated:
both settings detect every trial at delay 2 with mean monitoring work 2 and no
false triggers. Reservoir 2 at `0.75` matches detection and delay but doubles
work. Reservoir 4 detects only at `1.01`, where every healthy control also
triggers. These rankings are observations of the reported workload, not
universal defaults.
