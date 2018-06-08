#' write_meta
#'
#' Writes a metadata template to data-raw
#'
#' @param txt The text to be written
#'
#' @return readme_metadata.txt in /data-raw
#' @export
#'
#' @examples write_meta("the string of text to be written")
write_meta <- function(location="data"){


  x <-  "Introductory Information

  Filename: name and short description of the raw data file
  Name/Instituiton/Address/Principal Investigators: who funded the data collection and who used it?
  Date of Data Collection: when was this data collected?
  Location: Where was the data collected?
  When was the data file created, were there any updates?:
  Keywords:

  Methodological Information

  Methodology: links or references to documentation containing sampling or experimental design or protocols
  Quality Assurance: describe any quality-assurance procedures performed on the data
  Outliers: definitions of codes or symbols used to note low quality/questionable/outliers

  Data-Specific Information

  Variable full names and descriptions:
  Var1: Description of variable 1
  Var2: Description of variable 2
  .
  .
  .

  Units of measurement for each var:
  Definitions for codes or symbols used to record missing data: NA?
  Unique formats or abbreviations?: Note them here

  Sharing/Access Information

  Links to publications that cite or use the data

  "

  write(x, file = location)

}
