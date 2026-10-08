# Contributing to MedStat3D

## Organ ownership

Each organ is developed on its own integration branch (for example,
`organ/heart`). Contributors first work on an individual branch, receive review
from a teammate, and then merge into that organ branch. Cross-organ API changes
require review from the maintainers of every affected organ branch.

Do not commit patient data, derived identifiable data, or unlicensed atlas
assets. Keep source provenance, license, intended segmentation scheme, and
validation evidence with every atlas contribution.

## Pull-request checklist

- State the organ and atlas/segmentation scheme affected.
- Add or update the atlas manifest in `inst/atlas/<organ>/`.
- Keep segment identifiers stable; document any mapping or deprecation.
- Add tests for the data contract and expected failure modes.
- Run `testthat::test_local()` and report the result.
- Have a teammate review an individual branch before merging to an organ branch.

## Scope boundary

The package accepts statistical values indexed by segment identifiers. It does
not infer a segmentation, establish clinical validity, or determine whether a
statistical finding is clinically actionable.
