dataSummary <- readRDS('exdata_data_NEI_data/summarySCC_PM25.rds')
dataClassCode <- readRDS('exdata_data_NEI_data/Source_Classification_Code.rds')

totalByYear <- aggregate(dataSummary[, 'Emissions'], by=list(dataSummary$year), FUN = sum)
colnames(totalByYear) <- c('year', 'PM')

png(filename='plot1.png', width = 480, height = 480)

plot(
  totalByYear$year, 
  totalByYear$PM, 
  type = 'l', 
  ylab = 'Total Emissions (tons)',
  xlab = 'Year',
  main = 'USA: Total Annual Emissions (tons) from 1999 to 2008'
)

dev.off()

