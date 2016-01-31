## How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
library(ggplot2)
library(datasets)

if(!file.exists("exdata%2Fdata%2FNEI_data.zip")) {
  temp <- tempfile()
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",temp)
  file <- unzip(temp)
  unlink(temp)
}
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(SCC$SCC)


## Subset the motor vehicle id
mvehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[mvehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

## Baltimore City, Maryland (fips == "24510")
BaltimoreNEI <- vehiclesNEI[vehiclesNEI$fips == "24510",]

ggplot5 <- ggplot(BaltimoreNEI,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="blue",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" emissions from motor vehicle sources changed from 1999-2008 in Baltimore City"))

print(ggplot5)


dev.copy(png, file="plot5.png", width=480, height=480)
dev.off()
cat("plot5.png has been saved in", getwd())
## save plot5.png
##ggsave("plot5.png", width = 5, height = 5)
