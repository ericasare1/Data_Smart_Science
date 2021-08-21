
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
xlxtocsv <- write_csv(sheet1data, "data/csvdata.csv")

# ----------------------------------------------------------------- #
#---- #3. working with spatial data ----
# ----------------------------------------------------------------- #
#1a.  Install package and activate it
install.packages("sf")
library("sf")

#loading shapefile
sf_shp <- sf::st_read("data/worldshp/World_Countries.shp") 

#sf_shp comes as a data frame so can perform any data wrandling activies on it

shpsaved <- sf::write_sf(sf_shp, "data/savedshp/savedfile.shp" )
