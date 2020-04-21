
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![Linux build
Status](https://travis-ci.org/hrbrmstr/bacharach.svg?branch=master)](https://travis-ci.org/hrbrmstr/bacharach)  
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-3.2.0-blue.svg)
![License](https://img.shields.io/badge/License-AGPL-blue.svg)

# bacharach

Tools to Work with the Raindrop API

## Description

Raindrop <https://raindrop.io> provides a URL bookmarking service and an
API for working with that service and more. Tools are provided to work
with the Raindrop API. A Raindrop API key (free) is required.

## What’s Inside The Tin

The following functions are implemented:

  - `get_collection`: Get a collection
  - `get_raindrop`: Get a single raindrop
  - `get_raindrops`: Get all raindrops from a collection (TODO
    pagination)
  - `get_user`: Get currently authenticated user details
  - `raindrop_api_token`: Get or set RAINDROP\_API\_TOKEN value
  - `raindrop_parse_url`: Parse and extract useful info from any URL

NOTE: This is a woefully incomplete wrapper (so far). You are def
encouraged to contribute if you use Raindrop and the package will be a
full wrapper. This skeleton was made to remind myself to make this
package and have something to hack on during long-running Athena queries
or tedious conference calls.

## Installation

``` r
remotes::install_git("https://git.rud.is/hrbrmstr/bacharach.git")
# or
remotes::install_git("https://git.sr.ht/~hrbrmstr/bacharach")
# or
remotes::install_gitlab("hrbrmstr/bacharach")
# or
remotes::install_bitbucket("hrbrmstr/bacharach")
# or
remotes::install_github("hrbrmstr/bacharach")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(bacharach)

# current version
packageVersion("bacharach")
## [1] '0.1.0'
```

## bacharach Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | ---: | ----------: | ---: | -------: | ---: |
| R    |        8 | 0.89 | 159 | 0.95 |          90 | 0.85 |       54 | 0.63 |
| Rmd  |        1 | 0.11 |   8 | 0.05 |          16 | 0.15 |       32 | 0.37 |

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
