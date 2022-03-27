library(tidyverse)
library(ggplot2)

data(mtcars)

str(mtcars)


#________________________________________________________Lets plot some basic graphics

#A.  line graphic

p_a <- ggplot(data = mtcars, 
       aes(x = hp, y = cyl)) + 
  geom_line()

p_a

#lets modity change color of line
mtcars %>%
  ggplot(
       aes(x = hp, y = cyl)
       ) +
  geom_line(size = 0.2, color = "red")

#lets add labels and change overall apperance of plot
ggplot(data = mtcars, 
       aes(x = hp, y = cyl, )
) +
  geom_line(size = 0.2, color = "black") +
  labs(x = "horse power", y = "number of cylinders", title = "a line plot") + 
  theme_bw()

#lets change the size of label texts and even its color
ggplot(data = mtcars, 
       aes(x = hp, y = cyl)
) +
  geom_line(size = 0.2, color = "black") +
  labs(x = "number of cylinder", y = "horse power", title = "a line plot") + 
  theme_bw() + 
  theme(text = element_text(size=20, colour="dark green"))

#rotate axis

p <- ggplot(data = mtcars, 
       aes(x = hp, y = cyl, )
) +
  geom_line(size = 2, color = "black") +
  labs(x = "number of cylinder", y = "horse power", title = "a line plot") + 
  theme_bw() + 
  theme(text = element_text(size=14, colour="dark green"))

p1 <- p + coord_flip()
p1

# save the plot
ggsave("")

#zoom in to aan area

p + coord_cartesian(xlim = c(0, 150))

#++++++++++++++++++++++++++++++++++++++ Awesomeness Bonus__________make it all interactive
#need to instal plotly
install.packages("plotly")
library(plotly)
ggplotly(p + coord_cartesian(xlim = c(150, 260)))


# set multiple plots into one figure
library(ggpubr)

ggarrange(p, p1,  bx, bx1,
                  #labels = c("line plot1", "B", "C", "box plot"),
                    ncol = 2, nrow = 2)

  
#______________________________________________________B.  Scatter plot
#lets change the size of label texts and even its color
ggplot(data = mtcars, 
       aes(x = hp, y = cyl, )
) +
  geom_point(size = 2, color = "black") +
  labs(x = "number of cylinder", y = "horse power", title = "a line plot") + 
  theme_bw() + 
  theme(text = element_text(size=14, colour="red"))

#C.  Box plot
#. one factor column
ggplot(data = mtcars, 
       aes(x = factor(0), y = cyl)
) +
  geom_boxplot() +labs(x = "", y = "number of cylinders", title = "the same information above applies")

#. multiple factor column

bx <- ggplot(data = mtcars, 
       aes(x = as.factor(cyl), y = mpg )
) +
  geom_boxplot()

#add the data to the boxplot
bx + geom_jitter(shape=16, position=position_jitter(0.2))

#change colors
bx1 <- ggplot(data = mtcars, 
       aes(x = as.factor(cyl), y = mpg, color = as.factor(cyl))) +
  geom_boxplot()

# Use custom color palettes
bx1 + scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))
bx1 + scale_color_manual(values=c("red", "green", "black"))

#change the order of the discrete plots
bx1 + scale_x_discrete(limits=c("8", "6", "4"))

#managing legends
bx1 + theme(legend.position="top")  #move legends to the top of the plot
bx1 + theme(legend.position="bottom")  #move legends to the bottom of the plot
bx1 + theme(legend.position="none") #No legend


# ________________________________bar chart
df <- data.frame(
  
  gdp_capita = runif(1000, 200, 54000),
  population = abs(rnorm(1000, 200, 54000))
  
) %>% 
  mutate(income_group = case_when(
    gdp_capita < 1000 ~ "low_income",
    gdp_capita > 1000 & gdp_capita < 12000 ~ "mid_income",
    gdp_capita >12000 ~ "high_income"
  )
         
)

unique(df$income_group)


#bar chart
a <- df %>%
  group_by(income_group) %>%
  summarize(num_countries = n()) 
view(a)

bar1 <- a %>%
  ggplot(aes(x = income_group, y = num_countries)) + geom_col()


bar2 <- df %>%
  ggplot(aes(income_group)) + geom_bar()


#___________________________one plot on top of each other

bar3 <- a %>%
  ggplot(aes(x = income_group, y = num_countries)) + geom_col() +
  geom_point(aes(x = income_group, y = num_countries)) +
  #geom_line(aes()) +
  #geom_boxplot(aes()) +
  theme_bw()


#________________________________________detecting outliers _______________
#method 1
outlier2 <- df %>% 
  ggplot(aes(x = "", y = population)) +
  geom_boxplot()

#method 2
outlier3 <- df %>% 
  ggplot(aes(x = "", y = population)) +
  geom_boxplot(outlier.colour="red", outlier.shape=4,
               outlier.size=4)

#method1
Q <- quantile(df$population, probs=c(.25, .75), na.rm = FALSE)
inter_qr <- IQR(Q)

up_cutoff_outliers <-  Q[2]+1.5*inter_qr # Upper Range  
lower_cutoff_outliers <-  Q[2]-1.5*inter_qr # Upper Range 


#method 3
boxplot(df$gdp_capita)$out
boxplot(df$population)$out
outl <- c(boxplot(df$population)$out)


df_out <- boxplot(df$population, plot = FALSE)$out

#__________________Missing information
#check which columns have missing info
is.na(df)
colSums(is.na(df)) 
str(df)


df2 <- df %>%
  mutate(gdp_capita_some_na = as.numeric(ifelse(gdp_capita >50000 & gdp_capita  < 53000,"", gdp_capita)))
colSums(is.na(df2)) 
view(df2)

#visualize missing info
install.packages("VIM")              # Install VIM package
library("VIM")                       # Load VIM

summary(aggr(df2, plot=FALSE))
aggr(df2$gdp_capita_some_na) #$gdp_capita_some_na, combined = TRUE)                           # Create aggregation plot

#https://www.rdocumentation.org/packages/VIM/versions/6.1.1/topics/barMiss
#barMiss(df2,interactive=TRUE)#$gdp_capita_some_na)                           # Create aggregation plot
barMiss(df2$gdp_capita_some_na, only.miss = TRUE)
histMiss(df2$gdp_capita_some_na)                           # Create aggregation plot

# Try and do this: _______create your own function to visualize missing info 

#some imputations
#. median and median
median_imputation <- df2 %>%
  mutate(gdp_capita_some_na = replace(gdp_capita_some_na,
                                is.na(gdp_capita_some_na),
                                median(gdp_capita_some_na, na.rm = TRUE)))
mean_imputation <- df2 %>%
  mutate(gdp_capita_some_na = replace(gdp_capita_some_na,
                                is.na(gdp_capita_some_na),
                                mean(gdp_capita_some_na, na.rm = TRUE)))
colSums(is.na(mean_imputation)) 
barMiss(mean_imputation$gdp_capita_some_na, only.miss = TRUE)

1#2. KNN method using Machine Learning?
#caret