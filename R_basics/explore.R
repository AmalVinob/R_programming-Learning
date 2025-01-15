pipe -> %>%

data(mtcars)
attach(mtcars)

View(mtcars)

a <-filter(mtcars,carb>1)
a

b <-group_by(a,cyl)
b

c <-summarize(b,Avg_mean = mean(mpg))
c

d <-arrange(c,desc(Avg_mean))
d
#desc-desending order

#dbl--- double


we can use pipe for thisss
library(dplyr)
mtcars %>%
	filter(carb>1)%>%
	group_by(cyl)%>%
	summarise(Avg_mpg = mean(mpg))%>%
	arrange(desc(Avg_mpg))

mtcars %>%
	filter(carb>1)%>%
	group_by(cyl)%>%
	summarise(avg_mpg = mean(mpg))%>%
	arrange(avg_mpg)



pipe operators can be used to add, substrat and multipy
?magrittr::add
extract first four columns of mtcars
library(magrittr)

mtcars%>%
	extract(,1:4)%>%
	head
mtcars%>%
	extract(, "mpg")
?extract
head(mtcars[,1:4])

mtcars%>%
	extract(,"mpg")%>%
	multiply_by(2)

mtcars%>%
	extract(,"mpg")%>%
	add(2)


library(

explore package
----------------
library(explore)
mtcars%>%
	explore_tbl()

mtcars %>% describe()

mtcars %>%
	explore_all()

mtcars %>%
	explore_all(gear)
str(mtcars)

mtcars%>%
	select(gear, mpg, wt,hp, qsec,drat)%>%
	explore(target=gear)

names(mtcars)
mtcars%>%
	select("gear","mpg" , "cyl" , "disp" ,"hp" ,  "drat" ,"wt")%>%
	explore(target = gear)

x<-c(2.4,NA)
if_else(x<0, NA_integer_,x)


data<-mtcars %>%
	mutate(highmpg = if_else(mpg>23,10,0))%>%
	select(-mpg)
	data%>%explore(highmpg)








library(dplyr)

library(ggplot2)
mtcars%>%
	filter(carb>1)%>%
	ggplot(aes(x=wt, y=mpg), data=.)+geom_point()


can used for eda/statistics

data%>%
select(highmpg,drat,wt,qsec,vs)%>%
explore_all(target=highmpg)


data%>%
select(highmpg, gear, cyl,am)%>%
explore_all(target=highmpg)


names(mtcars)
mtcars%>%
	select(mpg, gear, cyl,am)%>%
	explore_all(target= mpg)



-----------
decision tree 
------------------

data%>%
explain_tree(target = highmpg)
