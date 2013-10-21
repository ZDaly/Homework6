Homework 6
=========

This ReadMe file contains the information needed to run my workflow for [Homework 6](http://www.stat.ubc.ca/~jenny/STAT545A/hw06_puttingAllTogether.html).

About the data: This analysis makes use of Fire Deparment of New York City (FDNY) data located [here](https://nycopendata.socrata.com/Social-Services/FDNY-Monthly-Response-Times/j34j-vqvt?). The data looks at the average response times to various types of calls across the city over the course of a year, running from July 2009to June 2010. The data has 5 different variables: Two are categorical (the borough or location, and type of incident) and three are numerical (a count variable for each type of incident, an average time of response for that type of incident in that location in that month, and a date recording the month).

This data is public and was created by the Fire Department of New York City on August 29th, 2011. It was updated June 23rd, 2013.

From the original dataset:
* There are six different locations, corresponding to the 5 boroughs and a 6th "Citywide" location
* There 7 types of incidents, including one aggregrated level (as with location)
* Date is stored in an annoying format. It is coded as YYYYMM, with no separator
* The response time is really problematic. It is being read in as a factor of strings of the form mm:ss. Alas in this form it is pretty useless.


How to replicate my analysis:

  * Assuming you use github, clone the repository onto your desktop, or download it as a zip.
  * If you don't know how to do the above, download into an empty directory:
    - Input data: [`FDNY_Monthly_Response_Times.csv`](https://github.com/ZDaly/Homework6/blob/master/FDNY_Monthly_Response_Times.csv)
    - Scripts: 
     - Data Cleaning Script: [`01_data_clean.R`](https://github.com/ZDaly/Homework6/blob/master/01_data_clean.R)
     - Table Generating Script: [`02_data_table.R`](https://github.com/ZDaly/Homework6/blob/master/02_data_table.R)
     - Plot Generating Script: [`03_data_plot.R`](https://github.com/ZDaly/Homework6/blob/master/03_data_plot.R)
    - Makefile-like script: [`Makefile.R`](https://github.com/ZDaly/Homework6/blob/master/makefile.r)
  * Now, start a fresh RStudio session, make sure the above directory is the working directory, open `Makefile.R`, and click on "Source".
  * New files you should see after running the pipeline:
    - Cleaned Data: [`fire_data_clean.tsv`](https://github.com/ZDaly/Homework6/blob/master/fire_data_clean.tsv)
    - Tables:
     - [`Boroughs with best average response times.tsv`](https://github.com/ZDaly/Homework6/blob/master/Boroughs%20with%20best%20average%20response%20times.tsv)
     - [`Boroughs with worst average response times.tsv`](https://github.com/ZDaly/Homework6/blob/master/Boroughs%20with%20worst%20average%20response%20times.tsv)
     - [`Change in average response times, by Borough and type.tsv`](https://github.com/ZDaly/Homework6/blob/master/Change%20in%20average%20response%20times%2C%20by%20Borough%20and%20type.tsv) (Note: This table was visualized using the second figure)
    - Figures:
     - [`barchart_incident_count_by_location.png`](https://github.com/ZDaly/Homework6/blob/master/barchart_incident_count_by_location.png)
     - [`sidebyside_response_time_changes_by_location.png`](https://github.com/ZDaly/Homework6/blob/master/sidebyside_response_time_changes_by_location.png)
     - [`line_chart_citywide_response_time_over_year.png`](https://github.com/ZDaly/Homework6/blob/master/line_chart_citywide_response_time_over_year.png)
     - [`line_chart_citywide_counts_over_year.png`](https://github.com/ZDaly/Homework6/blob/master/line_chart_citywide_counts_over_year.png)
     - [ `scatter_count_v_response.png`](https://github.com/ZDaly/Homework6/blob/master/scatter_count_v_response.png)


The actual figures are shown below:

![Image](https://github.com/ZDaly/Homework6/blob/master/barchart_incident_count_by_location.png?raw=true)
Several interesting pieces of information emerge from this first figure. The first is that Brooklyn has the most incidents. The second is that most of the time firefighters are not actually dealing with fires. Fortunately it also seems they have few false alarms, relative to total calls.

![Image](https://github.com/ZDaly/Homework6/blob/master/sidebyside_response_time_changes_by_location.png?raw=true)
This plot shows some rather unfortunate information: it seems that over the course of the year, all boroughs except Staten Island saw an increase in overall response times (the red bar). Furthermore, it seems that Staten Island only actually improved its responses to non Medical Emergencies, but all other incident types saw an increase in the average response time. Interestingly, in each borough the incident type with the highest increase in response time is a "false alarm" type incident. Perhaps they have found a way to de-prioritize these, while still responding to them.

![Image](https://github.com/ZDaly/Homework6/blob/master/line_chart_citywide_response_time_over_year.png?raw=true)
This plot shows the average response time for all incident types, as it varied Citywide over the year. First off we can see that structural fires consistently have the quickest response time, and non medical emergencies the slowest. This makes sense in terms of how you would expect the FDNY to prioritize. There also seems to be a spike between January and April. This makes sense with what I know from growing up in NY: This is the time of year where snow can potentially snarl up traffic, which would slow the fire engines down.

![Image](https://github.com/ZDaly/Homework6/blob/master/line_chart_citywide_counts_over_year.png?raw=true)
This plot shows the counts of different incident types as they varied Citywide over the course of a year. Interestingly the different counts are remarkably static, suggesting that there is no seasonal variation. This is counter to what I expected: for instance there are fewer BBQs during the Winter, so I expected a drop in structural fires, but this is not the case.

![Image](https://github.com/ZDaly/Homework6/blob/master/scatter_count_v_response.png?raw=true)
I wanted to visually explore whether there was a relationship between the frequency of a type of incident and its average response time. In other words, as it gets "busier and busier" do response times slow down? From this figure this does not seem to be the case. If anything, times improve. Of course a confounder here could be that boroughs that tend to have higher counts may also have lower response times due to extra practice/resources. Furthermore, as seen in the previous figure, there is little variation in counts (at least Citywide) so there may not be enough variation for me to work with.

Finally it is worth pointing out that from the tables I generated Brooklyn had the [best](https://github.com/ZDaly/Homework6/blob/master/Boroughs%20with%20best%20average%20response%20times.tsv) overall response times every month running, whereas Staten Island and Queens seemed to be in contention (with to a lesser extent The Bronx) for [worst](https://github.com/ZDaly/Homework6/blob/master/Boroughs%20with%20worst%20average%20response%20times.tsv) average response times.

This pipline was created using:
R version 2.15.3 (2013-03-01)
Platform: x86_64-w64-mingw32/x64 (64-bit)

locale:
[1] LC_COLLATE=English_Canada.1252  LC_CTYPE=English_Canada.1252    LC_MONETARY=English_Canada.1252
[4] LC_NUMERIC=C                    LC_TIME=English_Canada.1252    

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] ggplot2_0.9.3.1 plyr_1.8       

loaded via a namespace (and not attached):
 [1] colorspace_1.2-4   dichromat_2.0-0    digest_0.6.3       grid_2.15.3        gtable_0.1.2       labeling_0.2      
 [7] MASS_7.3-23        munsell_0.4.2      proto_0.3-10       RColorBrewer_1.0-5 reshape2_1.2.2     scales_0.2.3      
[13] stringr_0.6.2      tools_2.15.3      
