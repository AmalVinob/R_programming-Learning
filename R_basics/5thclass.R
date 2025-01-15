a <-c(1,2,3)
ls()

b <-c("a","b","v")
ls()

survey<-c(apple=40,kiwi=15,grape=30,babana=50,pear=20,orangre=30)
pie(survey,
	col='steelblue',
	density=20,
	angle = 30*1:6)

library(plotrix)

?plotrix

pie3D(survey,
	#col=c("steelblue4","steelblue","steelblue3","steelblue2","steelblue1"),
	labels = names(survey),
	labelcex = 1,
	explode = 0.1,
	theta = 0.8,
	main = "3D Pie Chart")


---------------------------------------------------------
?factor


# Create a vector of categorical data
gender <- c("Male", "Female", "Male", "Female", "Male")

# Convert the vector into a factor
gender_factor <- factor(gender)

# View the levels of the factor
levels(gender_factor)





factor(1:3, level=1:5)


factor(c("a","b","c"), level=c("a","b","c"), exclude="b")


factor(1:5, exclude=2)


temp <-data.frame(day=seq(1:10), min=c(50.9,30.9,13.5,23.4,5.2,67.2,85,23,15.6,34.5))
temp

mean(temp$min)
boxplot(temp)


# Create a data frame with sample data
data_frame <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David", "Eve"),
  Age = c(25, 30, 22, 35, 28),
  Score = c(92, 88, 75, 96, 85)
)

# Display the data frame
print(data_frame)




data()
attach(mtcars)
View(mtcars)


plot(cars)

plot(mtcars)