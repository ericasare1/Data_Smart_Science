
# create a function:
  a) net present value of profit each year for T
  b) odd years profit is 20
  c) for even years profit is 10
c)interest = 10

  t= 1,  2, 3, 4, 5, 6, 7, 8, 9, 10
  odd, even, old, even,....
  20, 10, 20, 10, 20, 10 .....
  
  formula = profit/(1+r)^t
  
  time = 1: 20/(1+(10/100))^1 1th iteration  = 10
  time = 2: 10/(1+(10/100))^2 2nd             = 20
  time = 3: 20/(1+(10/100))^3
  time = 4: 10/(1+10/100)^4  tth iteration
  
  # Initialize `usq`
  pv = 0
  
  for(i in 1:t) {
    if(i %% 2 == 0){
      pv <- 10/(1+(r/100))^i
    } else{
      pv <- 20/(1+(r/100))^i
    }
  }
  
  return((pv))


npv <- function(profit_even, profit_odd, interest_rate, time) {
  
  # Initialize
  pv = 0
  
  for(i in 1:time) {
    
    #%% modulus is helping to determine if year is odd or even
    if(i %% 2 == 0){
      pv <- profit_even/(1+(interest_rate/100))^i} 
    
    #use a different profit if odd
    else{
      pv <- profit_odd/(1+(interest_rate/100))^i 
    }
  }
  
  return((pv))
} 


npv_profit <- npv(profit_even = 20, profit_odd = 0, interest_rate= 0, time= 20)

