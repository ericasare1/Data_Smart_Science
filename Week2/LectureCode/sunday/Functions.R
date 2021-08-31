
# ################################################################# #
####                     Functions                            ####
# ################################################################# #

# ----------------------------------------------------------------- #

#1. R is a functional program, i.e. functions are at the core of R programming
#2. Functions provides a instructions that instruct R to produce a specific result


# ----------------------------------------------------------------- #
#---- #1. Function Template in R ----
# ----------------------------------------------------------------- #

(1)nameOffunction <- (2)function(arguments){
  
  (3). first instruction: what you want the function to do!
    
  (4) second instruction: return(what that function must show)
}



#Ex1. create a function to estimate the square of a number

square_of_number <- function(x){

  sq <- x^2
  
  return(sq)
  
}

square_of_number(x=1000)

#ex2: create a function that adds three numbers:  x, y, z
add_three_numbers <- function(x, y, z){
  
  add <- x + y + z
  
  return(add)
  
}

add_three_numbers(x=1,y=2,z=3)


#ex3. Create a function the estimates the number of rows of a data frame

numberOfrows10 <- function(data){
  
  numbrow <- nrow(data) + 10
  
  return(numbrow)
  
}

numberOfrows10(data = df)

#ex4. Create a function to estimate the net present value of annual income streams (assuming same income annually).

NPV <- function(interest_rate, time, profit){
  
  npv <- profit / (1+ (interest_rate/100))^time
  
  return(npv)
}

NPV(interest_rate = 10, time = 100, profit = 1000)

