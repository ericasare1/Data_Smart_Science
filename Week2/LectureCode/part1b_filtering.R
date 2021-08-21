
# ################################################################# #
####                       Filtering Data                   ####
# ################################################################# #

# ----------------------------------------------------------------- #
#---- #1. 4 ways to select columns                     ----
# ----------------------------------------------------------------- #

#first let's create our data frame
Age <- c(30, 60, 15, 70, 25, 26)
Name <- c("Eric", "Seth", 'John', "Bonsu" ,'Elizabeth', 'Regina')
Sex <- c('Male', 'Male', 'Male', 'Male','Female', 'Female')
Money_in_Account <- c(30.00, 40.01, 600.04, 400.98, 4999.9, 300000)
#create data frame
df <- data.frame(age=Age, name= Name, sex = Sex, savings = Money_in_Account)
print(df)
filter <- c("Seth", "John")
df[df$name %in% filter,]

#General way to select in base R
# nameOfData[command to select rows , command to select columns]

#1. First way to select column: Using column positional numbering (starts from 1 ...)
    #Eg. I want to select first column (age with pos 1) and last col (savings with pos 4)
firstcolSelected <- df[ , c(1, 4)]   # or
firstcol_filter <-  c(1, 4)
firstcolSelected_copy <- df[ , firstcol_filter ]

# ----------------------------------------------------------------- #
#---- #4. some attributes you can conduct on dataframes          ----
# ----------------------------------------------------------------- # 
nrow(excel_data)
nrow(excel_data)
colnames(excel_data)
#glimpse(excel_data)
