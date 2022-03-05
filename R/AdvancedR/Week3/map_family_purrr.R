
#library(purrr)
library(tidyverse)
library(gapminder)
#____________________________________________________________________map
square_root <- function(x){
  return(x^1/2)
}
# Create a vector of number
vector <- c(2,16,4,25)
print(vector)
# Using map() fucntion to generate squares
map(vector, square_root)

# Using map() fucntion to generate squares (anonymous functions)
map(vector, function(x) x^1/2)

#ex 2
Age_presidents <-
  list(
    uganda = c(100, 20),
    ghana = c(60, 70, 60, 80, 45),
    north_korea =  c(70, 80, 20)
  )

#first element
length(c(100, 20))
#second element
length(c(60, 70, 60, 80, 45))


map(Age_presidents, median)



#___________________________________________________map2
x <- c(0, -2, 4)
length(x)
y <- c(6, 5, 3)
length(y)

seth <- function(x,y){
  x+y
  }
 
map2(x, y, seth)

x1 <- c(1, 2, 4)
y1 <- c(6, 5)

map2(x1, y1, seth)

#___________________________________________________pmap: instead of map3(), map4()....

some_nums <- tibble(
  a = c(50, 60, 70),
  b = c(10, 90, 40),
  c = c(1, 105, 2000)
)  

pmap(some_nums, min)
pmap(some_nums, max)

