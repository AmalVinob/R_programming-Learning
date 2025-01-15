library(ggplot2)
attach(mpg)
View(mpg)

dim(mpg)
?mpg
str(mpg)
sum(is.na(mpg))
summary(mpg)

df <-table(mpg$class)
df

class <-as.factor(mpg$class)
levels(class)

names(mpg)


mpg%>%
	ggplot(aes(class))+
	geom_bar()
str(mpg)


1.convert class, manufacter, cyl, trans, as factor variable

2. create a df consist of all above variable as well as model, displ&year

class1 <-as.factor(mpg$class)
manufacturer1 <-as.factor(mpg$manufacturer)
cyl1  <-as.factor(mpg$cyl)
trans1 <-as.factor(mpg$trans)

class(class1)

names(mpg)

o_data <- data.frame(class1, manufacturer1 ,cyl1 ,trans1 ,mpg$model,mpg$year,mpg$drv, mpg$cty, mpg$hwy, mpg$fl, mpg$displ)

str(o_data)
View(o_data)
str(mpg)
str(o_data)
summary(o_data)

summary(o_data$mpg.displ)


3.write numbers of factor variable(levels), continues variable
str(o_data)
from this we can see that there are 4 factor variable , 3 discrete, 1 continuous, and 3 character


4. are there any missing value
sum(is.na(o_data))

there are no missing values here.



5. create df - contain cars <15 years old

library(dplyr)
new_cars<- o_data %>%
	filter(year >=2008)
class(new_cars)



6. delete unnessery variable uising minus sigh or 
str(o_data)
o_data <- select(o_data, c(-mpg.drv ,-mpg.hwy, -mpg.fl ))
str(o_data)


7.iqr,sd,etc
summary(o_data)
IQR(o_data$mpg.displ)


8.data visualisatio, 
	a() factor variable(bar)

o_data %>%
	ggplot(aes(x = class1, fill =class1))+
	geom_bar()+
	geom_text(
		aes(label = ..count..),
		stat = 'count', 
		position = position_stack(vjust = 0.5),
		size = 3
	)+
	labs( title= "type of cars", x = "car_type", y= "no : cars")+
	theme_minimal()+
	theme(axis.text.x = element_text(angle = 45, hjust = 1))



o_data %>%
	ggplot(aes(x = manufacturer1, fill =manufacturer1))+
	geom_bar()+
	geom_text(
		aes(label = ..count..),
		stat = 'count', 
		position = position_stack(vjust = 0.5),
		size = 3
	)+
	labs( title= "type of cars", x = "car_type", y= "no : cars")+
	theme_minimal()+
	theme(axis.text.x = element_text(angle = 90, hjust = 1))


o_data %>%
	ggplot(aes(x = cyl1, fill =cyl1))+
	geom_bar()+
	geom_text(
		aes(label = ..count..),
		stat = 'count', 
		position = position_stack(vjust = .5),
		size = 3
	)+
	labs( title= "type of cars", x = "cylinder", y= "count")+
	theme_minimal()+
	theme(axis.text.x = element_text(angle = 45, hjust = 1))




	b () continues variable(histo)

o_data%>%
	ggplot(aes(x <-mpg.displ)+
	geom_hist()



ggplot(o_data, aes(hwy))+geom_histogram(fill= "red",binwidth=3, color="steelblue")+
ggtitle("Highway miles per gallon")

ggplot(o_data, aes(mpg.cty ))+geom_histogram(fill= "red",binwidth=3, color="steelblue")+
ggtitle("Highway miles per gallon")



9. identifi outliers






10.







11. identify the no of cars in this age
table(o_data$mpg.year)

car_counts_per_year <- o_data %>%
  group_by(mpg.year) %>%
  summarise(count = n())
print(car_counts_per_year)


View(o_data)
?mpg

str(o_data)
df_l15 <- subset(o_data, year>=2008)
str(df_l15)



df_y15 <-o_data%>%
	filter(year>=2008)

View(df_y15)



library(dplyr)


car_counts_per_year <- o_data %>%
  group_by(year) %>%
  summarise()

View(df_l15)

















library(dplyr)

# Sample data
data <- data.frame(
  year = c(2010, 2010, 2011, 2011, 2011),
  class = c("A", "B", "A", "C", "B")
)

# Group by year and calculate the count of observations (cars) for each year
counts_per_year <- data %>%
  group_by(year) %>%
  summarise(count = n())

print(counts_per_year)

