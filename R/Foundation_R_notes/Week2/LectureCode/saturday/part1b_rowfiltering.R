
# ################################################################# #
####                       Filtering Data                   ####
# ################################################################# #

# ----------------------------------------------------------------- #
#---- #1. 4 ways to select rows                     ----
# ----------------------------------------------------------------- #

#first let's create our data frame
Age <- c(30, 60, 15, 70, 25, 26)
Name <- c("Eric", "Seth", 'John', "Bonsu" ,'Elizabeth', 'Regina')
Sex <- c('Male', 'Male', 'Male', 'Male','Female', 'Female')
Money_in_Account <- c(30.00, 40.01, 600.04, 400.98, 4999.9, 300000)
#create data frame
df <- data.frame(age=Age, name= Name, sex = Sex, savings = Money_in_Account)
print(df)


#General way to select in base R
nameOfData[command to select rows , command to select columns]

#1a. First way to select rows: Using row positional numbering (starts from 1 ...)
firstway_row <- df[ c(1:4) , ]   # or

firstrow_filter <-  c(1, 4)
firstway_row2 <- df[firstcol_filter, ]

#or removing rows you do not want
firstwayrow_otherway <- df[-c(2:3), ] # if you want to select rows from 2 to 10 use c(2:10)

#1b. select rows based on certin values in column: say select only males in sex
secondway_row <- df[which(df$sex == "Female"), ]
#select rows based on compound conditions
secondway_rowcompound <- df[which(df$sex == "Male" & df$name == "Eric", ]
secondway_rowcompound2 <- df[which(df$sex == "Male" | df$name == "Eric"), ]


#1b. use the subset function takes three arguments:
# argument 1: name of data frame
# argument 2: command to select rows
# aregment 3: command to select columns

thirdway_row <- subset(df, Sex == "Male" , )
thirdway_row2 <- subset(df, Sex == "Male" & name == "Eric",   )

