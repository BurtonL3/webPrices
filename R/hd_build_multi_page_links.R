#' Construct the urls for the multiple return pages for a given catalog
#' @param x A string, a connection, or a raw vector.
#' @param pages An integer, the number of pages included in the catalog (default is to find automatically but you can override)
#' @return Returns of vector of character strings containing urls for all pages of search results for a catalog of products on HD
#' @export
#' @examples
#' \dontrun
#' {
#' x <- "http://www.homedepot.com/b/Electrical-Dimmers-Switches-Outlets/N-5yc1vZc34h"
#' links <- hd_build_multi_page_links(x)
#' all_prods_in_cat <- map(links, hd_get_product_links)
#' }
hd_build_multi_page_links <- function(x, pages = max_page) {
  x <- paste0(x, "?catStyle=ShowProducts")
  max_page <- read_html(x) %>%
    html_nodes(".hd-pagination__link") %>%
    html_text() %>%
    as.numeric %>%
    max(na.rm = TRUE)
  i <- seq(24, (pages - 1) * 24, 24)
  y <- paste0("&Nao=", i, "&Ns=None") %>% paste0(x, .)
  x <- c(x, y)
  return(x)
}
