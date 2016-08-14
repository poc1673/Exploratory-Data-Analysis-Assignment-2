

library(plyr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(reshape2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png('plot3.png',width = 800,height = 800)


# [3] 
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of 
# these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen 
# increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

type_frame <- NEI %>% filter(fips =="24510") %>% group_by(type,year) %>% summarise(Yearly_Emissions = sum(Emissions))
g <- ggplot(data= type_frame,aes(x = year,y = Yearly_Emissions))+geom_line()+facet_grid(type~.) + theme_bw() + ggtitle("Tons of Pollutants per Year Segmented on Emission Type")
g <- xlab("Year")+ylab("Annual Emissions")
g


dev.off()
