#' Scrape and format price from HD product page
#' @param x A string, a connection, or a raw vector.
#' @return Returns a numeric price from a given HD product link
#' @export
#' @examples
#' \dontrun
#' {
#' x <- "http://www.homedepot.com/b/Electrical-Dimmers-Switches-Outlets/N-5yc1vZc34h"
#' links <- hd_get_product_links(x)
#' hd_product_price(links[1])
#' }
hd_product_price <- function(x) {
    read_html(x, encoding = "UTF-8") %>%
    html_nodes("#ajaxPrice") %>%
    html_text() %>%
    str_replace_all("\r\n|\\$|\\,", "") %>%
    str_trim() %>%
    as.numeric
}

