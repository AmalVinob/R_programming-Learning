data(mtcars)
attach(mtcars)
View(mtcars)

dim(mtcars)
class(mtcars)
summary(mtcars)
str(mtcars)
typeof(mtcars)

names(mtcars)
head(mtcars)

mpg(mtcars)
rownames(mtcars)


-------------------------------------------------------------

mtcars$cyl
cyl1<-as.factor(mtcars$cyl)
cyl1<-as.factor(mtcars$cyl)
cyl1
class(cyl1)
table(cyl)


#plot
#-------
plot(mtcars$mpg,mtcars$wt,main="mpg vs wt",fill="red",col="steelblue")


search(ggplot)

mtcars[1:5]


#first 5 obs of 1st column
mtcars[1:5,1]
View(mtcars)

#1st 5 obs of mpg
mtcars$mpg[1:5]

#5 obs of all variable
mtcars[1:5,]

mean(mtcars$mpg)
 

#histogram
hist(mtcars$mpg,col="steelblue")
hist(mtcars$mpg, col="steelblue", xlab="mpg", ylab="frequency", border="red",title="mpg")


#get the summary statics or fget the summary
summary(mtcars)


=-----------------------------------

data set extraction
-------------------

#in 2013 the avg mpg(mile per gallon) for cars was of otder 23 mpg
#subset the dat so that you create a new data frame that 
contains cars that get 23 or more mpg(miles per gallon)

new_mpg<- subset(mtcars, mpg>23)
new_mpg	

mtcars1<-mtcars %>%
	filter(mpg>23)

mtcars1
	



nrow(mtcars)

boxplot(mtcars$mpg,mtcars$am==1,col="steelblue")


boxplot(mtcars$mpg,mtcars$cyl,col="green")
boxplot(mtcars$mpg~cyl,col="green")




#aes

barplot(mtcars$vm)

library(datasets())
attach(airquality)
View(airquality)


sdf<-split(airquality,airquality$Month)
sdf
table(airquality$Month)

str(sdf)


#month is a factor variable so it can be split
#split function only if the data set has factor variable
#and it can be only against factor variable



lapply(sdf,function(x)
{
colMean([x,c("Ozone","Solar.R",Wind")])
})

column_means_list <- lapply(sdf, function(x) {
  colMeans(x[, c("Ozone", "Solar.R", "Wind"), drop = FALSE])
})

col_mean <-lapply(sdf, function(x){
  colMeans(x[, c("Ozone", "Solar.R", "Wind"), drop = FALSE])
})
col_mean


# Print the column means for each month
print(column_means_list)



sapply(sdf,function(x)
{
colMeans(x[,c("Ozone","Solar.R",Wind")])
})

s_apply <- sapply(sdf, function(x){
  colMeans(x[,c("Ozone","Solar.R","Wind"), drop = FALSE])
})
s_apply

s_apply <- sapply(sdf, function(x){
  sapply(x[,c("Ozone","Solar.R","Wind"), drop = FALSE], sd)
})

s_apply


numbers_list <- list(a = 1:5, b = 6:10, c = 11:15)
n_list= list(a= 1:5, b =6:10, c= 11:15)
result <-lapply(n_list, mean)
result
result <- lapply(numbers_list, mean)
result
typeof(result)

numbers_list <- list(a = 1:5, b = 6:10, c = 11:15)
result <- sapply(numbers_list, mean)
result


mat <-matrix(1:9, nrow=3)
mat
row_sum<-apply(mat,1,sum)
row_sum


exam - Palmearpenguins





data()






geoms()
-----------

mtcars[1:5]

mtcars[c(1:5,1)]
mtcars[c(1:5),"mpg"]
head(mtcars,5)

mtcars[c(1:5),]
dim(mtcars)


find value of 30th row and 4th column

mtcars[c(30),4]
View(mtcars)



hist(mtcars$mpg, breaks=10, col="yellow", ylab="miles per gallon",
	main="histogram of miles per galllon")


hist(mtcars$mpg, breaks=30, col="yellow", clab="miles per gallon",
	main="histogram of miles per galllon")

hist(mtcars$mpg, breaks=5, col="yellow", clab="miles per gallon",
	main="histogram of miles per galllon")


abline(v=mean(mtcars$mpg),col="red",lwd=10)
abline(v = mean(mtcars$mpg), col= "steelblue", lwd=10)
abline(v = median(mtcars$mpg), col="steelblue", lwd=10)

abline(v=median(mtcars$mpg),col="red", lwd=5)
#it ddraws a line throught mean

abline(v=median(mtcars$mpg),lwd=2)





subset
---------

eff_cars<-subset(mtcars, mpg>23)
eff_cars

nrow(eff_cars)
?subset

eff_car<-subset(mtcars, mpg>30 & hp>100)
eff_car

k<-subset(mtcars, mpg<14 & disp>375)
k

boxplot(mtcars$mpg, col="Green")
abline(h = mean(mtcars$mpg, lwd=5)
abline(h=mean(mtcars$mpg), lwd=5)


boxplot(mpg~am, data=mtcars,col = c("green","yellow"),
	main="mpg by transmission")


boxplot(mpg~cyl, data=mtcars, col=c("green","yellow","red"),
	main="which cylynder is better")



bargraph
---------

attach(mtcars)
barplot(mtcars$cyl, col="steelblue", xlab= "Cylinder type", ylab="freequency")
barplot(table(mtcars$cyl), col="yellow", xlab="Cylimder type",
	ylab="frequency")

barplot(table(mtcars$am))






adjecent graph plot
we can plot many plots like this


par(mfrow=c(1,2))
boxplot(mpg~cyl, data=mtcars, col=c("green","yellow","red"),
	main="which cylynder is better",xlab="transmisiion type",
	ylab="milles per gallon")
barplot(table(mtcars$cyl), col="yellow", xlab="Cylimder type",
	ylab="frequency")
hist(mtcars$mpg, breaks=5, col="yellow", clab="miles per gallon",
	main="histogram of miles per galllon")




par(mfrow=c(3,1))
boxplot(mpg~cyl, data=mtcars, col=c("green","yellow","red"),
	main="which cylynder is better",xlab="transmisiion type",
	ylab="milles per gallon")
barplot(table(mtcars$cyl), col="yellow", xlab="Cylimder type",
	ylab="frequency")
hist(mtcars$mpg, breaks=5, col="yellow", clab="miles per gallon",
	main="histogram of miles per galllon")



par(mfcol=c(3,1))
boxplot(mpg~cyl, data=mtcars, col=c("green","yellow","red"),
	main="which cylynder is better",xlab="transmisiion type",
	ylab="milles per gallon")


plot(x = mtcars$wt, y= mtcars$mpg)
cor(mtcars$wt,mtcars$mpg)






counting the factor variable
-----------------------------
table(mtcars$am)

table(mtcars$cyl)


table(mtcars$cyl,mtcars$am)



getwd() to retrive files


create wroking directry as namepr

setwd("C:/Users//amalv//OneDrive//Desktop//prp")





describe(mtcars)