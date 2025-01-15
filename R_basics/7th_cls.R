pipe -> %>%

data(mtcars)
attach(mtcars)

View(mtcars)

library(dplyr)
?dplyr
a <-filter(mtcars,carb>1)
a

b <-group_by(a,cyl)
b
View(b)

c <-summarize(b,Avg_mean = mean(mpg))
c

d <-arrange(c,desc(Avg_mean))
d
#desc-desending order

#dbl--- double


we can use pipe for thisss
mtcars %>%
	filter(carb>1)%>%
	group_by(cyl)%>%
	summarise(Avg_mpg = mean(mpg), avg_median = median(mpg))%>%
	arrange(desc(Avg_mpg))



pipe operators can be used to add, substrat and multipy
?magrittr::add
extract first four columns of mtcars
library(magrittr)

mtcars%>%
	extract(,1:4)%>%
	head

mtcars%>%
	extract(,"mpg")%>%
	multiply_by(2)

mtcars%>%
	extract(,"mpg")%>%
	add(2)



library(ggolot2)
mtcars%>%
	filter(carb>1)%>%
	qqplot(x=wt, y=mpg, data=.)


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

mtcars%>%
	select(gear, mpg, wt,hp, qsec,drat)%>%
	explore(target=gear)


x<-c(2.4,NA)
if_else(x<0, NA_integer_,x)


data<-mtcars %>%
	mutate(highmpg = if_else(mpg>23,10,0))%>%
	select(-mpg)
	data%>%explore(highmpg)













can used for eda/statistics

data%>%
select(highmpg,drat,wt,qsec,vs)%>%
explore_all(target=highmpg)

data%>%
select(highmpg, gear, cyl,am)%>%
explore_all(target=highmpg)


View(mtcars)
-----------
decision tree 
------------------

data%>%
explain_tree(target = highmpg)


df_str(status(mtcars))





data(trees)
attach(trees)
View(trees)

head(trees)




class(trees)
dim(trees)
h_mean = mean(trees$Height)
h_mean
h_median = median(trees$Height)
h_median





trees%>%
	explore_tbl()

trees%>%	
describe()

trees%>%
explore_all()


trees %>%
	explore_all(Girth)

trees%>%
	select(Girth,Height,Volume)%>%
	explore(target=Girth)
