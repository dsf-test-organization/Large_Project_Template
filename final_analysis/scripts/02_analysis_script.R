

# NOTE: since we saved clean_data to /data, it is available
# as soon as we load the package

head(clean_data)


# Perform cutting edge statistical analysis

mean_length <- mean(clean_data$length_mm)



# create and save plots to be used in the report

png(filename="./analysis/output/length_histogram.png")

hist(clean_data$length_mm)
abline(v = mean_length, lwd = 3, col = "red")

dev.off()


dir.create(paste0(getwd(), "/op_plan/output"))

