?dataset(mpg)



library(ggplot2)

attach(mpg)
View(mpg)
names(mpg)

ggplot(data=mpg, aes(x = displ, y=hwy, color="red"))+geom_point()

ggplot(data = mpg, aes(x =manufacturer, y=model, color="red")) + geom_point()



wgat is polar corrdinate



ggplot(data= mpg, aes(x= displ, y = hwy)) + 
facet_grid(. ~ cyl)+ 
geom_point()


 
ggplot(data= mpg, aes(x= displ, y= hwy)) + 
facet_grid(drv ~ .) + 
geom_point()



str(mpg)
names(mpg)


?glimpse


library(dplyr)
glimpse(mpg)



ggplot(data= mpg, aes(x= displ, y= hwy)) + 
facet_grid(drv ~ cyl) + 
geom_point()




ggplot(data= mpg, aes(x= displ, y= hwy)) + 
facet_grid(~class) + 
geom_point()

?themes


# geom_smooth

ggplot(data= mpg, aes(x= displ, y=hwy))+
geom_smooth()



ggplot(data= mpg, aes(x= displ, y= hwy)) + 
facet_wrap(~class) + 
geom_smooth()






attach(diamonds)
View(diamonds)

dim(diamonds)

names(diamonds)

factor(daimonds)

y = factor(diamonds$color)
levels(diamonds$color)
y

ggplot(data = 




summary(diamonds)


x<-c(1,2,3,4,5,NA,6,4,5)
summary(x)

nrow(diamonds)

diamonds%>%
	filter(x==0|y==0|z==0)%>%
	nrow()


Ourdata<-diamonds%>%
	filter(x>0,y>0,z>0)
dim(Ourdata)



summary(Ourdata)
boxplot(Ourdata)


