#### Plot 3, Project 2, Coursera - Exploratory Data Analysis
#### Date: 7 March 2015
#### Author: Antony Mapfumo

rm(list=ls())
setwd("/home/tony/ExploratoryDataAnalysis")
NEI <- readRDS("~/tmp/summarySCC_PM25.rds")
SCC <- readRDS("~/tmp/Source_Classification_Code.rds")

# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
# Get Baltimore emissions from motor vehicle sources
bmore.emissions <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
bmore.emissions.aggr <- aggregate(Emissions ~ year, data=bmore.emissions, FUN=sum)

# plot
library(ggplot2)
png("plot5.png")
ggplot(bmore.emissions.aggr, aes(x=factor(year), y=Emissions)) +
  geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emissions")) +
  ggtitle("Emissions from motor vehicle sources in Baltimore City")
dev.off()