# webPrices
webPrices: Tools to scrape prices with rvest and the tidyverse

webPrices is a set of tools for harvesting pricing from online. It has two main goals:

 1. Effectively extract price information and other relevant product details from web stores;
 2. Do so in a tidy format.

-   Install it from github

``` r
if (packageVersion("devtools") < 1.6) {
  install.packages("devtools")
    }
devtools::install_github("burtonlueth/webPrices")
```

The package is designed as part of an overall pricing strategy for a b2b distribution company. To summarize the overall
strategy, we intend to connect prices to public market pricing to better reflect customers' willingness-to-pay. 
Our theory is this approach will outperform the traditional aggregated market segmentation model.

webPrices is designed to provide tools for scraping prices from a several of online market places with a focus on wire, electrical and lighting goods, and keeping consistent formatting so that the data may be aggregated. 

The first set of functions that comprise the package are to be used to extract pricing and product data from home depot.com

A brief example of a workflow is shown below. The function hd_tidy_scrape() returns an object ```d``` in the global
environment and it's a list of tibbles.

``` r
main <- "http://www.homedepot.com/b/Electrical-Dimmers-Switches-Outlets/N-5yc1vZc34h"
pages <- hd_build_multi_page_links(main)
prods <- purrr::map(pages, hd_get_product_links)
prods <- prods %>% unlist %>% hd_add_main_url
hd_tidy_scrape(prods)
df <- reduce(d, rbind)
```
Or a more concise way to accomplish the same results:

``` r
main <- "http://www.homedepot.com/b/Electrical-Dimmers-Switches-Outlets/N-5yc1vZc34h"
df <- hd_catalog_scrape(main)
```

Happy pricing!
