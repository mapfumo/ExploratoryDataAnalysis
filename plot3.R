#### Plot 3, Project 2, Coursera - Exploratory Data Analysis
#### Date: 7 March 2015
#### Author: Antony Mapfumo

setwd("/home/tony/ExploratoryDataAnalysis")
NEI <- readRDS("~/tmp/summarySCC_PM25.rds")
SCC <- readRDS("~/tmp/Source_Classification_Code.rds")
library(ggplot2)
library("plyr")

data<-transform(NEI,year=factor(year))
data2<-data[data$fips=="24510",]

#Plot Data
plotdata3<-ddply(data2,.(year,type),summarize,sum=sum(Emissions))
png("plot3.png")
gplot<-ggplot(plotdata3,aes(year,sum))
gplot+geom_point()+facet_grid(.~type)+labs(title="PM2.5 Emission in Baltimore city",
                                           y="total PM2.5 emission each year")
dev.off()