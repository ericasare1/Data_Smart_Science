


rm(list=ls(all=TRUE))

# _____________________________ Putting all together __________________#
install.packages("tidyverse")
library("tidyverse")
# _____________________________ Working with dplyr verbs __________________#

#we are going to work with the "starwars"data already in dplyr package

# Lets know our data
glimpse(starwars)

# _____________________________ Select verb ____________________________________________________#
# Select is used to subselect one or more columns

#2a) from  starwars produce a dataset that contains variables height1, ht_sq, sex, sex_binary, 

selected_information <- starwars %>%            #my data  original
  select(height, sex) %>%                     # select sex, height
  rename(height1 = height) %>%   #sort height in descending order
  mutate(
    height_sq = height1^2,
    sex_binary = ifelse(sex == "male", 1, 0)
    ) %>%
  group_by(sex) %>%
  summarise(standardDev = sd(height_sq, na.rm = TRUE)) %>%
  write.csv("data/hopeToworks.csv")   # the data is saved




