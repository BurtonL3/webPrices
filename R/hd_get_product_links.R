#' Scrape all product urls from a catalog page on HD
#' @param x A string, a connection, or a raw vector.
#' @return Returns a vector of strings with product urls
#' @export
#' @examples
#' \dontrun{
#' x <- "http://www.homedepot.com/b/Electrical-Dimmers-Switches-Outlets/N-5yc1vZc34h"
#' links <- hd_get_product_links(x) %>%
#' hd_add_main_url %>%
#' map(hd_tidy_price) %>%
#' reduce(rbind)
#' }
hd_get_product_links <- function(x) {
  xml2::read_html(x) %>%
    rvest::html_nodes("a") %>%
    rvest::html_attr("href") %>%
    .[!is.na(.)] %>%
    .[grepl("/p/", .)] %>%
    unique %>%
    .[!grepl("#customer_reviews", .)]
}
