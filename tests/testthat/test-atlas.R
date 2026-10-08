test_that("atlas registry lists planned organs", {
  registry <- medstat3d_atlas()

  expect_true(all(c("organ", "status", "atlas_version") %in% names(registry)))
  expect_true(all(registry$status == "planned"))
  expect_equal(medstat3d_atlas("HEART")$organ, "heart")
})

test_that("atlas registry rejects an invalid organ filter", {
  expect_error(medstat3d_atlas(c("heart", "brain")), "one non-missing")
})
