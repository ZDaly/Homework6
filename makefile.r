## Master Script

## clean out any previous work
outputs <- c(list.files(pattern = "*.tsv$"),  ##cleans out tsv files
             list.files(pattern = "*.png$"))  ##cleans out plots
file.remove(outputs)
rm(outputs)

## run my scripts
source("01_data_clean.R") ##This script reads in the rough data as provided by NYC and cleans it
source("02_data_table.R") ##This script takes cleaned data and outputs some tables
source("03_data_plot.R")  ##This script takes in cleaned data from the cleaning script, and a table from the table script, and outputs figures
