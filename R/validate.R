#' Validate segmented statistical data
#'
#' Validates the portable long-form data contract used by MedStat3D. It checks
#' data structure only; an installed organ atlas will additionally check whether
#' the supplied segment identifiers belong to that atlas.
#'
#' @param data A data frame with one row per segment.
#' @param organ Organ name. It is retained with the validated data for a future
#'   atlas adapter.
#' @param segment_id Name of the character segment-ID column.
#' @param value Name of the finite numeric statistic column.
#'
#' @return `data`, with class `medstat3d_segmented_data` and an `organ`
#'   attribute.
#' @export
#'
#' @examples
#' x <- data.frame(segment_id = "segment_01", statistic = 1.2)
#' validate_segmented_data(x, organ = "heart")
validate_segmented_data <- function(data, organ, segment_id = "segment_id", value = "statistic") {
  if (!is.data.frame(data) || !nrow(data)) {
    stop("`data` must be a non-empty data frame.", call. = FALSE)
  }
  if (!is.character(organ) || length(organ) != 1L || is.na(organ) || !nzchar(organ)) {
    stop("`organ` must be one non-empty character value.", call. = FALSE)
  }
  if (!is.character(segment_id) || length(segment_id) != 1L ||
      !is.character(value) || length(value) != 1L) {
    stop("`segment_id` and `value` must each name one column.", call. = FALSE)
  }
  if (!all(c(segment_id, value) %in% names(data))) {
    stop("`data` must contain the selected segment-ID and value columns.", call. = FALSE)
  }

  ids <- data[[segment_id]]
  values <- data[[value]]
  if (!is.character(ids) || anyNA(ids) || any(!nzchar(ids))) {
    stop("The segment-ID column must contain non-missing, non-empty character values.", call. = FALSE)
  }
  if (anyDuplicated(ids)) {
    stop("The segment-ID column must have exactly one row per segment.", call. = FALSE)
  }
  if (!is.numeric(values) || any(!is.finite(values))) {
    stop("The value column must contain finite numeric values.", call. = FALSE)
  }

  class(data) <- unique(c("medstat3d_segmented_data", class(data)))
  attr(data, "organ") <- tolower(organ)
  data
}
