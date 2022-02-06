
#___________________Title: Total Revenue Calculation ________________________________
# Total revenue = price * quantity sold: this is also called total revenue formula or rule to calculate total revenue

# 1. learn how to create variables and assign information
#a. lets create price variable

Price_corn <- 5
Price_corn 

#b lets create quantity sold variable

quantity_sold_corn <- 20
quantity_sold_corn

#2. creating functions

Total_revenue <- function(price_corn, quantity_sold_corn){
  
  output <- price_corn * quantity_sold_corn
  
  return(output)
  
}


revenue1 <- Total_revenue(price_corn=5, quantity_sold_corn=20) # i like this way of using created functions
revenue1

revenue2 <- Total_revenue(20, 20)
revenue2


# 2. Control structure
#when it rains quantity sold is less than quantity sold in an non rainy day: 2 conditions


Total_revenue2 <- function(price_corn, quantity_sold_corn, rain){
  
  if(rain == "yes"){
    
    output <- price_corn * quantity_sold_corn

  }
  else{
    
    output <- price_corn * (quantity_sold_corn + 10)
    
    return(output)
  }
  
  
}


revenue3 <- Total_revenue2(price_corn=5, quantity_sold_corn=20, rain = "no") # i like this way of using created functions
revenue3


#with three conditions
#condition: cloudy   b. sunny  c. rainy



Total_revenue3 <- function(price_corn, quantity_sold_corn, weather){
  
  if(weather == "cloudy"){
    
      output <- price_corn * quantity_sold_corn  # what does this line means
    
  }
  else if (weather == "sunny"){
    
      output <- price_corn * (quantity_sold_corn + 10)
    
      return(output) # what is return function
  }
  else{
      output <- price_corn * (quantity_sold_corn -5)
    
  }
  
}

revenue4 <- Total_revenue3(price_corn=5, quantity_sold_corn=20, weather = "sunny") # i like this way of using created functions
revenue4


#with 4 conditions
#condition: monday   b. tuesday  c. wednesday d. thurday



Total_revenue4 <- function(price_corn, quantity_sold_corn, day){
  
  if(day == "monday"){
    
    output <- price_corn * quantity_sold_corn
    
  }
  else if (day == "tuesday"){
    
    output <- price_corn * (quantity_sold_corn + 10)
    
    return(output)
  }
  else if (day == "wednesday"){
    
    output <- price_corn * (quantity_sold_corn + 15)
    
    return(output)
  }
  
  else{
    output <- price_corn * (quantity_sold_corn + 20)
    
  }
  
}

revenue5 <- Total_revenue4(price_corn=5, quantity_sold_corn=20, day = "tuesday") # i like this way of using created functions
revenue5

#case_when   -------more than conditions
#ifelse--two conditions
