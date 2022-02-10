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

rm("Range_floods", "Range_floods2", "Floods_Range", "palmdale")
rm("floods_maxht")


# Question 1
plot(Fisheating_Creek$dateF, Fisheating_Creek$gheight.ft, type="b", pch=19, xlab="Date",
     ylab = "Stage height (ft)", main = "Fisheating Creek Gauge Height during Hurricane Erma")
plot(Santa_Fe$dateF, Santa_Fe$gheight.ft, type="b", pch=19, xlab="Date",
     ylab = "Stage height (ft)", main = "Santa Fe River Gauge Height during Hurricane Erma")
Peace = floods[2209:4265, ]
Withlacoochee = floods[6474:8681,]
plot(Peace$dateF, Peace$gheight.ft, type="b", pch=19, xlab="Date",
     ylab = "Stage height (ft)", main = "Peace River Gauge Height during Hurricane Erma")
plot(Withlacoochee$dateF, Withlacoochee$gheight.ft, type="b", pch=19, xlab="Date",
     ylab = "Stage height (ft)", main = "Withlacoochee River Gauge Height during Hurricane Erma")


# Question 2
str(floods)
palmdale = floods[1:2208, ]
View(floods_major <- floods %>% #filter floods
  select(names, datetime, gheight.ft, major.ft) %>%
  group_by(names) %>%
  filter(gheight.ft >= major.ft))
View(floods_moderate <- floods %>% #filter floods
       select(names, datetime, gheight.ft, moderate.ft) %>%
       group_by(names) %>%
       filter(gheight.ft >= moderate.ft))
View(floods_flood <- floods %>% #filter floods
       select(names, datetime, gheight.ft, flood.ft) %>%
       group_by(names) %>%
       filter(gheight.ft >= flood.ft))
View(floods_action <- floods %>% #filter floods
       select(names, datetime, gheight.ft, action.ft) %>%
       group_by(names) %>%
       filter(gheight.ft >= action.ft))



# Question 3
max(palmdale$gheight.ft)
View(floods %>% #filter floods
       select(names, datetime, gheight.ft) %>%
       group_by(names) %>%
       filter(max(gheight.ft)))
View(floods_diff <- floods %>% #filter floods
       group_by(names) %>%
       mutate(maxht = max(gheight.ft)) %>%
       mutate(diff = maxht - major.ft))
mutate(exeedance = maxht-major.ft)
floods$maxht = max(gheight.ft)



# Homework part 1
View(Floods_Range <- floods %>% #filter floods
       group_by(names) %>%
       mutate(rang_e = max(gheight.ft) - min(gheight.ft)))
View(Floods_Range %>% #filter floods
       select(names, rang_e) %>%
       group_by(names))
View(Range_floods <- floods %>% #filter floods
       select(siteID, gheight.ft) %>%
       group_by(siteID) %>%
       summarize(ran_ge = max(gheight.ft) - min(gheight.ft)))

Range_floods2 <-  Range_floods[-c(2, 3),]

hist(x = Range_floods2$siteID, y = Range_floods2$ran_ge) 

(hist(as.factor(x = Range_floods2$siteID, y = Range_floods2$ran_ge)))
help(hist)
hist(palmdale$gheight.ft)     
Santa_Fe = floods[4266:6473, ]
hist(Santa_Fe$gheight.ft, main = "Santa Fe River Water Height", 
     xlab = "height(ft)", col = "hot pink", border = "purple")
Fisheating_Creek = floods[1:2208,]     
hist(Fisheating_Creek$gheight.ft, main = "Fisheating Creek Water Height", xlab = "Water height (ft)", col = "cyan", border = "magenta")     

Santa.Fe.River <- floods[4266:6473,]

hist(Santa.Fe.River$gheight.ft, main = "Santa Fe River", 
xlab = "Height (ft)",
col = "tomato2",
border = "blue")

