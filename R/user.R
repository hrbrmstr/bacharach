# https://api.raindrop.io/rest/v1/user

#' Get currently authenticated user details
#'
#' @export
get_user <- function(api_key = raindrop_api_token()) {

  httr::GET(
    url = "https://api.raindrop.io/rest/v1/user",
    .RAINDROP_UA,
    raindrop_auth()
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")

  out <- jsonlite::fromJSON(out)

  out

}


