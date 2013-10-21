Homework 6
=========

This ReadMe file contains the information needed to run my workflow for [Homework 6](http://www.stat.ubc.ca/~jenny/STAT545A/hw06_puttingAllTogether.html).

How to replicate my analysis:

  * Download into an empty directory:
    - Input data: [`FDNY_Monthly_Response_Times.csv`](https://github.com/ZDaly/Homework6/blob/master/FDNY_Monthly_Response_Times.csv)
    - Scripts: 
     - Data Cleaning Script: [`01_data_clean.R`](https://github.com/ZDaly/Homework6/blob/master/01_data_clean.R)
     - Table Generating Script: [`02_data_table.R`](https://github.com/ZDaly/Homework6/blob/master/02_data_table.R)
     - Plot Generating Script: [`03_data_plot.R`](https://github.com/ZDaly/Homework6/blob/master/03_data_plot.R)
    - Makefile-like script: [`Makefile.R`](https://github.com/ZDaly/Homework6/blob/master/makefile.r)
  * Start a fresh RStudio session, make sure the above directory is the working directory, open `Makefile.R`, and click on "Source".
  * New files you should see after running the pipeline:
    - Clean Data: [`fire_data_clean.tsv`](https://github.com/ZDaly/Homework6/blob/master/fire_data_clean.tsv)
    - Tables:
     - [`Boroughs with best average response times.tsv`](https://github.com/ZDaly/Homework6/blob/master/Boroughs%20with%20best%20average%20response%20times.tsv)
     - [`Boroughs with worst average response times.tsv`](https://github.com/ZDaly/Homework6/blob/master/Boroughs%20with%20worst%20average%20response%20times.tsv)
     - [`Change in average response times, by Borough and type.tsv`](https://github.com/ZDaly/Homework6/blob/master/Change%20in%20average%20response%20times%2C%20by%20Borough%20and%20type.tsv)
    - Figures:
     - [`barchart_incident_count_by_location.png`](https://github.com/ZDaly/Homework6/blob/master/barchart_incident_count_by_location.png)
     - [`sidebyside_response_time_changes_by_location.png`](https://github.com/ZDaly/Homework6/blob/master/sidebyside_response_time_changes_by_location.png)
     - [`line_chart_citywide_response_time_over_year.png`](https://github.com/ZDaly/Homework6/blob/master/line_chart_citywide_response_time_over_year.png)
