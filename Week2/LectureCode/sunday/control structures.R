
# ################################################################# #
####                     Control structures                           ####
# ################################################################# #
1. The provide logit to the code execution
2. Controls the flow of execution of codes


# ----------------------------------------------------------------- #
#---- Ifelse
# ----------------------------------------------------------------- #
structure in R:
  
  if(condition){
    do something
  } 
  else {
    do something else
  }


#ex. 
x <- 2

n <- if(x > 1) {
  "true"
} else { 
  "false you lied"
}



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
# ----------------------------------------------------------------- #
#---- #1.For loops
# ----------------------------------------------------------------- #
1. It allows a code to be executed repeatedly
 

#structure
 for (i in iterator){
   
  action code must do
 }

# Ex. 1
1, 2, 3, 4, 5 .... 10
print(1)
print(2)

for(i in c(1:5)) {
  
           print(i)
   }


# Nested loops
x <- matrix(1:6, 2, 3)

for(i in seq_len(nrow(x))) {
  
  for(j in seq_len(ncol(x))) {
    print(x[i, j])
    
  }   
}

# ----------------------------------------------------------------- #
#---- While loop
# ----------------------------------------------------------------- #
1. a condition is tested 
2. while the condition is true the code will be executed

count <- 0

while(count < 10) {
  print(count)
  count <- count + 1
  
}
op