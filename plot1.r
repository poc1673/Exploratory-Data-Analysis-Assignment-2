

library(plyr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(reshape2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# [1]
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

# Create a data frame containing the total amount of Emissions in a particular year:
png('plot1.png',width = 800,height = 800)
plot1_frame <- NEI %>% group_by(year) %>% summarize( Yearly_Emissions = sum(Emissions)  )
selected_years <- c("1999","2002","2005","2008")
plot(plot1_frame$year,plot1_frame$Yearly_Emissions,type = "l",xlab = "Year",ylab="Tons of  PM2.5", main = "Tons of Pollutants Each Year")

dev.off()