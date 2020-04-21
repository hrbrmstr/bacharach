#' Get or set RAINDROP_API_TOKEN value
#'
#' The API wrapper functions in this package all rely on a Raindrop
#' token residing in the environment variable `RAINDROP_API_TOKEN`.
#' The easiest way to accomplish this is to set it
#' in the `.Renviron` file in your home directory.
#'
#' You can obtain an Raindrop token by going visiting
#' <https://app.raindrop.io/#/settings/apps/dev>. Use the
#' **test token**.
#'
#' @md
#' @param force Force setting a new Raindrop key for the current environment?
#' @return atomic character vector containing the Raindrop token
#' @export
raindrop_api_token <- function(force = FALSE) {

  env <- Sys.getenv('RAINDROP_API_TOKEN')
  if (!identical(env, "") && !force) return(env)

  if (!interactive()) {
    stop("Please set env var RAINDROP_API_TOKEN to your Raindrop token",
         call. = FALSE)
  }

  message("Couldn't find env var RAINDROP_API_TOKEN See ?raindrop_api_token for more details.")
  message("Please enter your API token:")
  pat <- readline(": ")

  if (identical(pat, "")) {
    stop("Raindrop token entry failed", call. = FALSE)
  }

  message("Updating RAINDROP_API_TOKEN env var")
  Sys.setenv(RAINDROP_API_TOKEN = pat)

  pat

}
