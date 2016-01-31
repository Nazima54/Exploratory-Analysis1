## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.


library(datasets)
data(airquality)

if(!file.exists("exdata%2Fdata%2FNEI_data.zip")) {
  temp <- tempfile()
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",temp)
  file <- unzip(temp)
  unlink(temp)
}
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## Baltimore City, Maryland (fips == "24510")
BaltimoreNEI <- NEI[NEI$fips == "24510",]
aggBaltimore <- aggregate(Emissions ~ year,BaltimoreNEI, sum)
barplot(
  aggBaltimore$Emissions, names.arg=aggBaltimore$year,xlab="Year", ylab="PM2.5 Emissions(tons)",
  main="Total PM2.5 Emissions From All Baltimore City Sources")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
cat("plot2.png has been saved in", getwd())