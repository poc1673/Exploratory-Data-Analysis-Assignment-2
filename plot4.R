

library(plyr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(reshape2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png('plot4.png',width = 800,height = 800)



# [4]
# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

coal_list <- SCC$SCC[grep(SCC$SCC.Level.Four ,pattern= "Coal")]
coal_frame <- NEI %>%filter(SCC %in% coal_list) %>% group_by(year) %>%summarise(Yearly_Emissions = sum(Emissions))

coal_plot <- ggplot(data = coal_frame ,aes(x = year, y = Yearly_Emissions)) + geom_line() + ggtitle("Tons of Pollutants from Coal Combution") + xlab("Year")+ylab("Annual Emissions")
coal_plot




dev.off()