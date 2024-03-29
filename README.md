# Coursera JHU Data Science Certificate Getting and Cleaning Data Course Project

## Overview
This project's aim was to create a tidy data set with data from Samsung Galaxy S sensor data available via the UCI data website. The assignment given was as follows:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Cleaning Script
The R script created for this project is gettingandcleaningdataproject.R. This script is on this repo and is commented. 
My script reads in the data, uses regular expression to find the mean and standard deviation features, merged the data together, adjusted variable names based on naming conviention in the course, and then writes the tidy data set out to a csv. 

## Codebook
The codebook for this project is title Codebook.md. This file contains brief explanations of each of the variables in the tidy data. 
