
library("tidyverse")
#We aew going to walk through essential functions in Purr" https://evoldyn.gitlab.io/evomics-2018/ref-sheets/R_purrr.pdf

#Working with lists

#1)Creating list with the list function

my_list <- list(age = c(12, 4, 5), letters = c("a", "b", "c"), bool = c(T, F, F))
my_list


#Lets work with list
#1. pluck function pluck("data", name of column)
str(my_list)
my_list %>% pluck("bool")

flatten(my_list)

#2. keep
my_list %>% keep(~ length(.) == 1)
my_list %>% keep(~ length(.) == 3)

#3. discard
my_list %>% discard(~ length(.) == 1)
my_list %>% discard(~ length(.) == 3)

#4. some: returns true if the condition applies to some of the list
my_list %>% some(~ length(.) == 1)

#5. every: returns true if the condition applies to some of the list
my_list %>% every(~ length(.) == 1)



#2a)Creating list columns with tibble function in 

list_col_tibble <- tibble(
  age = c(12, 4, 5),
  letters = c("a", "b", "c"), 
  bool = c(T, F, F)
  )

#2b)Creating list columns using enframe function 
list_col_enframe <- enframe(my_list)   #converts a list or vectors to a column of list
list_col_deframe <- deframe(list_col_enframe) #opp of enframe: converts back to list

#3. some applications
view(mtcars)

group_nested <- mtcars %>% group_by(cyl) %>% nest()
group_unnested <- mtcars %>% group_by(cyl) %>% unnest(cols = c())

view(group_unnested)

str(group_nested)

group_nested %>% keep(is.numeric)
group_nested %>% discard(is.numeric)

group_unnested <- group_nested %>% unnest(cols = c(data))
view(group_unnested)

g1 <- group_nested %>% mutate(row=map_int(data,ncol),
                              col=map_chr(data,nrow))


#Map
mtcars 
map(mtcars, mean)
map(mtcars, typeof)

map(group_nested$data, ncol)

mtcars$mpg
sum(is.na(mtcars$mpg))

count_na <- function(x){
  return(sum(is.na(x)))
}

count_na(mtcars$mpg)

map(group_nested$data, count_na)
map(group_nested$data, count_na)



map_dbl(mtcars, count_na)

count_unique <- function(x){
  length(unique(x))
}
count_unique(mtcars$cyl)

unique(mtcars$cly)
map(mtcars, count_unique)
map_dbl(mtcars, count_unique)


#mpg = a + b*wt

for(i in c("df1", "df2", "df3")){
  summary(lm(mpg ~ wt, data = i))
}


summary(lm(mpg ~ disp+hp+drat, data = mtcars))
    
    
#Map2

group_nested <- mtcars %>% group_by(cyl)  %>% nest()

length(group_nested$data)
str(group_nested$data)
colnames(mtcars)
models <- group_nested$data %>% map(~ lm(mpg ~ disp+hp+drat, data = .))
mod <- group_nested$data %>% map(~ lm(mpg ~ wt, data = .))

length(models)
models %>% str()

predict()
map2(mod, group_nested$data, predict)

#pmap

df <- data.frame(
  price = c(2,4,6,7),
  quantity = c(10, 12, 1, 2),
  cost = c(10, 3, 17, 0),
  discount_rate = 0.7,
  planning_horizon = 10
)
view(df)

profit <- function(price, quantity, cost, discount_rate, planning_horizon) { 
  disc = (profit = (price * quantity) - cost) *(1/(1+discount_rate))^planning_horizon
  return(disc)                                                                            
}


df1 <- df %>% mutate(profit = pmap_dbl(list(price, quantity, cost, discount_rate, planning_horizon), profit)) #whatever.......
view(df1)

price <- df$price
list(price, df$quantity, df$cost)
(pmap(list(df$price, df$quantity, df$cost, df$discount_rate, df$planning_horizon), profit))
pmap_dbl(list(df$price, df$quantity, df$cost), profit)

unlist(list(df$price, df$quantity, df$cost)
)
df1
