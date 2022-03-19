
library(ggplot2)

data(mtcars)

str(mtcars)


#________________________________________________________Lets plot some basic graphics

#A.  line graphic

ggplot(data = mtcars, 
       aes(x = hp, y = cyl)) +
  geom_line()

#lets modity change color of line
ggplot(data = mtcars, 
       aes(x = hp, y = cyl, )
       ) +
  geom_line(size = 2, color = "black")

#lets add labels and change overall apperance of plot
ggplot(data = mtcars, 
       aes(x = hp, y = cyl, )
) +
  geom_line(size = 2, color = "black") +
  labs(x = "number of cylinder", y = "horse power", title = "a line plot") + 
  theme_bw()

#lets change the size of label texts and even its color
ggplot(data = mtcars, 
       aes(x = hp, y = cyl, )
) +
  geom_line(size = 2, color = "black") +
  labs(x = "number of cylinder", y = "horse power", title = "a line plot") + 
  theme_bw() + 
  theme(text = element_text(size=14, colour="dark green"))

#rotate axis

p <- ggplot(data = mtcars, 
       aes(x = hp, y = cyl, )
) +
  geom_line(size = 2, color = "black") +
  labs(x = "number of cylinder", y = "horse power", title = "a line plot") + 
  theme_bw() + 
  theme(text = element_text(size=14, colour="dark green"))

p1 <- p + coord_flip()

# save the plot
ggsave("")

#zoom in to aan area

p + coord_cartesian(xlim = c(150, 260))

#++++++++++++++++++++++++++++++++++++++ Awesomeness Bonus__________make it all interactive
#need to instal plotly
install.packages("plotly")
library(plotly)
ggplotly(p + coord_cartesian(xlim = c(150, 260)))


# set multiple plots into one figure
library(ggpubr)

figure <- ggarrange(p, p1,  bx, bx1,
                    #labels = c("A", "B", "C", "D"),
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
       aes(x = factor(0), y = cyl )
) +
  geom_boxplot()

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

#managing legends
bx1 + theme(legend.position="top")  #move legends to the top of the plot
bx1 + theme(legend.position="bottom")  #move legends to the bottom of the plot
bx1 + theme(legend.position="none") #No legend

#change the order of the discrete plots
bx1 + scale_x_discrete(limits=c("8", "6", "4"))

