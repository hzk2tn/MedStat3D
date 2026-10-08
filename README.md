# MedStat3D

`MedStat3D` is an R package in development for visualising statistical results
on segmented medical-imaging data. Its intended users are imaging researchers,
biostatisticians, and clinicians who need a consistent workflow across organs
with different irregular three-dimensional geometries.

## Status

This repository is an initial package skeleton. The statistical-data contract,
atlas registry interface, tests, and contribution boundaries are in place; no
clinical atlas meshes or rendering backend have been shipped. Results from this
package must not be used for clinical decision-making until an atlas and its
validation have been explicitly released.

## Planned workflow

```r
library(MedStat3D)

results <- data.frame(
  segment_id = c("segment_01", "segment_02"),
  statistic = c(1.2, -0.4)
)

validate_segmented_data(results, organ = "heart")
plot_stat_map(results, organ = "heart")
```

`validate_segmented_data()` validates the portable, long-form input before a
renderer is invoked. `plot_stat_map()` is intentionally unavailable until an
atlas asset and rendering adapter are registered.

## Layout

```
R/             Public API and validation contract
inst/atlas/    Versioned atlas assets and per-organ manifests (not yet included)
tests/testthat/ Automated contract tests
docs/          Design and contribution guidance
```

See [docs/atlas-contract.md](docs/atlas-contract.md) for the artifact contract
and [CONTRIBUTING.md](CONTRIBUTING.md) for the organ-branch workflow.

## Development

Install development dependencies, then run:

```r
testthat::test_local()
```

Before publishing, replace the placeholder maintainer email and repository URLs
in `DESCRIPTION`, add reviewed atlas assets, and run `R CMD check`.
