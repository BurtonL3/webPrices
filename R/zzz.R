load <- c("ggplot2", "tibble", "tidyr", "readr", "purrr", "dplyr", "rvest")

.onAttach <- function(...) {
  needed <- load[!is_attached(load)]

  if (length(needed) == 0)
    return()

  packageStartupMessage(paste0("Loading required package: ", needed, collapse = "\n"))
  suppressPackageStartupMessages(
    lapply(needed, library, character.only = TRUE, warn.conflicts = FALSE)
  )

}

is_attached <- function(x) {
  paste0("package:", x) %in% search()
}
