
# ################################################################# #
####          Coverting other data types to R data frame                             ####
# ################################################################# #

# ----------------------------------------------------------------- #
#---- #1. Converting SPSS data to R data frame ----
# ----------------------------------------------------------------- #
install.packages("Hmisc")
library(Hmisc)
#mydata <- spss.get("c:/mydata.por", use.value.labels=TRUE)

#----------------------------------------------------------------- #
  #---- #1. Converting SAS data to R data frame ----
# ----------------------------------------------------------------- #
#use same Hmisc package
#mydata <- sasxport.get("c:/mydata.xpt")


#----------------------------------------------------------------- #
#---- #1. Converting STATA data to R data frame ----
# ----------------------------------------------------------------- #
install.packages("foreign")
library(foreign)
#mydata <- read.dta("c:/mydata.dta")



#----------------------------------------------------------------- #
#---- #1. Converting SYstat data to R data frame ----
# ----------------------------------------------------------------- #
install.packages("foreign")
library(foreign)
#mydata <- read.systat("c:/mydata.dta")
