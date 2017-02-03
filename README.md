# webPrices
webPrices: Scrape online prices with rvest

webPrices is a set of tools for harvesting pricing from big box stores (e.g. Home Depot and Lowes) and Amazon online. It has
two main goals:
 
 1. Effectively extract price information and other relevant product details from web stores;
 2. Do so in a tidy format.
 
The package is designed as part of an overall pricing strategy for a b2b distribution company. To summarize the overall strategy we intend to connect our resales to public market pricing to better reflect the willingness to pay of customers. By using this approach we can succesfully implement dynamic pricing based on competitor's inventory positions and other deterministic factors.

When complete, the hope for this project is to provide tools for scraping prices from a variety of online B2B market places with a focus on wire, electrical and lighting goods. 

The first set of functions that comprise the package are to be used to extract pricing and product data from home depot.com

A brief example of a workflow is shown below. The function hd_tidy_scrape() returns an object ```d``` in the global
environment and it's a list of tibbles.

``` r
    main <- "http://www.homedepot.com/b/Electrical-Dimmers-Switches-Outlets/N-5yc1vZc34h"
    pgs <- hd_build_multi_page_links(main)
    prods <- purrr::map(pgs, hd_get_product_links)
    hd_tidy_scrape(prods)
    df <- reduce(d, rbind)
```

Happy pricing.
