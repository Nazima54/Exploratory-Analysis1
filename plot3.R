## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.


library(ggplot2)
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

##ggplot(mpg, aes(hwy, cty)) + geom_point(aes(color = cyl)) + geom_smooth(method ="lm") + coord_cartesian() + scale_color_gradient() + theme_bw()
ggplot3 <- ggplot(BaltimoreNEI,aes(factor(year),Emissions,fill=type)) + 
  geom_bar(stat = "identity") + theme_bw() + facet_grid(.~type,scales = "free",space="free") + labs(x="year", y = expression("Total PM"[2.5]*" Emission (Tons)")) + labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))
print(ggplot3)

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
cat("plot3.png has been saved in", getwd())
## save plot3.png
##ggsave("plot3.png", width = 5, height = 5)
