## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

library(datasets)
data(airquality)

if(!file.exists("exdata%2Fdata%2FNEI_data.zip")) {
   temp <- tempfile()
   download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",temp)
   file <- unzip(temp)
   unlink(temp)
 }
NEI <- readRDS("summarySCC_PM25.rds")
str(NEI)
SCC <- readRDS("Source_Classification_Code.rds")
str(SCC)
aggYear <- aggregate(Emissions ~ year,NEI, sum)
str(aggYear)
  barplot(
    (aggYear$Emissions)/10^6, names.arg=aggYear$year,xlab="Year", ylab="PM2.5 Emissions (10^6 Tons)",
    main="Total PM2.5 Emissions From All US Sources")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
cat("plot1.png has been saved in", getwd())
  



