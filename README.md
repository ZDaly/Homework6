Homework6
=========

This ReadMe file contains the information needed to run a "toy" workflow for [Homework 6](http://www.stat.ubc.ca/~jenny/STAT545A/hw06_puttingAllTogether.html).

How to replicate my analysis

  * Download into an empty directory:
    - Input data: [`FDNY_Monthly_Response_Times.csv`](https://github.com/ZDaly/Homework6/blob/master/FDNY_Monthly_Response_Times.csv)
    - Scripts: 
     - [01_data_clean.R](https://github.com/ZDaly/Homework6/blob/master/01_data_clean.R)
     - [02_data_table.R](https://github.com/ZDaly/Homework6/blob/master/02_data_table.R)
     - [03_data_plot.R](https://github.com/ZDaly/Homework6/blob/master/03_data_plot.R)
    - Makefile-like script: [`Makefile.R`]
  * Start a fresh RStudio session, make sure the above directory is the working directory, open `Makefile.R`, and click on "Source".
  * New files you should see after running the pipeline:
    - Tables:
