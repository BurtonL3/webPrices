#' Scrape and format product specifications from a product link on Home Depot.com
#' @param x A string, a connection, or a raw vector.
#' @return Returns a data frame of product characteristics and specs
#' @export
#' @examples
#' \dontrun
#' {
#' x <- "http://www.homedepot.com/b/Electrical-Dimmers-Switches-Outlets/N-5yc1vZc34h"
#' links <- hd_get_product_links(x)
#' hd_product_specs(links[1])
#' }
hd_product_specs <- function(x) {

  dat <- read_html(x) %>%
    html_nodes('div') %>%
    html_text(trim = T) %>%
    .[seq(
      detect_index(., is_col_head),
      detect_index(., is_col_head, .right = TRUE) - 3,
      by = 1
    )] %>%
    gsub("\\\n| +$", "|", .) %>%
    unlist %>%
    str_split(pattern = "\\|") %>%
    map(., ~str_trim(., side = "both")) %>%
    .[grepl("[a-z]|[A-Z]|[0-9]",.)] %>%
    unlist %>%
    .[!. %in% c("")]

  dims <- dat %>%
    .[seq(detect_index(., is_in_dimensions_table)+1,
          detect_index(., is_in_dimensions_table, .right = TRUE)-1, 1)]

  desc <- dims[seq(1, length(dims), 2)]
  data <- dims[seq(2, length(dims), 2)]

  dims_df <- data_frame(desc, data, table = "dimensions")

  dets <- dat %>%
    .[seq(detect_index(., is_in_details_table)+1,
          detect_index(., is_in_details_table, .right = TRUE)-1, 1)]

  desc <- dets[seq(1, length(dets), 2)]
  data <- dets[seq(2, length(dets), 2)]

  dets_df <- data_frame(desc, data, table = "details")

  df <- rbind(dims_df, dets_df)

  wrnty <- dat %>%
    .[seq(detect_index(., is_in_warranty_table)+1,
          detect_index(., is_in_warranty_table, .right = TRUE)-1, 1)]

  desc <- wrnty[seq(1, length(wrnty), 2)]
  data <- wrnty[seq(2, length(wrnty), 2)]

  wrnty_df <- data_frame(desc, data, table = "warranty")

  df <- rbind(df, wrnty_df)

  return(df)
}
