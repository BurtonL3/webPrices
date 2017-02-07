#' Scrape and format product specifications from a product's web page
#' @param x A string, a connection, or a raw vector.
#' @return Returns a list of tibbles of product characteristics and specs
#' @export
#' @examples
#' \dontrun{
#' rx142 <- "http://www.homedepot.com/p/Cerrowire-250-ft-14-2-White-NM-B-Wire-147-1472G/202304609"
#' hd_product_specs(rx142)
#' }
hd_product_specs <- function(x) {
  read_html(x) %>%
    html_nodes("table") %>%
    html_table() %>%
    setNames(nm = c("dimensions", "details", "warranty"))
}
