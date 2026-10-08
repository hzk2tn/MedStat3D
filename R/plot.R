#' Plot a segmented statistical map
#'
#' Validates a statistical data set and renders it with the named organ's
#' registered atlas. Rendering is unavailable in the skeleton because no atlas
#' bundles have been registered.
#'
#' @inheritParams validate_segmented_data
#' @param ... Rendering options reserved for a future atlas adapter.
#'
#' @return This function is expected to return an interactive 3D scene once an
#'   atlas renderer is installed.
#' @export
#'
#' @examples
#' \dontrun{
#' plot_stat_map(data.frame(segment_id = "segment_01", statistic = 1.2), "heart")
#' }
plot_stat_map <- function(data, organ, segment_id = "segment_id", value = "statistic", ...) {
  validate_segmented_data(data, organ, segment_id, value)
  available <- medstat3d_atlas(organ)

  if (!nrow(available) || available$status[[1L]] != "available") {
    stop(
      sprintf("No released atlas is registered for '%s'; plotting is unavailable.", organ),
      call. = FALSE
    )
  }

  stop("A renderer adapter has not yet been registered for this atlas.", call. = FALSE)
}
