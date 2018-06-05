library(devtools)


raw_dat <- read.csv("./data-raw/raw_data.csv")


# remove row names column
clean_data <- data.frame(raw_dat[,2])

names(clean_data) <- "length_mm"

# save the clean data as an .rda file in the /data folder
# this will load the clean data when you call library(package_name)
# NOTE: the file in data-raw is not loaded automatically and must be read in as was done above.
use_data(clean_data)
