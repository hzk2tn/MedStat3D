test_that("valid segmented data receives the expected class and organ", {
  data <- data.frame(segment_id = c("a", "b"), statistic = c(1, -0.5))

  actual <- validate_segmented_data(data, organ = "Heart")

  expect_s3_class(actual, "medstat3d_segmented_data")
  expect_identical(attr(actual, "organ"), "heart")
})

test_that("segmented data requires unique character IDs and finite values", {
  duplicate_ids <- data.frame(segment_id = c("a", "a"), statistic = c(1, 2))
  infinite_value <- data.frame(segment_id = "a", statistic = Inf)

  expect_error(validate_segmented_data(duplicate_ids, "heart"), "exactly one row")
  expect_error(validate_segmented_data(infinite_value, "heart"), "finite numeric")
})

test_that("plotting fails closed without a released atlas", {
  data <- data.frame(segment_id = "a", statistic = 1)

  expect_error(plot_stat_map(data, "heart"), "No released atlas")
})
