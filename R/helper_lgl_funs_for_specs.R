is_col_head <- function(x) {
  x %in% c(
    "Dimensions", 
    "Details", 
    "Warranty / Certifications", 
    "More Products With These Features"
  )
}

is_in_dimensions_table <- function(x) {
  x %in% c("Dimensions", "Details")
}

is_in_details_table <- function(x) {
  x %in% c("Details", "Warranty / Certifications")
}

is_in_warranty_table <- function(x) {
  x %in% c("Warranty / Certifications", "More Products With These Features")
}

is_in_product_features_table <- function(x) {
  x %in% c("More Products With These Features", "Search")
}

