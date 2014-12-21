dataSummary <- readRDS('exdata_data_NEI_data/summarySCC_PM25.rds')
dataClassCode <- readRDS('exdata_data_NEI_data/Source_Classification_Code.rds')

# baltimore
baltimore <- subset(dataSummary, dataSummary$fips == '24510' & type == 'ON-ROAD')
totalBaltimore <- aggregate(baltimore[, 'Emissions'], by=list(baltimore$year), FUN = sum)
colnames(totalBaltimore) <- c('year', 'PM')

# la
la <- subset(dataSummary, dataSummary$fips == '06037' & type == 'ON-ROAD')
totalLA <- aggregate(la[, 'Emissions'], by=list(la$year), FUN = sum)
colnames(totalLA) <- c('year', 'PM')

png(filename='plot6.png', width = 480, height = 480)

par(
  mfrow = c(1,2), 
  mar = c(4,4,2,1), 
  oma = c(0,0,2,0)
)

plot(
  totalBaltimore$year, 
  totalBaltimore$PM, 
  type = 'l', 
  ylab = 'Total Emissions (tons)',
  xlab = 'Year',
  main = 'Baltimore City Motor Vehicle Pollution'
)

plot(
  totalLA$year, 
  totalLA$PM, 
  type = 'l', 
  ylab = 'Total Emissions (tons)',
  xlab = 'Year',
  main = 'LA County Motor Vehicle Pollution'
)

dev.off()

# which city had greater change in emissions from start till end of recorded data
# calculate percentage change
changeBaltimore <- round((totalBaltimore[totalBaltimore$year == 2008, 2] - totalBaltimore[totalBaltimore$year == 1999, 2]) / totalBaltimore[totalBaltimore$year == 1999, 2] * 100)
changeLA <- round((totalLA[totalLA$year == 2008, 2] - totalLA[totalLA$year == 1999, 2]) / totalLA[totalLA$year == 1999, 2] * 100)

# from 1999 to 2008, Baltimore had 75% reduction in emissions, while LA County emissions have increased 4%
