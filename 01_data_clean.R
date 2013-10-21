##This script reads in the rough data as provided by NYC and cleans it
library(plyr)

## The data is stored as a CSV file, but we only need the first 504 rows (garbage after)
dat <- read.csv("FDNY_Monthly_Response_Times.csv", nrows = 504)

## The names in the original file are cumbersome, so I rename them
names(dat) <- c("date","type", "location","count", "time")

##The actual name of The Bronx is "The Bronx", not "Bronx" so I fix it
dat <- within(dat, location <- revalue(location, c(Bronx = "The Bronx")))

##The column indicating the month is poorly formatted, with no deliminator between the month and year.
##I add a deliminator and a dummy day value into the string 
dat$date <-paste(substr(dat$date, 1, 4), "-", substr(dat$date, 5, nchar(dat$date)),"-01", sep = "")

##It is now ready for me to tell R that it is dealing with a date.
dat$date <- as.Date(dat$date, format='%Y-%m-%d')

##The next several sections of code deal with cleaning the average response time variable
##Unfortunately the times are being read in as strings of the form "mm:ss"

##I start by breaking the time strings up at the deliminator
break_time <- strsplit(as.character(dat$time), ":")
time_parts <- matrix(unlist(break_time), ncol=2, byrow=TRUE)

##Next I create two vectors, one for all of the "second" values and one for all of the "minute" values.
mins <- as.integer(time_parts[,1])
secs <- as.integer(time_parts[,2])

##Finally I create a new variable called response, which is calculated as the total number of seconds
##I did this as it seemed far more flexible and break proof, as opposed to being a stored as date object
dat$response <- 60* mins + secs

##I now get rid of the old time information as it is no longer needed.
dat <- subset(dat, select = -c(time) )

##I write the cleaned data to file...
write.table(dat, "fire_data_clean.tsv", quote = FALSE, sep = "\t", row.names = FALSE)

##... and tidy up the last few objects that are hanging around
rm(time_parts, break_time, mins, secs, dat)
