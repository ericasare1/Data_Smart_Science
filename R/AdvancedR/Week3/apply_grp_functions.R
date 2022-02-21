
#Today we will illustrate the application of apply group of functions to data

#. 1. Apply()
#. learn more about the function
?apply()
str(apply)

#application 1
df <- data.frame(a = 7:11,           
                      b = 3:7,
                      c = 4)
#df1 <- df$a

apply(df, 1, sum)   #sum of values per each row
apply(df, 2, sum)   #sum of values per each column

apply(df, 1, mean)   #sum of values per each row
apply(df, 2, mean)   #sum of values per each column




#2. Lapply()
a_list <- list(
  7:11,            
  3:7,
   4           
)

print(a_list)
lapply(a_list, length)

numbers <- c(1, 4, 16)
numbers
lapply(numbers, sqrt)
?sqrt()

df <- data.frame(x = c(6, 2), y = c(3, 6), z = c(2, 3))
df
# Function applied to all columns
fun1 <- function(i){
 df[, i] * i 
} 

function(i) df[, i] * i


lapply(1:ncol(df), function(i) df[, i] * i)

#3.  Sapply()
?sapply()
print(a_list)
lapply(a_list, length)

sapply(a_list, length)

test <- list(a = c(1, 3, 5), b = c(2,4,6), c = c(9,8,7))
test
sapply(test, max)

#4. Vapply()
?vapply()

vapply(a_list, length, integer(2))

vapply(test, max, numeric(1))

vec <- c(1:10)
A<-c(1:12)
B<-c(1:12)
C<-c(1:12)
mylist<-list(A,B,C)
#I am expecting each item in the list to return a single numeric value, so FUN.VALUE = numeric(1).
vapply(vec, sum, numeric(1))
vapply(vec, function(x) x+2, numeric(1))
vapply(mylist, function(x) x+2, numeric(12))


#.5 Tapply()

df_grades <- data.frame(
  student_names = c("a", "b", "c", "a", "b", "c", "a"),
  attendance = c(10, 70, 2, 0.02, 90, 90, 100),
  marks = c(60, 70, 0.005, 0.0045, 90, 90, 100)
)
df_grades
tapply(X = df_grades$marks, INDEX = df_grades$student_names, FUN = sum)

#6.Mapply()

mapply(rep, 1:3, 3:2)
?rep()

#create two vectors
X1 <- c(1, 2, 3, 4, 5)
X2 <- c(2, 4, 1, 2, 10)


mapply(max, X1, X2)

#find max value of each corresponding elements in vectors 
mapply(function(X1, X2) X1*X2 + X2, X1, X2)


mapply(function(x,y){x^y},x=c(2,3),y=c(3,4))
