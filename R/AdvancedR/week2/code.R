#__________________________________________________Vectorized Prgramming__________________________________

#install package so we can use the functions
install.packages("tidyverse")
library("tidyverse")

#__creating data
grades <- data.frame(
  student_names = c("Eric", "Ama", "Mahama", "Nana_addo", "Biden", "Val", "Jim"),
  attendance = c(10, 70, 2, 0.02, 90, 90, 100),
  marks = c(60, 70, 0.005, 0.0045, 90, 90, 100)
)

#Lets see what we created
view(grades)

#completing the assignment
grades <- grades %>%
  mutate(grade_description = case_when(
                                        marks < 50 ~ "fail",
                                        (marks > 50 & marks <= 70) ~ "average",
                                        marks > 70 ~ "pass",
                            ),
         see_me = ifelse(attendance < 50, "See me; you are dead!", "you good; go chill!")
  )
