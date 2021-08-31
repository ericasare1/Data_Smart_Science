
# ################################################################# #
####                     Control structures                           ####
# ################################################################# #

#1. They provide logit to the code execution
#2. Controls the flow of execution of codes


# ----------------------------------------------------------------- #
#----1.  Ifelse
# ----------------------------------------------------------------- #

#structure in R:
  
(1)if((2)condition){
      #  do something
  }else {
   # do something else
  }
#notes: the condition is examined and if it holds "do something" is printed otherwise "do something else" is printed

#ex1. 
x <- 2

n <- if(x > 3) {
  "true"
} else { 
  "false you lied"
}

n

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
# ----------------------------------------------------------------- #
#---- #2. For loops
# ----------------------------------------------------------------- #

#1. It allows a code to be executed repeatedly
 

#structure
 for (i in iterator){
   
  #action code must do
   
 }

#note: the iterator lists number of times the loop is executed and in which sequence
      
# Ex. 1

for(i in c(1:5)) {
  
           print(i)
   }


# We will talk more about the control structures below in the ML stream

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
#1. a condition is tested 
#2. while the condition is true the code will be executed

count <- 0

while(count < 10) {
  print(count)
  count <- count + 1
  
}
