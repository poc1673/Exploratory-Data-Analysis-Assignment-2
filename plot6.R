

library(plyr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(reshape2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png('plot6.png',width = 800,height = 800)


# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, 
# California (fips == "06037").  Which city has seen greater changes over time in motor vehicle emissions?
onroad_list <-NEI %>% filter(fips =="24510")%>% filter(type =="ON-ROAD") %>% group_by(year)%>% summarise(Yearly_Emissions = sum(Emissions))

onroadlist_baltimore <- onroad_list%>% mutate(city = "Baltimore")
onroad_list_LA <-NEI %>% filter(fips =="06037")%>% filter(type =="ON-ROAD") %>% group_by(year)%>% summarise(Yearly_Emissions = sum(Emissions)) %>% mutate(city = "LA")
onroad_compare <-rbind(onroadlist_baltimore,onroad_list_LA)
onroad_compare_melted <- melt(onroad_compare,id="year")

plot6 <- ggplot(data=onroad_compare,aes(x=year, y= Yearly_Emissions,group=city ,color = city))+geom_line()+xlab("Year")+ylab("Motor Vehicle Emissions")
plot6 + ggtitle("Motor Vehicle Emissions Comparison in Baltimore and LA") + theme_bw()

dev.off()