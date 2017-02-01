#' Paste the main page url for homedepot.com to a character string of a partial url
#' @param x A string, a connection, or a raw vector.
#' @return Scraping all product links from catalog pages returns partial links, this function appends the main url as a prefix.
#' @export
#' @examples
#' \dontrun{
#' x <- "http://www.homedepot.com/b/Electrical-Dimmers-Switches-Outlets/N-5yc1vZc34h"
#' links_part <- hd_get_product_links(x)
#' links_full <- hd_add_main_url(links)
#' }
hd_add_main_url <- function(x) {
  paste0("http://www.homedepot.com", x)
}
