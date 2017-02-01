#' Split a string (e.g. of a url) to extract parts between a given delimeter
#' @param link a string with possible characters to use as delimeters (usually a web url)
#' @param split the delimter, default is "/" for web urls
#' @param pos the position of partial string to extract
#' @return Returns a partial character string from the full input
#' @export
#' @examples
#' \dontrun
#' {
#' x <- "http://www.homedepot.com/b/Electrical-Dimmers-Switches-Outlets/N-5yc1vZc34h"
#' links <- hd_get_product_links(x)
#' id <- slit(links[1], 5)
#' sku <- slit(links[1], 6)
#' }
slit <- function(link, split = "/", pos) {
  stringr::str_split(link, split) %>%
    unlist %>%
    .[pos]
}
