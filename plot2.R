dataSummary <- readRDS('exdata_data_NEI_data/summarySCC_PM25.rds')
dataClassCode <- readRDS('exdata_data_NEI_data/Source_Classification_Code.rds')

sub <- subset(dataSummary, dataSummary$fips == '24510')

totalByYear <- aggregate(sub[, 'Emissions'], by=list(sub$year), FUN = sum)
colnames(totalByYear) <- c('year', 'PM')

png(filename='plot2.png', width = 480, height = 480)

plot(
  totalByYear$year, 
  totalByYear$PM, 
  type = 'l', 
  ylab = 'Total Emissions (tons)',
  xlab = 'Year',
  main = 'Baltimore City: Total Annual Emissions (tons) from 1999 to 2008'
)

dev.off()
