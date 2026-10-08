#' List registered organ atlases
#'
#' Returns the package's atlas registry. An entry becomes available only after
#' its mesh, segment mapping, provenance, and validation evidence are bundled.
#'
#' @param organ Optional organ name used to filter the registry.
#'
#' @return A data frame with one row per registered or planned organ.
#' @export
#'
#' @examples
#' medstat3d_atlas()
medstat3d_atlas <- function(organ = NULL) {
  registry <- data.frame(
    organ = c("brain", "heart", "liver"),
    status = "planned",
    atlas_version = NA_character_,
    stringsAsFactors = FALSE
  )

  if (is.null(organ)) {
    return(registry)
  }

  if (!is.character(organ) || length(organ) != 1L || is.na(organ)) {
    stop("`organ` must be one non-missing character value.", call. = FALSE)
  }

  registry[registry$organ == tolower(organ), , drop = FALSE]
}
