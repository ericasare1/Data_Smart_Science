library(tidyverse)
sum_values <- function(x, y){
  sum <- x + y
  return(sum)
}

#Assumptions
#in odd years price is $10 and quantity is $30; otherwise, price is $5, and quantity is $15
#Total cost is $40, and it is the same over the 10-year period.
#Discount rate is 7%


#1 one
profit <- function(price, quantity, cost, year, discount){
  discounted_profit <- (price*quantity - cost) * (1+ (discount/100))^-year
}
view(df)
df <- data.frame(
  year = seq(1,10)
) %>% mutate(
  odd_even = year %% 2,
  price = ifelse(odd_even == 1, 10, 5), #case_when()
  quantity = ifelse(odd_even == 1, 30, 15),
  cost = 40,
  discount = 7,
  profit_disc = pmap_dbl(list(price, quantity, cost, year, discount), profit)) %>% 
  summarise(npv = sum(profit_disc))
view(df)

#2.....

npv <- function(discount, number_years, key){
 
  data <- data.frame(year <- seq(1,number_years))

   df <- data %>% mutate(
    odd_even = year %% 2,
    price = ifelse(odd_even == 1, 10, 5),
    quantity = ifelse(odd_even == 1, 30, 15),
    cost = 40,
    profit_disc = pmap_dbl(list(price, quantity, cost, year, discount), profit)
  ) %>% filter(odd_even == key) 
 return(sum(df %>% summarise(answer = sum(profit_disc))))
}

npv(discount = 7, number_years = 10, key=0)

#3.....

npv2 <- function(discount, number_years, price_even, price_odd, quant_even, quant_odd, cos){
  
  data <- data.frame(year <- seq(1,number_years)) 
  
  df <- data %>% mutate(
    odd_even = year %% 2,
    price = ifelse(odd_even == 1, price_odd, price_even),
    quantity = ifelse(odd_even == 1, quant_odd, quant_even),
    cost = cos,
    profit_disc = pmap_dbl(list(price, quantity, cost, year, discount), profit)
  ) 
  return(sum(df %>% summarise(npv = sum(profit_disc))))
}

npv2(discount = 7, number_years = 10, price_even = 10, price_odd=10, quant_even=15, quant_odd=30, cos=runif(1,2000,50000))
