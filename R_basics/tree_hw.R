
data(trees)
attach(trees)
View(trees)
dim(trees)

head(trees)

summary(trees)

0
class(trees)
dim(trees)
h_mean = mean(trees$Height)
h_mean
h_median = median(trees$Height)
h_median


library(magrittr)
library(explore)

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

data<-trees %>%
	mutate(avg_girth = if_else(Girth>13.25,10,0))%>%
	select(-Volume)
	data%>%explore(avg_girth)



class(trees)
str(trees)
