##This script creates and saves some plots

library(ggplot2)

##Load data from one of the tables made in "02_data_table.r"
Cdat<-read.delim("Change in average response times, by Borough and type.tsv", header = TRUE, sep = "\t")

##Load data from cleaned data set made in "01_data_clean.r"
Fdat <- read.delim("fire_data_clean.tsv", header = TRUE, sep = "\t")
Fdat$date <- as.Date(Fdat$date, format='%Y-%m-%d')

## Make a stacked bar chart of average response times by type and location
Fdat$location <- factor(Fdat$location, levels = c("Staten Island", "The Bronx","Queens", "Manhattan","Brooklyn", "Citywide"))
p1 <- ggplot(data=Fdat[Fdat$date == max(Fdat$date) & Fdat$location !="Citywide"& Fdat$type != "All Fire/Emergency Incidents",], aes(x=location, y= count, fill = type, order = type)) 
p1 + geom_bar(stat="identity")+ xlab("Borough") + ylab("Count") + ggtitle("Recorded Citywide FDNY Calls in June 2010") + scale_fill_hue(name = "Type of Incident")

ggsave("barchart_incident_count_by_location.png")

## Make a side by side bar chart of changes in average response times by type and location over the year
p2 <- ggplot(data=Cdat[Cdat$location != "Citywide",], aes(x=location, y= change_in_response_time, fill = type))
p2 + geom_bar(position = "dodge", stat = "identity") + xlab("Borough") + ylab("Change in Average Response Time in Seconds") + scale_fill_hue(name = "Type of Incident") + ggtitle("Changes in Average Response Times by Borough and Incident \n Type from July 2009 through June 2010")

ggsave("sidebyside_response_time_changes_by_location.png")

## Make a line chart of changes over the year in Citywide response times to different types of incidents
Fdat$type <- factor(Fdat$type, levels = c("Non Medical Emergencies", "All Fire/Emergency Incidents","False Alarm", "Non Structural Fires","Medical Emergencies", "Medical False Alarm","Structural Fires"))
p3 <- ggplot(data = Fdat[Fdat$location == "Citywide",], aes(x = date, y = response, colour = type))
p3 + geom_line(size = 1) + xlab("Month") + ylab("Response Time in Seconds") + scale_fill_hue(name = "Type of Incident") + ggtitle("Average Citywide Response Time by \n Incident Type from July 2009 through June 2010")

ggsave("line_chart_citywide_response_time_over_year.png")

## Clean up after myself
rm(Fdat, Cdat, p1, p2, p3)
