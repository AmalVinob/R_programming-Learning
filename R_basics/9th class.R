library(ggplot2)
attach(diamonds)
View(diamonds)

summary(diamonds)

library(dplyr)

diamonds%>%
	filter(x==0|y==0|z==0)%>%
	nrow()
diamonds%>%
	filter(x==0|y==0|z==0)%>%
	nrow()


missing_values <- rowSums(is.na(diamonds))
sum(missing_values)
sum(is.na(diamonds))

our_data<-diamonds%>%
	filter(x>0,y>0,z>0)


Ourdata<-diamonds%>%
	filter(x>0,y>0,z>0)
dim(Ourdata)

boxplot(Ourdata)



library(dplyr)

Ourdata%>%
	ggplot(aes(x,factor(1)))+
	geom_boxplot()+
	scale_y_discrete(breaks=NULL, labels=NULL, name= NULL)





Ourdata%>%
	ggplot(aes(y,factor(1)))+
	geom_boxplot()+
	scale_y_discrete(breaks=NULL, labels=NULL, name= NULL)



Ourdata%>%
	ggplot(aes(z,factor(1)))+
	geom_boxplot()+
	scale_y_discrete(breaks=NULL, labels=NULL, name= NULL)







summary(diamonds)


filter(y>20,z<10)



df<-Ourdata%>%
filter(y<20,z<10)
dim(df)








-------------------------------------


continues variable
----------------

carat
------
df%>%
ggplot(aes(carat))+
geom_histogram(binwidth=0.09)


quantile(df$carat, probs=0.99)

summary(df)




df<- df%>%
filter(carat<= quantile(df$carat, probs=0.99))
summary(df)


dim(df)


df%>%
	ggplot(aes(carat))+
	geom_histogram(binwidth = 0.09)
#tall parts are called spikes.

summary(df)

df%>%
	ggplot(aes(carat))+
	geom_histogram(binwidth=0.01)+
	scale_x_continuous(breaks= seq(0.2, 2.2, 0.1), minor_breaks = NULL)

there are a lot of splikes here.



df%>%
	ggplot(aes(price))+
	geom_histogram(binwidth = 50)

there is a long gap at 1500