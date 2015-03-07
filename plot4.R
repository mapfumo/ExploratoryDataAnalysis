#### Plot 3, Project 2, Coursera - Exploratory Data Analysis
#### Date: 7 March 2015
#### Author: Antony Mapfumo

rm(list=ls())
setwd("/home/tony/ExploratoryDataAnalysis")
NEI <- readRDS("~/tmp/summarySCC_PM25.rds")
SCC <- readRDS("~/tmp/Source_Classification_Code.rds")
library(ggplot2)
library("plyr")

data<-transform(NEI,type=factor(type),year=factor(year))
combustion<-as.data.frame(SCC[grep("combustion",SCC$SCC.Level.One,ignore.case=T) & 
                                grep("coal",SCC$SCC.Level.Three,ignore.case=T),1])
names(combustion)<-"SCC"
data2<-merge(combustion,data,by="SCC")

plotdata<-ddply(data2,.(year),summarize,sum=sum(Emissions))
png("plot4.png")
gplot<-ggplot(plotdata,aes(year,sum))
gplot+geom_point(size=4)+labs(title="PM2.5 Emissions from coal combustion-related sources ",
                              y="Total PM2.5 emissions each year")
dev.off()