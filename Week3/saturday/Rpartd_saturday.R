

rm(list=ls(all=TRUE))  # clear memory

# _____________________________ Install and Activate Tidyverse __________________#
install.packages("tidyverse")
library("tidyverse")

#or you can install the dplyr package in tidyverse: install.packages("dplyr")
# ______________________________________________________________ __________________#


# _____________________________ Working with dplyr verbs __________________#

#we are going to work with the "starwars" data already in dplyr package

# Lets know our data
glimpse(starwars)    
colnames(starwars)
view(starwars)
head(starwars, n=5) # first 5 rows


# _____________________________ Pipes ____________________________________________________#
#pipes like two or more data cleaning activities together

#1a). Lets learn piping (%>%): lets understand our data with the help of pipe and glimpse function

starwars %>%   # this is  my dataset
  glimpse()    # this is a function to let me understand my dataset

#1b. We can assign what we did in 1a to a name, say know_me_well

know_me_well <- starwars %>%  
  glimpse()


# _____________________________ Select verb ____________________________________________________#
# Select is used to subselect one or more columns

#2a)

selecteddata <- starwars %>%                                                # this my  data
  select(name, height, mass, hair_color, skin_color, birth_year, sex) %>%   #first: select columns
  View()   #the view will the data but will not be stored in memory                                                                

#the data without the view function willbe stored in memory for future use
selecteddata_2 <- starwars %>%  
    select(mass, hair_color, skin_color, birth_year, sex) 

#2b.
selecteddata <- starwars %>%  
  select(name:sex) %>%        #you can also use this format to select the variables as in 2a
  View()

# _____________________________ Filter verb ____________________________________________________#
# It is used to filter our rows

#3a). filter based on the sex column

filtereddata <- starwars %>%  
  filter(sex == "male")

view(filtereddata)


#2b. filter based on two columns: sex == male and height >= 174
filtereddata2 <- starwars %>%  
  filter(sex == "males" & height >= 174)

# _____________________________ Arrange verb ____________________________________________________#
# It is sort values in one or  more columns


#3b. Sort in ascending order
sorteddata <- starwars %>%  
  arrange(height) %>%   #sort height in descending order
  View()

#3a). Sort in descending order
sorteddata <- starwars %>%  
  arrange(desc(height)) %>%   #sort height in descending order
  View()

# _____________________________ Rename verb ____________________________________________________#
# Rename  columns

#4)
renamedcolumns <- starwars %>%  
  rename(
    new_height = height,
    gender1 = sex,
    sex2 = gender) %>%  
  view()

# _____________________________ Mutate verb ____________________________________________________#
# add new columns to dataframe based on existing columns

#5)
#a)add new column:height_sq
#b) use the ifelse function to create a binary variable based on sex column: if sex is male ==1, otherwise 0

renamedcolumns <- starwars %>%  
  mutate(
    height_sq = height^2,                         #I am creating h_sq from height
    log_ht = log(height), 
    sex_binary = ifelse(sex == "male", 1, 0)) 

# _____________________________ group_by verb and summarise____________________________________________________#
# add new columns to dataframe based on existing columns

#5)
#a)add new column:height_sq
#b) use the ifelse function to create a binary variable based on sex column: if sex is male ==1, otherwise 0

# looking at the distinct values
starwars %>%
  distinct(sex)

# counting unique values
starwars %>%
  summarise(n = n_distinct(sex))

# counting missing values
starwars %>%
  summarise(count = sum(is.na(height)))

#count the missing values of height per each distict group in sex
starwars %>%  
  group_by(sex) %>%   # b
  summarise(count = sum(is.na(height))) %>%
  view()

# find the mean of height for each distinct group in sex
groupby_anal <- starwars %>%  
  group_by(sex) %>%   # b
  summarise(mean_height = mean(height)) %>%
  view()

#NA values will not allow the mean to work. The na.rm = TRUE is used to remove all NA values
groupby_anal2 <- starwars %>%  
  group_by(sex) %>%   # b
  summarise(mean_height = mean(height, na.rm = TRUE)) %>%
  view()


#More stuff:

"starwars %>%  
  summarise(count = sum(is.na(height))) %>%
  view()
# counting unique, missing, and median values
starwars %>% summarise(n = n_distinct(height),
                       na = sum(is.na(height)),
                       med = median(height, na.rm = TRUE))  

starwars %>% 
  group_by(sex) %>%
  summarise(n = n_distinct(height),
            na = sum(is.na(height)),
            med = median(height, na.rm = TRUE))  
"