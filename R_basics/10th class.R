library(ggplot2)
attach(diamonds)
View(diamonds)

summary(diamonds)

library(dplyr)


Ourdata<-diamonds%>%
	filter(x>0,y>0,z>0)
dim(Ourdata)

df<-Ourdata%>%
filter(y<20,z<10)
dim(df)




df%>%
	ggplot(aes(price))+
	geom_histogram(binwidth = 50)

par(mfrow= c(1,3))
df%>%
	ggplot(aes(price))+
	geom_histogram(binwidth = 50)
df%>%
	ggplot(aes(price))+
	geom_histogram(binwidth = 50)




factor/discrete
---------------------

plot_bar <-function(var, data= df){
	Ourdata%>%
	ggplot(aes({{var}}))+
	geom_bar()
}

plot_bar(clarity)
plot_bar(color)
plot_bar(cut)



#the best clarity classess are relatively rare and most diamonds 
#are in the ST1 category , the third worst. there are 
#also very few diamonds with the most clarity, T1


#find more about the data - search dataset, variables etc
# take  your time to undeerstandd the data


HW - arrange the bar diagram in asending or decending order



find the realation ship between price and carat

scatter_plot = <-function(var1,var2 data= df){
	Ourdata%>%
	ggplot(df, aes(x = price, y =color)) +
 	geom_point() +  
 	labs(x = "price", y = "color", title = "Scatter Plot")

}

plot(x=diamonds$price, y=diamonds$color)
plot(x=diamonds$price, y=diamonds$cut)
plot(x=diamonds$price, y=diamonds$color)
plot(x=diamonds$price, y=diamonds$cut)


ggplot(df, aes(x = price, y =carat)) +
  geom_point() +  
  labs(x = "price", y = "color", title = "Scatter Plot")




