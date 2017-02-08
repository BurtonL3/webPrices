#' Loop a given function through a list of links and store data in a list
#' @param links A list of character strings for web urls
#' @return Returns a list of results
#' @export
#' @examples
#' \dontrun{
#' x <- "http://www.homedepot.com/b/Electrical-Dimmers-Switches-Outlets/N-5yc1vZc34h"
#' links <- hd_build_multi_page_links(x)
#' scrape_loop(links, hd_get_product_links)
#' }
scrape_loop <- function(links, fun) {
  d <<- vector("list", length(links))
  fun <- match.call(fun)
  for (i in seq_along(links)) {
    if (!links[i] %in% names(d)) {
      cat(paste("Doing", links[i], "..."))
      ok <- FALSE
      counter <- 0
      while (ok == FALSE & counter <= 5) {
        counter <- counter + 1
        out <- tryCatch({
          fun(links[i])
        },
        error = function(e) {
          Sys.sleep(2)
          e
        }
        )
        if ("error" %in% class(out)) {
          cat(".")
        } else {
          ok <- TRUE
          cat(" Done.")
        }
      }
      cat("\n")
      d[[i]] <<- out
      names(d)[i] <<- links[i]
    }
  }
}
