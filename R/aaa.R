set_names <- function (object = nm, nm) { names(object) <- nm ; object }

httr::user_agent(
  sprintf(
    "{bacharach} package v%s: (<%s>)",
    utils::packageVersion("bacharach"),
    utils::packageDescription("bacharach")$URL
  )
) -> .RAINDROP_UA

raindrop_auth <- function(api_key = raindrop_api_token()) {
  httr::add_headers(
    `Authorization` = sprintf("Bearer %s", api_key)
  )
}
