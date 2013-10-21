Homework 6
=========

This ReadMe file contains the information needed to run my workflow for [Homework 6](http://www.stat.ubc.ca/~jenny/STAT545A/hw06_puttingAllTogether.html).

About the data: This analysis makes use of data located [here](https://nycopendata.socrata.com/Social-Services/FDNY-Monthly-Response-Times/j34j-vqvt?). Specifically, it is an analysis of data from the FDNY. The data has 5 different variables: Two are categorical (the borough or location, type of incident) and three are numerical (a count variable for each type of incident, an average time of response, and a date).

From the original dataset:
* There are six different locations, corresponding to the 5 boroughs and a 6th "Citywide" location
* There 7 types of incidents, including one aggregrated level (as with location)
* Date is stored in an annoying format. It is coded as YYYYMM, with no separator
* The response time is really problematic. It is being read in as a factor of form mm:ss, alas it is pretty useless in this form.


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
     - [`Change in average response times, by Borough and type.tsv`](https://github.com/ZDaly/Homework6/blob/master/Change%20in%20average%20response%20times%2C%20by%20Borough%20and%20type.tsv)
    - Figures:
     - [`barchart_incident_count_by_location.png`](https://github.com/ZDaly/Homework6/blob/master/barchart_incident_count_by_location.png)
     - [`sidebyside_response_time_changes_by_location.png`](https://github.com/ZDaly/Homework6/blob/master/sidebyside_response_time_changes_by_location.png)
     - [`line_chart_citywide_response_time_over_year.png`](https://github.com/ZDaly/Homework6/blob/master/line_chart_citywide_response_time_over_year.png)


[<img src="https://github.com/ZDaly/Homework6/blob/master/barchart_incident_count_by_location.png">]

![Image](../blob/master/barchart_incident_count_by_location.png?raw=true)
