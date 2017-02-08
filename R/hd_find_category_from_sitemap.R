#' Use a string to search product categories on home depot's site map
#' @param search_string A character string to use to find relevant urls
#' @return Returns a list of urls of product categories containing your search string
#' @export
#' @examples
#' \dontrun{
#' page_links <- hd_find_category_from_sitemap("Electrical-Wire")[-1]
#' prod_links <- map(page_links, hd_build_multi_page_links) %>%
#'   setNames(., map(., ~slit(.[[1]], pos = 5)))
#' }
hd_find_category_from_sitemap <- function(search_string) {
  links <- xml2::read_html("http://www.homedepot.com/c/site_map") %>%
    rvest::html_nodes("a") %>%
    rvest::html_attr("href") %>%
    unique %>%
    .[!grepl("cm_sp=d-flyout",.)] %>%
    .[grepl("/b/", .)]

  links[grepl(search_string, links)]

}
