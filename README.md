## Large Project Template

A template for how to organize a large project that requires many custom functions and thorough documentation. Much of the layout was taken from the following:

* Guide to small project layout: https://nicercode.github.io/blog/2013-04-05-projects/
* Guide to using R packages for reproducible research: https://peerj.com/preprints/3192/

## Package Structure

* __/R__
  All the definitions of custom functions go here. It's generally best practice to group similar functions in the same script file so the folder isn't overflowing with files. Also important, there should be a data.R file containing roxygen documentation that __thoroughly documents the data__. **Does metadata for the raw data belong somewhere else?
  
* __/final_analysis__
  * __/scripts__ This is where the functions defined in /R get used to clean and analyze the data. Use good naming schemes and or number the scripts to define a specific order they should be run in.
  * __/output__ This is where all cumbersome tables, plots, or simulation output goes
  * __/reports__ Here we would store a technical .rmd that walks the reader through the statistical analysis and choices made. This would also be where the final report is stored.
 
 * __/data-raw__ This is where the raw data that never gets touched goes. The contents of this folder should be provided by whoever manually entered the data.
 
 * __/data__ This is where the (clean) data you want users to have immediate access to after loading the package goes. Should be saved as an .rda file. Use devtools::use_data(x) to correctly save data into this folder.

 * __/man__ (stands for manual) This is where the documentation for all the functions in /R goes. The contents of this folder are automatically generated by roxygen and should not be manually edited. All functions defined in /R should have roxygen documenation.

* __/op_plan__ Similar structure as the final_analysis folder, except this is for everything that was done pre data collection.
