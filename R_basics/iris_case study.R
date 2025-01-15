iris

library(ggplot2)
library(dplyr)
library(explore)
attach(iris)
View(iris)



summary(iris)
names(iris)


iris %>%
	explore_all()

explore(iris)
explore_all(iris)

explore_all(iris$Sepal.Length)

iris%>%
describe()

nrow(iris)
str(iris)


iris%>%
	select(Sepal.Length,Sepal.Width)%>%
	explore(target = Sepal.Width) 

iris%>%
	select(Sepal.Length,Sepal.Width)%>%
	explore_all(target = Species) 

iris%>%
	explore(Sepal.Length, target= Species)


x <- subset(iris, 


iris%>%
	select(Sepal.Length,Sepal.Width)%>%
	explore(targetpct = Sepal.Width) 


table(iris$Species)


iris[19:20,]

new_df <- iris%>%
	filter(Sepal.Length>4)

new_df

iris%>%
	ggplot(aes(x <- Sepal.Length, y<- Sepal.Width))+
	geom_point()
	


library(ggplot2)

# Create a sample data frame with a continuous variable 'x'
data <- data.frame(x = rnorm(100))

iris%>%
	ggplot(data, aes(x = "Sepal.Width")) +
  		geom_histogram(binwidth = 0.5, fill = "blue", color = "black") +
  		labs(title = "Histogram of sepal width", x = "Value", y = "Frequency")




iris1<- iris%>%
	select(-Species)

summary(iris1)


iris1<- iris%>%
	subset(iris, select=c(Sepal.Length ,Sepal.Width,Petal.Length ,Petal.Width))  

summary(iris1)




