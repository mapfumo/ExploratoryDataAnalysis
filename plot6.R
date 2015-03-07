#### Plot 6, Project 2, Coursera - Exploratory Data Analysis
#### Date: 7 March 2015
#### Author: Antony Mapfumo

rm(list=ls())
setwd("/home/tony/ExploratoryDataAnalysis")
NEI <- readRDS("~/tmp/summarySCC_PM25.rds")
SCC <- readRDS("~/tmp/Source_Classification_Code.rds")

library("plyr")
library("ggplot2")

data<-transform(NEI,type=factor(type),year=factor(year))
twocity<-data[data$fips=="24510"|data$fips=="06037",]
vehicles<-as.data.frame(SCC[grep("vehicles",SCC$SCC.Level.Two,ignore.case=T),1])
names(vehicles)<-"SCC"
data2<-merge(vehicles,twocity,by="SCC")
data2$city[data2$fips=="24510"]<-"Baltimore"
data2$city[data2$fips=="06037"]<-"LA"

#Plot the data
plotdata<-ddply(data2,.(year,city),summarize,sum=sum(Emissions))
png("plot6.png")
gplot<-ggplot(plotdata,aes(year,sum))
gplot+geom_point(aes(color=city),size=4)+labs(title="PM2.5 Emission from motor vehicle sources",
                                              y="total PM2.5 emission each year")
dev.off()