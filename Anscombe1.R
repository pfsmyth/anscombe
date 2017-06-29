# Summarised from : https://www.r-bloggers.com/the-visual-difference-%e2%80%93-r-and-anscombe%e2%80%99s-quartet/

# the default form of the dataset
anscombe

# Load the dataset into a 3 column dataframe

mydata <- with(anscombe,data.frame(xVal=c(x1,x2,x3,x4), yVal=c(y1,y2,y3,y4), mygroup=gl(4,nrow(anscombe))))

# Get the mean and SD of each set

aggregate(.~mygroup,data=mydata,mean)
aggregate(.~mygroup,data=mydata,sd)

# Plotting the data

library("ggplot2")

ggplot(mydata,aes(x=xVal,y=yVal,group=mygroup))+geom_point()+facet_wrap(~mygroup) +
  geom_smooth(method='lm',formula=y~x)
