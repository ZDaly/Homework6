##This script reads in cleaned data and saves to file some interesting tables
library(plyr)

Fdat <- read.delim("fire_data_clean.tsv", header = TRUE, sep = "\t")
Fdat$date <- as.Date(Fdat$date, format='%Y-%m-%d')

##Which borough had the worst average response time, month to month?
worst_bourough <- ddply(Fdat[Fdat$type == "All Fire/Emergency Incidents",], ~date, summarize, worst_borough = location[response == max(response)], time = response[response == max(response)])
write.table(worst_bourough,"Boroughs with worst average response times.tsv", quote = FALSE, sep = "\t", row.names = FALSE)

##Which borough had the best average response time, month to month?
best_bourough <- ddply(Fdat[Fdat$type == "All Fire/Emergency Incidents",], ~date, summarize, best_borough = location[response == min(response)], time = response[response == min(response)])
write.table(best_bourough,"Boroughs with best average response times.tsv", quote = FALSE, sep = "\t", row.names = FALSE)

##Has the city made improvements over time in response times for different types of incidents?
change <- ddply(Fdat, ~location+type, summarize, change_in_response_time = (response[date == max(date)] - response[date == min(date)]))
arrange(df=change, location,change_in_response_time)
write.table(change,"Change in average response times, by Borough and type.tsv", quote = FALSE, sep = "\t", row.names = FALSE)

##Clean up after myself
rm(worst_bourough, best_bourough, change, Fdat)
