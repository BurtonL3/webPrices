#' Extract the max page number from bottom of product catalog url
#' @param x A string, a connection, or a raw vector.
#' @return Returns a numeric value containing the last page in catalog
#' @export
#' @examples
#' \dontrun{
#' pg1 <- "http://www.homedepot.com/b/Electrical-Dimmers-Switches-Outlets/N-5yc1vZc34h"
#' pg2 <- next_page(pg1)
#' }
next_page <- function(x) {
  xml2::read_html(x) %>%
    html_nodes("link") %>%
    html_attrs(.) %>%
    .[grepl("next",.)] %>%
    unlist %>%
    .[[2]] %>%
    hd_add_main_url
}
