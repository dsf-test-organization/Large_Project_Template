#' Create new project scaffolding.
#'
#' Creates all the scaffolding for a new project in a new directory. To use: 1. Go to https://github.com/settings/tokens to retrieve your auth_token.
#' 2. Change your working directory to the location you want the project folder to be stored 3. Run the function. NOTE: folders cannot be added
#' to github until there is a file in them. The github repo will be created under your personal account. You will need to transfer or fork the repo to the
#' dsf organization account.
#'
#' @param name Name of the new project. A new folder will be in the created current working directory with that name
#' @param github Logical. Create GitHub repo? Note this requires an auth_token
#' @return A new directory with a modified R package
#' @export
#' @import devtools
#' @examples new_project("pkgName", github = TRUE, auth_token = "a12k3l812143cla292f2asd81226eb")

new_project <- function(name, github = TRUE, auth_token = "get_from_github"){


  devtools::create(name)
  try(devtools::use_package_doc(name), silent = TRUE)
  try(devtools::use_readme_rmd(name), silent = TRUE)



  devtools::use_package("tidyverse", "Suggests")



  dir.create(file.path(name, "data"))
  dir.create(file.path(name, "data-raw"))
  dir.create(file.path(name, "final_analysis"))
  dir.create(file.path(name, "op_plan"))



  if (github){
    use_github(pkg = name, auth_token = auth_token, protocol = "https")

  }

}


