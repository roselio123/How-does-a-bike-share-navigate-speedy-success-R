# code to process data
# install the required packages
install.packages("tidyverse")
install.packages("lubridate")
install.packages("janitor")
install.packages("readxl")
install.packages("writexl")

# charge the packages                
library(tidyverse)
library(lubridate)
library(janitor)
library("readxl")
library("writexl")

# set the work directory
setwd("C:/Users/rmoca/OneDrive/Escritorio/Case_April_2024")

# import data to data frame
df1 <- read_xlsx("C:/Users/rmoca/OneDrive/Escritorio/Case_April_2024/cleaned_data/2023_03-divvy-tripdata.xlsx")
df2 <- read_xlsx("C:/Users/rmoca/OneDrive/Escritorio/Case_April_2024/cleaned_data/2023_04-divvy-tripdata.xlsx")
df3 <- read_xlsx("C:/Users/rmoca/OneDrive/Escritorio/Case_April_2024/cleaned_data/2023_05-divvy-tripdata.xlsx")
df4 <- read_xlsx("C:/Users/rmoca/OneDrive/Escritorio/Case_April_2024/cleaned_data/2023_06-divvy-tripdata.xlsx")
df5 <- read_xlsx("C:/Users/rmoca/OneDrive/Escritorio/Case_April_2024/cleaned_data/2023_07-divvy-tripdata.xlsx")
df6 <- read_xlsx("C:/Users/rmoca/OneDrive/Escritorio/Case_April_2024/cleaned_data/2023_08-divvy-tripdata.xlsx")
df7 <- read_xlsx("C:/Users/rmoca/OneDrive/Escritorio/Case_April_2024/cleaned_data/2023_09-divvy-tripdata.xlsx")
df8 <- read_xlsx("C:/Users/rmoca/OneDrive/Escritorio/Case_April_2024/cleaned_data/2023_10-divvy-tripdata.xlsx")
df9 <- read_xlsx("C:/Users/rmoca/OneDrive/Escritorio/Case_April_2024/cleaned_data/2023_11-divvy-tripdata.xlsx")
df10 <- read_xlsx("C:/Users/rmoca/OneDrive/Escritorio/Case_April_2024/cleaned_data/2023_12-divvy-tripdata.xlsx")
df11 <- read_xlsx("C:/Users/rmoca/OneDrive/Escritorio/Case_April_2024/cleaned_data/2024_01-divvy-tripdata.xlsx")
df12 <- read_xlsx("C:/Users/rmoca/OneDrive/Escritorio/Case_April_2024/cleaned_data/2024_02-divvy-tripdata.xlsx")

#merge data into a single data frame
cyclistsrides <- rbind(df1,df2,df3,df4,df5,df6,df7,df8,df9,df10,df11,df12)

# see the dimentions of the new data frame
dim(cyclistsrides)

# check if there is NA values in each relevant column 
colSums(is.na(cyclistsrides[,c("ride_id", "rideable_type", "started_at", "ended_at", "member_casual","ride_length","day_of_week")]))

# clear NA values
cyclistsrides<-cyclistsrides[!(is.na(cyclistsrides$ride_length)), ]

# verify if there is NA values in each relevant column after cleaning
colSums(is.na(cyclistsrides[,c("ride_id", "rideable_type", "started_at", "ended_at", "member_casual","ride_length","day_of_week")]))

# check for duplicates
any(duplicated(cyclistsrides[,c("ride_id", "started_at", "ended_at")]))

# see the dimensions of the new data frame
dim(cyclistsrides)

# check the structure of the new data frame
str(cyclistsrides)

# calculate average ride length
mean(cyclistsrides$ride_length)

# calculate the maximum ride length
max(cyclistsrides$ride_length)  

# calculate the minimum ride length
min(cyclistsrides$ride_length)  

# save the data frame
write.csv(cyclistsrides, "2023_03-2024_02.csv")    
