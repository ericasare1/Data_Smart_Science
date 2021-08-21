
# ################################################################# #
####                     Importing and Saving Data                             ####
# ################################################################# #

# ----------------------------------------------------------------- #
#---- #1. CSV data: we will use the read_csv function in tidyverse package ----
# ----------------------------------------------------------------- #
#1a.  Install package and activate it
install.packages("tidyverse")
library("tidyverse")

#import csv data
csv_data <- read_csv("data/csvdata.csv")
?read.csv
glimpse(csv_data)
nrow(csv_data)
colnames(csv_data)

#save data
write_csv(csv_data, "data/savedcsv.csv")

# ----------------------------------------------------------------- #
#---- #2. Excel data: we will use the read_excel function in readxl package ----
# ----------------------------------------------------------------- #
#1a.  Install package and activate it
install.packages("readxl")
library(readxl)

?readxl  #read more about package

xl_data = "data/xlsxdata.xlsx"
sheet1data = read_excel(path = xl_data, sheet = "data1")
print(sheet1data)
xlxtocsv <- write_csv(sheet1data, "data/csvdata.csv")

# ----------------------------------------------------------------- #
#---- #3. working with spatial data ----
# ----------------------------------------------------------------- #
#1a.  Install package and activate it
install.packages("sf")
library("sf")

#loading shapefile
sf_shp <- sf::st_read("data/worldshp/World_Countries.shp")
print(sf_shp)

#sf_shp comes as a data frame so can perform any data wrandling activies on it
install.packages("ggplot2")
library("ggplot2")

ggplot() + 
  geom_sf(data = sf_shp) + 
  ggtitle("AOI Boundary Plot") + 
  coord_sf()

#save shp filel
shpsaved <- sf::write_sf(sf_shp, "data/savedshp/savedfile.shp" )
