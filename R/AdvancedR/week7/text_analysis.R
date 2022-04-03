library(tidyverse)
library(stringr)
# Text Analysis

#1, length of a string

name <- "eric"
str_length(name)

#access individual characters
#position of characters in r: eric " 1(e) 2(r) 3(i) 4(c); -1(c) -2(i) -3(r) -4(e)
?str_sub()
str_sub(name, start =2, end = 2)  #take out only r
str_sub(name, start =2, end = 3) # r amd i
str_sub(name, start =2) # r amd i
str_sub(name, start =-3, end = -1)

str_sub(name, 1) 
str_sub(name, 3)
str_sub(name, c(1,3)) # str_sub(name, 1)  str_sub(name, 3)



#replace characters
str_sub(name, 4) <- "k"
name        
#" "   provides the boundary of a text

#..................White space
names <- c("eric ",
           "  is   ",
           "good ")
names  
?str_trim()
str_trim(names) # comments to explain
str_trim(names, side = "left")
str_trim(names, "right")
str_squish(names)

#.... pattern search
#search name eric in vector names
names1 <- c("seth seth eric seth", "eric", "sammy", " eric seth")
pattern <- "seth"
?str_detect()
sum(str_detect(names1, "seth"))
str_subset(names1, pattern)

#count number of matches
sum(str_count(names1, pattern))

#_____extract patterns
str_extract(names1, pattern)

#replace matched patterns
str_replace_all(names1, "seth", "erik")


#split text
date_today <- "2022/March/28"
split <- str_split(date_today, "/")
split

data <- data.frame(
  num = c(1,2,3),
  date = c("2022/March/28","2022/March/29","2022/March/30")
)

data[c("year", "month", "day")] <- str_split_fixed(data$date, "/", 3)
data
?str_split_fixed 

data %>% separate(date,c("year", "month", "day")) #dplyr
#data %>% str_split(date, "/") #dplyr

#1.activity
#2. rename num as sequence
#. split the date column into separate colmns

data1 <- data.frame(
  num = c(1,2,3),
  date = c("2022/March/28","2022/March/29","2022/March/30")
) %>%
  rename(sequence = num) %>%
  separate(date,c("year")) %>%
  view()
  
?pipe

data[c("year", "month", "day")] <- str_split_fixed(data$date, "/", 3)
data

data2 <- data.frame(
  num = c(1,2,3),
  date = c("2022/March/28","2022/March/29","2022/March/30")
) %>%
  rename(sequence = num) %>%
  str_split_fixed(date, "/", c("year", "month", "day")) %>%
  view()


# regular expression
#wild character
words <- c("goat good great seth")
str_extract_all(words, regex("goa[.]d"))

"hit hat hot him hilt" %>% str_extract_all("h.t")
str_extract_all(words, regex("g[.][.][.]"))



str_detect(words, regex("go[oa]d"))

#or
pattern = regex("
  go[oa]d                #any of the characters in [] can be a match  
  
                ", comments = TRUE)
str_detect(words, pattern)

#negative character sets

pattern2 = regex("
  go[^oa]d                #any of the characters in [] can be a match  
  
                ", comments = TRUE)
str_detect(words, pattern2)


