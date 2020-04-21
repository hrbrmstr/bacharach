# https://api.raindrop.io/rest/v1/import/url/parse

#' Parse and extract useful info from any URL
#'
#' @param url a URL
#' @export
raindrop_parse_url <- function(url, api_key = raindrop_api_token()) {

  httr::GET(
    url = "https://api.raindrop.io/rest/v1/import/url/parse",
    .RAINDROP_UA,
    raindrop_auth(),
    query = list(
      url = url[1]
    )
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")

  out <- jsonlite::fromJSON(out)

  if (out$result) {

    rownames(out$item$media) <- NULL
    rownames(out$item$meta) <- NULL

    out$item$media <- I(list(out$item$media))
    out$item$meta <- I(list(out$item$meta))

    out <- data.frame(out$item, stringsAsFactors = FALSE)

    class(out) <- c("tbl_df", "tbl", "data.frame")

  }

  out

}

