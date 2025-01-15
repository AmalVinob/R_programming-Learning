sessionInfo()
ls()
data()
search()#packages and env

install.packages("mosaic")

??mosaic

library(mosaic)
attach(birth_78)


#tally in mosaic helps ?
#x , y plot

car package ?? scatter plot



q - use pakages to do works
	prop table?



most - apply function, filter,subset, select, pipe



attach(mtcars)
names(mtcars)
mtcar <-mtcars
View(mtcars)

str(mtcar)
model1<-lm(mpg~wt,data = mtcars)
#model1$Coefficients

summary(model1)



what is degree of freedom>?????
free variable????

find the stars and chech the confidence level.

find diff or r square - strinkage factor


model2<-lm(mpg~wt+ qsec,data = mtcars)
summary(model2)

now r square increased- compared to model 1

anova(model1,model2)
library(car)

??compare

compare(model1, model2)

cor(mtcars$wt, mtcars$qsec)

v= vif(model2)
??vif

The Variance Inflation Factor (VIF) is a measure used 
to assess the severity of multicollinearity in a 
regression analysis
so there is no multy colarianrity

1/v


diagnostic plot





mosiac
-----------


mplot(model1,which = 1)

mplot(model1,which = 2)

mplot(model1,which = 3)

mplot(model1,which = 4)
mplot(model1,which = 5)
mplot(model1,which = 6)


range(mtcars$wt)

max(mtcar$wt)-min(mtcars$wt)

write a function to find the mode,
cane use distint, unique


confint(model1)

normalisation using min-max score in r




















