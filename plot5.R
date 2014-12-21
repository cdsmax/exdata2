dataSummary <- readRDS('exdata_data_NEI_data/summarySCC_PM25.rds')
dataClassCode <- readRDS('exdata_data_NEI_data/Source_Classification_Code.rds')

# baltimore only data
sub <- subset(dataSummary, dataSummary$fips == '24510' & type == 'ON-ROAD')

# create aggregate count per year
totalByYear <- aggregate(sub[, 'Emissions'], by=list(sub$year), FUN = sum)
colnames(totalByYear) <- c('year', 'PM')

png(filename='plot5.png', width = 480, height = 480)

plot(
  totalByYear$year, 
  totalByYear$PM, 
  type = 'l', 
  ylab = 'Total Emissions (tons)',
  xlab = 'Year',
  main = 'Baltimore City: Total Annual Motor Vehicle Emissions (tons) from 1999 to 2008'
)

dev.off()