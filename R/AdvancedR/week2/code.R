#__________________________________________________Vectorized Prgramming__________________________________

#install package so we can use the functions
install.packages("tidyverse")
library("tidyverse")



#Vectorizing if-else control structure!
#We are going to use existing functions in the Dplyr package for this exercise.
#Assuming you are a Data Science Professor in Omufia University. You obtained grades of your students from your TA. 
#Unfortunately, the TA has eloped with the girl friend for an advanced Valentine party: You want to do two things urgently:
#Give the students Fail, Pass, Average based on their grades. 
#If the student did not attend about 50% of class; he or she must come and see me.


#__creating data
grades <- data.frame(
  student_names = c("Eric", "Ama", "Mahama", "Nana_addo", "Biden", "Val", "Jim"),
  attendance = c(10, 70, 2, 0.02, 90, 90, 100),
  marks = c(60, 70, 0.005, 0.0045, 90, 90, 100)
)

#First activity actitity
grades <- data.frame(
  student_names = c("Eric", "Ama", "Mahama", "Nana_addo", "Biden", "Val", "Jim"),
  attendance = c(10, 70, 2, 0.02, 90, 90, 100),
  marks = c(60, 70, 0.005, 0.0045, 90, 90, 100)
) 

%>%
#second create two more variables based on existing variables in the data.frame

mutate(
  see_me =   ,
  grade_description =   
)

#rename see_me   to come_quick
%>%
rename()

#%>%  #magister
#mutate()
#ifelse()

if(condition){
  rule
}
elseif(){}
elseif(){}
elseif(){}
elseif(){}
elseif(){}
elseif(){}
elseif(){}
elseif(){}
elseif(){}
elseif(){}
else{}
#case_when()

#Lets see what we created
print(grades)
view(grades)

#completing the assignment
grades <- grades %>%
  mutate(see_me = ifelse(attendance < 50, "See me; you are dead!", "you good; go chill!"), # this is my first answer: if students get less than 50% attendance they must see prof!
    
    grade_description = case_when(
                                  marks < 50 ~ "fail",
                                  (marks > 50 & marks <= 70) ~ "average",
                                   marks > 70 ~ "pass",
                            ),
         
  )
view(grades)




