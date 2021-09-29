
install.packages("sqldf")  #package allows you to use sql on r dataframes:conda install packagename or in notebook: !pip install pkc
library("sqldf")          # import package as alias  
library("tidyverse")


# Creating a data frame in R to illustrate sqldf function
data <- data.frame(x = c(1,2,3,4, 6,7), y = c("a", 'b', 'c','c', 'eric', 'seth'))
data

#how to use the sqldf function: sqldf("    "). All the sql commands are written
#between the "" in the sqldf function. The function works with the sqlite
#database and all it also transltes the sqldf codes to something R can understand

#. select a column: Select functionin sql
df1 <- sqldf("
SELECT x,y
FROM data
")


#select one column
sqldf("
SELECT x
FROM data
")

#select all columns with * wildcard instead of listing all columns
sqldf("
SELECT *
FROM data
")

#To select a few rows of the data set use the limit command

sqldf("
SELECT *
FROM data
LIMIT 2
")


#CREATE NEW COLUMNS: here I am creating a new column x*x
sqldf("
SELECT X, x*x
FROM data
")

#CREATE NEW COLUMNS and rename with the AS command
sqldf("
SELECT x AS samson, x*x As x_sq
FROM data
")

#filter rows with the where command
sqldf("
SELECT x AS samson, x*x As x_sq
FROM data
WHERE x > 2
")

#the IN command allows you to filter based multiple values in a column
sqldf("
SELECT x AS samson, x*x As x_sq
FROM data
WHERE y IN ('a',  'eric')
")

sqldf("
SELECT x AS samson, x*x As x_sq
FROM data
WHERE y IN ('a',  'eric') AND
  x > 2
")

#you can do compound filtering as below:
sqldf("
SELECT x AS samson, x*x As x_sq
FROM data
WHERE y IN ('a',  'eric') OR
  x > 2
")



#show distinct info in a column
sqldf("
SELECT distinct(y) AS unique_y
FROM data
")

#find mean of x for eaxh group
sqldf("
SELECT y, avg(x)
FROM data
group by y
")
