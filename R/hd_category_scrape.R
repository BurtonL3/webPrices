#' Get product and price details for all products in a section on Home Depot from main url
#' @param links A list of character strings for web urls
#' @return Returns a single data frame with data for every product within a catalog section
#' @export
#' @examples
#' \dontrun{
#' x <- "http://www.homedepot.com/b/Electrical-Dimmers-Switches-Outlets/N-5yc1vZc34h"
#' hd_catalog_scrape(x)
#' }
hd_category_scrape <- function(x) {
  pages <- x %>% hd_build_multi_page_links %>% unlist
  prods <- map(pages, hd_get_product_links) %>% unlist %>% hd_add_main_url
  hd_tidy_scrape(prods)
  d %>% reduce(rbind)
}
