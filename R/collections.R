# https://api.raindrop.io/rest/v1/collections

#' @export
get_root_collections <- function(api_key = raindrop_api_token()) {

  httr::GET(
    url = "https://api.raindrop.io/rest/v1/collections",
    .RAINDROP_UA,
    raindrop_auth()
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")

  out <- jsonlite::fromJSON(out)

  if (out$result) {

    out <- out$items

    colnames(out) <- c(
      "title", "public", "view", "count", "cover", "expanded",
      "id",  "user", "creator", "created", "last_update",
      "sort", "access",  "author"
    )

    class(out) <- c("tbl_df", "tbl", "data.frame")

  }

  out

}

#' @export
get_child_collections <- function(api_key = raindrop_api_token()) {

  httr::GET(
    url = "https://api.raindrop.io/rest/v1/collections/childrens",
    .RAINDROP_UA,
    raindrop_auth()
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")

  out <- jsonlite::fromJSON(out)

  out

}

#' Get a collection
#'
#' @param id collection id
#' @export
get_collection <- function(id, api_key = raindrop_api_token()) {

  sprintf(
    "https://api.raindrop.io/rest/v1/collection/%s",
    id[1]
  ) -> get_collection_url

  httr::GET(
    url = get_collection_url,
    .RAINDROP_UA,
    raindrop_auth()
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")

  out <- jsonlite::fromJSON(out)

  out

}




