#' Get product and price details for a list of product urls on Home Depot
#' @param links A list of character strings for web urls
#' @return Returns a list of data frames with the product's model number and price from web
#' @export
#' @examples
#' \dontrun{
#' x <- "http://www.homedepot.com/b/Electrical-Dimmers-Switches-Outlets/N-5yc1vZc34h"
#' links <- hd_get_product_links(x)
#' hd_tidy_scrape(links)
#' }
hd_tidy_scrape <- function(links) {
  d <<- vector("list", length(links))
  for (i in seq_along(links)) {
    if (!links[i] %in% names(d)) {
      cat(paste("Doing", links[i], "..."))
      ok <- FALSE
      counter <- 0
      while (ok == FALSE & counter <= 5) {
        counter <- counter + 1
        out <- tryCatch({
          hd_tidy_price(links[i])
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
