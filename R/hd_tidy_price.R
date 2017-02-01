#' Get product and price details from HD web page in a tidy format
#' @param x A string, a connection, or a raw vector.
#' @return Returns a data frame with the product's model number and price from web
#' @export
#' @examples
#' \dontrun
#' {
#' x <- "http://www.homedepot.com/b/Electrical-Dimmers-Switches-Outlets/N-5yc1vZc34h"
#' links <- hd_get_product_links(x)
#' map(links, hd_tidy_price) %>% reduce(rbind)
#' }
hd_tidy_price <- function(x) {
  id <- slit(link = x, pos = 5)
  sku <- slit(link = x, pos = 6)
  price <- hd_product_price(x)
  modelno <- hd_product_model(x)
  df <- data_frame(
    id = id, sku = sku, modelno = modelno, price = price, time = Sys.time())
  return(df)
}

