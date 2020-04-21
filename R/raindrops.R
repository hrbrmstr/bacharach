# https://api.raindrop.io/rest/v1/raindrop/{id}

#' Get a single raindrop
#'
#' @param id raindrop id
#' @export
get_raindrop <- function(id, api_key = raindrop_api_token()) {

  sprintf(
    "https://api.raindrop.io/rest/v1/raindrop/%s",
    id[1]
  ) -> get_raindrop_url

  httr::GET(
    url = get_raindrop_url,
    .RAINDROP_UA,
    raindrop_auth()
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")

  out <- jsonlite::fromJSON(out)

  out

}

#' Get all raindrops from a collection (TODO pagination)
#'
#' TODO pagination
#'
#' @param id collection id
#' @export
get_raindrops <- function(id, api_key = raindrop_api_token()) {

  sprintf(
    "https://api.raindrop.io/rest/v1/raindrops/%s",
    id[1]
  ) -> get_raindrop_url

  httr::GET(
    url = get_raindrop_url,
    .RAINDROP_UA,
    raindrop_auth()
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")

  out <- jsonlite::fromJSON(out)

  if (out$result) {

    out <- out$items

    colnames(out) <- c(
      "excerpt", "type", "cover", "tags", "removed", "id", "title",
      "media", "link", "collection", "cover_id", "user", "created",
      "last_update", "domain", "creator", "sort", "cache",
      "collection_id"
    )

    out$tags <- I(list(out$tags))
    out$media <- I(list(out$media))
    out$collection <- I(list(out$collection))
    out$user <- I(list(out$user))
    out$creator <- I(list(out$creator))
    out$cache <- I(list(out$cache))

    class(out) <- c("tbl_df", "tbl", "data.frame")

  }

  out

}



