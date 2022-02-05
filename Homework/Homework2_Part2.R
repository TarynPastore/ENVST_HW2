streamH <- read.csv("/cloud/project/activtiy02/stream_gauge.csv")
# install packages 
install.packages(c("dplyr","lubridate"))
library(dplyr)
library(lubridate)
streamH <- read.csv("/cloud/project/activtiy02/site_info.csv")
siteInfo <- read.csv("/cloud/project/activtiy02/site_info.csv")
streamH <- read.csv("/cloud/project/activtiy02/stream_gauge.csv")
# prompt 1
str(streamH)
floods <- full_join(streamH, # left table
                    siteInfo, # right table
                    by="siteID") # common identifier
head(floods)
# Prompt 2
ymd_hms("2021-01-10", tz="America/New_York")
ymd_hms("2017-09-08 03:30", tz="America/New_York")
exampleDate <- c("2017,09,08, 03:30")
ymd_hms(exampleDate, tz="America/New_York")
ymd_hms(exampleDate)
floods$dateF <- ymd_hm(floods$datetime)
# Question 2
str(floods)
palmdale = floods[1:2208, ]
View(floods %>% #filter floods
  select(names, datetime, gheight.ft, major.ft) %>%
  group_by(names) %>%
  filter(gheight.ft >= major.ft))
View(floods %>% #filter floods
       select(names, datetime, gheight.ft, moderate.ft) %>%
       group_by(names) %>%
       filter(gheight.ft >= flood.ft))
View(floods %>% #filter floods
       select(names, datetime, gheight.ft, flood.ft) %>%
       group_by(names) %>%
       filter(gheight.ft >= flood.ft))
View(floods %>% #filter floods
       select(names, datetime, gheight.ft, action.ft) %>%
       group_by(names) %>%
       filter(gheight.ft >= action.ft))
# Question 3
max(palmdale$gheight.ft)
View(floods %>% #filter floods
       select(names, datetime, gheight.ft) %>%
       group_by(names) %>%
       filter(max(gheight.ft)))
View(floods %>% #filter floods
       group_by(names) %>%
       mutate(maxht = max(gheight.ft)) %>%
       mutate(diff = maxht - major.ft))
mutate(exeedance = maxht-major.ft)
floods$maxht = max(gheight.ft)
