

library(plyr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(reshape2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png('plot5a.png',width = 800,height = 800)





# [5]  
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# !!!  I am going to go about this two ways.  For the first graph (plot5a.png), I will take a list of all mobile sources from
# the SCC data frame and use that as the criteria to build the graph.

# For plot5b.png, I will just specify the data subset by the type="ON-ROAD" argument in NEI.  
mobile_list <-  SCC$SCC[grep(SCC$SCC.Level.One ,pattern= "Mobile Sources")]
mobile_frame <-NEI %>% filter(fips =="24510")%>% filter(SCC %in% mobile_list) %>% group_by(year)%>% summarise(Yearly_Emissions = sum(Emissions))
plot5a <- ggplot(data = mobile_frame, aes(x= year,y= Yearly_Emissions)) + geom_line()+ggtitle("Emissions from Mobile Sources in Baltimore")
plot5a
dev.off()

png('plot5b.png',width = 800,height = 800)

onroad_list <-NEI %>% filter(fips =="24510")%>% filter(type =="ON-ROAD") %>% group_by(year)%>% summarise(Yearly_Emissions = sum(Emissions))
plot5b <- ggplot(data = onroad_list, aes(x= year,y= Yearly_Emissions)) + geom_line()
plot5b <-plot5b  +xlab("Year")+ylab("Motor Vehicle Emissions") + ggtitle("Motor Vehicle Emissions in Baltimore")
plot5b

dev.off()
