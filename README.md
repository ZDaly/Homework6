Homework 6
=========

This ReadMe file contains the information needed to run my workflow for [Homework 6](http://www.stat.ubc.ca/~jenny/STAT545A/hw06_puttingAllTogether.html).

About the data: This analysis makes use of data located [here](https://nycopendata.socrata.com/Social-Services/FDNY-Monthly-Response-Times/j34j-vqvt?). The data looks at the average response times to various types of calls across the city over the course of a year, running from July 2009to June 2010. The data has 5 different variables: Two are categorical (the borough or location, and type of incident) and three are numerical (a count variable for each type of incident, an average time of response for that type of incident in that location in that month, and a date recording the month).

This data is public and was created by the Fire Department of New York City on August 29th, 2011. It was updated June 23rd, 2013.

From the original dataset:
* There are six different locations, corresponding to the 5 boroughs and a 6th "Citywide" location
* There 7 types of incidents, including one aggregrated level (as with location)
* Date is stored in an annoying format. It is coded as YYYYMM, with no separator
* The response time is really problematic. It is being read in as a factor of strings of the form mm:ss. ALas in this form it is pretty useless.


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


The actual figures are shown below:

![Image](https://github.com/ZDaly/Homework6/blob/master/barchart_incident_count_by_location.png?raw=true)
Several interesting pieces of information emerge from this first figure. The first is that Brooklyn has the most incidents. The second is that most of the time firefighters are not actually dealing with fires. Fortunately it also seems they have few false alarms, relative to total calls.

![Image](https://github.com/ZDaly/Homework6/blob/master/sidebyside_response_time_changes_by_location.png?raw=true)
This plot shows some rather unfortunate information: it seems that over the course of the year, all boroughs except Staten Island saw an increase in overall response times (the red bar). Furthermore, it seems that Staten Island only actually improved its responses to non Medical Emergencies, but all other incident types saw an increase in the average response time. Interestingly, in each borough the incident type with the highest increase in response time is a "false alarm" type incident. Perhaps they have found a way to de-prioritize these, while still responding to them.

![Image](https://github.com/ZDaly/Homework6/blob/master/line_chart_citywide_response_time_over_year.png?raw=true)
This plot shows the average response time for all incident types, as it varied Citywide over the year. First off we can see that structural fires consistently have the quickest response time, and non medical emergencies the slowest. This makes sense in terms of how you would expect the FDNY to prioritize. There also seems to be a spike between January and April. This makes sense with what I know from growing up in NY: This is the time of year where snow can potentially snarl up traffic, which would slow the fire engines down.

Finally it is worth pointing out that from the tables I generated (links above) Brooklyn had the best overall response times every month running, whereas Staten Island and Queens seemed to be in contention (with to a lesser extent The Bronx) for worst average response times.
