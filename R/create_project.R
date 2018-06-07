#' Create new project scaffolding.
#'
#' Creates all the scaffolding for a new project in a new directory. To use: 1. Go to https://github.com/settings/tokens
#' to retrieve your auth_token. 2. Change your working directory to the location you want the project folder to be
#' stored 3. Run the function. NOTE: folders cannot be added to github until there is a file in them.
#' The github repo will be created under your personal account. You will need to transfer or fork the repo to the
#' dsf organization account.
#'
#' @param pkg_name Character string. A new folder will be in the created current working directory with this name
#' @param github Logical. Create GitHub repo? Note this requires an auth_token
#' @param auth_token Character string. Unique token provided by github required to create a repository under your personal account
#' @param pkg_depends Character string or vector of strings. These are the packages used in the analysis.
#' @return A new directory with a modified R package
#' @export
#' @import devtools
#' @examples create_project("pkgName", github = TRUE, auth_token = "a12k3l812143cla292f2asd81226eb")

create_project <- function(pkg_name,
                        github = TRUE,
                        auth_token = "get_from_github",
                        pkg_depends = "tidyverse"){


  devtools::create(pkg_name)
  try(devtools::use_package_doc(pkg_name), silent = TRUE)
  try(devtools::use_readme_rmd(pkg_name), silent = TRUE)



  # run the use_package function over all the package names
  # pkg is passed as a parameter to use_package
  sapply(X = pkg_depends, FUN = devtools::use_package, pkg = pkg_name)



  dir.create(file.path(pkg_name, "data"))
  dir.create(file.path(pkg_name, "data-raw"))
  dir.create(file.path(pkg_name, "final_analysis"))
  dir.create(file.path(pkg_name, "op_plan"))



  if (github){
    devtools::use_github(pkg = pkg_name, auth_token = auth_token, protocol = "https")
  }


}


