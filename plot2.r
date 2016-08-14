

library(plyr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(reshape2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png('plot2.png',width = 800,height = 800)


# [2]
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

baltiframe <- NEI %>% filter(fips =="24510") %>% group_by(year)%>% summarise(Yearly_Emissions = sum(Emissions))
plot(baltiframe$year,baltiframe$Yearly_Emissions,type = "l",xlab = "Year",ylab="Tons of  PM2.5", main = "Tons of Pollutants Each Year in Baltimore")




dev.off()