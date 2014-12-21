dataSummary <- readRDS('exdata_data_NEI_data/summarySCC_PM25.rds')
dataClassCode <- readRDS('exdata_data_NEI_data/Source_Classification_Code.rds')

# merge the 2 sets on SCC
big <- merge(x = dataSummary, y=dataClassCode, by = 'SCC')

# get the coal data
sub <- big[grepl('coal', big$Short.Name, ignore.case=TRUE), ]

# create aggregate count per year
totalByYear <- aggregate(sub[, 'Emissions'], by=list(sub$year), FUN = sum)
colnames(totalByYear) <- c('year', 'PM')

png(filename='plot4.png', width = 480, height = 480)

plot(
  totalByYear$year, 
  totalByYear$PM, 
  type = 'l', 
  ylab = 'Total Coal Emissions (tons)',
  xlab = 'Year',
  main = 'USA: Total Annual Coal Emissions (tons) from 1999 to 2008'
)

dev.off()
