#' Create new project scaffolding.
#'
#' Create all the scaffolding for a new project in a new directory. To use: 1. Go to https://github.com/settings/tokens to retieve your auth_token that will be used in the function.
#' 2. Change your working directory to the location where you want the project folder to be stored 3. Run the function.
#'
#' @param name Name of the new project. A new folder will be in the created current working directory with that name.
#' @param github Logical. Create GitHub repo? Note this requires a \code{GITHUB_PAT}. See \code{\link[devtools]{use_github}}.
#' @return A new directory with R package structure, slightly modified.
#' @export
#' @import devtools
#' @examples  new_project("pkgName", github = TRUE, auth_token = "a12k3ln0812143cla292f2asd81226eb")

new_project <- function(name, github = FALSE, auth_token = NULL){
  print("dev tools create name")
  devtools::create(name)
  print("trying")
  try(use_package_doc(name), silent = TRUE)
  try(use_readme_rmd(name), silent = TRUE)

  print("use stuff")
  # use_data_raw(name)
  use_testthat(name)


  dir.create(file.path(name, "data"))
  dir.create(file.path(name, "data-raw"))
  dir.create(file.path(name, "final_analysis"))
  dir.create(file.path(name, "op_plan"))
  # cat("\n^analyses$ \n^manuscript$ \n", sep = "",
  #     file = file.path(name, ".Rbuildignore"), append = TRUE)

  if (github){
    use_github(pkg = name, auth_token = auth_token, protocol = "https")
    use_github_links(name, auth_token = auth_token)


  }

}

# new_project("test1", github = TRUE, auth_token = "c6d8265208351e4085fe492f2550d0aa0197d6eb")
