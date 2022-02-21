#clear all data from current memory
rm(list=ls(all=TRUE))

#install packman which will be used to install packages
if (!require(pacman)) {
  install.packages("pacman")
  library(pacman)}

# Activate Packages
p_load(tidyverse, gapminder)


# We are going to work with data package : Gapminder
help(gapminder)  # lets check iit out

?gapminder #? is alternative to help()

view(gapminder)
str(gapminder)  #gives you summary information on data including datatypes of column
head(gapminder)
ncol(gapminder)
colnames(gapminder)
nrow(gapminder)


# select
df1 <-  gapminder %>% select(country, continent, year) #selected only the three
colnames(df1)

df2 <-  gapminder %>% select(-c(country, continent, year)) #do not select only the three
colnames(df2)

df3 <-  gapminder %>% dplyr::select(-c(country, continent, year)) #do not select only the three
colnames(df3)

# Filter
unique(gapminder$continent)
df4 <-  gapminder %>% filter(continent == "Africa") 
head(df4)

df5 <-  gapminder %>% filter(continent == "Africa" & pop <= 12760499) 
head(df5)

df7 <-  gapminder %>% filter(continent == "Africa" | pop <= 12760499)
unique(df7$continent)

df8a <-  gapminder %>% filter(continent == "Africa" | continent == "Oceania" | continent == "Americas")
unique(df8a$continent)

#df8b
names_continents <- c('Africa', 'Oceania', 'Americas')

#df8b <- gapminder %>% filter(continent %in% c('Africa', 'Oceania', 'Americas'))

df8b <- gapminder %>% filter(continent %in% names_continents)
unique(df8a$continent)

# Arrange
df9 <- gapminder %>% arrange(pop)        #ascending
df10 <- gapminder %>% arrange(desc(pop))  #descending

#df11 <- gapminder %>% arrange(pop, gdpPercap) 

head(df11)

# Mutate
df12 <- gapminder %>% mutate(
                              pop_sqrt = sqrt(pop),     # ....
                              gdp = gdpPercap * pop,
                              pop_lifexp = pop + lifeExp
                      )
colnames(df12)

# Group_by & summarize 

df13 <- gapminder %>% group_by(continent) %>% summarise(mean_lifeexp = mean(lifeExp, na.rm = TRUE))
df14 <- gapminder %>% group_by(continent) %>% summarise(mean_lifeexp = round(mean(lifeExp, na.rm = TRUE), 1))
df15 <- gapminder %>% group_by(continent) %>% summarise(mean_lifeexp = as.integer(mean(lifeExp, na.rm = TRUE)))
df16 <- gapminder %>% group_by(continent) %>% summarise(
                                                        mean_lifeexp = as.integer(mean(lifeExp, na.rm = TRUE)),
                                                        sum_gdpPercap = as.integer(sum(gdpPercap))
                                                        )


view(df16)

#>>>>> sourcing functions
source("functions/function_script1.R")
sum_values(x=2, y=5)


