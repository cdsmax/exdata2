dataSummary <- readRDS('exdata_data_NEI_data/summarySCC_PM25.rds')
dataClassCode <- readRDS('exdata_data_NEI_data/Source_Classification_Code.rds')

sub <- subset(dataSummary, dataSummary$fips == '24510')

totalByYear <- aggregate(sub[, 'Emissions'], by=list(sub$year, sub$type), FUN = sum)
colnames(totalByYear) <- c('year', 'type', 'PM')

# plot 
png(filename='plot3.png', width = 480, height = 480)
ggplot(data = totalByYear, aes(x = year, y = log(PM), color=type)) + geom_line() + ylab('Log of emissions') + xlab('Year') + ggtitle('Emissions by type in Baltimore City')
dev.off()

# "point" emissions increased slightly, all other emissions decreased