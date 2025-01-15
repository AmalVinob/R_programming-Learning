lets startttttt
----------------------
??openair
5 variable?
m7 tools

dependend var - response variable
independent - out come explaned by r^2


attach(algae)
??algae

library(abd)
attach(AlgaeCO2)

View(AlgaeCO2)
dim(AlgaeCO2)
algae<-AlgaeCO2

str(algae)


table(algae$treatment)
boxplot(growthrate~treatment)


library(dplyr)

algae_norm<-algae%>%	
	filter(algae$treatment == "normal CO2")

algae_norm
algae_high<-algae%>%	
	filter(algae$treatment == "high CO2")
algae_high


histogram(~treatment|growthrate, data=algae_high)

line???






after mosaic
library(mosaic)

attach(HELPrct)
View(HELPrct)
help<-HELPrct

mod<-lm(cesd~mcs, data=help)
summary(mod)
coef(mod)

par(mfrow=c(2,2))
plot(mod)

histogram(~residuals(mod), density=TRUE)
histogram(~residuals(mod))
qqmath(~residuals(mod))

how i can use central histogram??

qqmath(~resid(mod))
xyplot(resid(mod) ~ fitted(mod), type= c("p", "smooth", "r"),alpha=.5, 
cex=.3, pch=20)

library(car)
xyplot(residuals(mod)~ fitted(mod), type=c("p","smooth","r"))
scatterplot(resid(mod) ~ fitted(mod))

laverage?
par(mfrow=c(3,3))
mplot(mod, which=1)
mplot(mod, which=2)
mplot(mod, which=3)
mplot(mod, which=5)
mplot(mod, which=6)
mplot(mod, which=7)
mplot(mod, which=4)

dev.off()


hwwwwwwwwwwwwwwwwwwwww

model equatio for 
linear model or linear regression
if one of  the variable is a  factor variable the write its equation????
how equation change  from - y = B0 + b1x


a) x is a factor variable with 2 levels
b) x is a factor variable with morethan 3 variable ?

least square aproximatuion
hwwwwwwwwwwwwwwwwwwwwwwwwwwww

what is predict function???
xyplot(help$cesd~ help$mcs, panel=panel.lmbands)
xyplot(cesd ~ mcs, panel= panel.lmbands)
if no of observation less than prediction then can we apply linear model?
ans - no 
wehave to lasoo regression and ridge - regularisation process)

forward selection method to identifu the variable.
backward elimination
mixed model
finding best subset of prediction?


------------------------------------------------------------------------------
assigment or hw -
identify the varios methods to slect the predictors in r programming

how do u know this variable playes important role in prediction

--------------------------------------------------------------------------------------


msummary(mod)
using this method identyfy oneindependend var - mcs find onemore variable 





predict(mod)


View(help)
names(help)

mod1<- lm(cesd~mcs+age, data=help)
msummary(mod1)
mplot(mod1, which=1)
mplot(mod1, which=2)



mod3<- lm(cesd~mcs+sex, data=help)
msummary(mod1)
mplot(mod3, which=1)
factor variable doesnt give any this we dont need factor var


mod2<- lm(cesd~mcs+female, data=help)
msummary(mod2)
mplot(mod1, which=1)




logisctic regression - glm

we can find odd ratio in mosaic

oddsRatio(tally(~(homeless == "housed")+sex, data=help))
> oddsRatio(tally(~(homeless == "housed")+sex, data=help))
[1] 0.625276
less than 1 is success is less likely than failure

inspect(mtcars)
fav_stats(mtcars)




renaming a varible
----------------------
attach(CPS85)
names(CPS85)#play with models
cps<-CPS85

faithful<- rename(faithful,
		duration= eruptions,
		time_till.next= waiting)
faithful <- rename(faithful,
		duration= eruptions,
		

names(faithful)


attach(Mroz)
names(Mroz)

1.
Mroz<-rename(Mroz,
	age_5=k5,
	age6_18=k618)
glimpse(Mroz)

not - a factor variable

3.
lfp_no<-filter(Mroz, lfp=="no")
lfp_yes<-filter(Mroz, lfp=="yes")

tally(lfp_no$lfp)
tally(lfp_yes$lfp)

histogram(~age_5|lfp, data=Mroz)
histogram(~age6_18|lfp, data=Mroz)
histogram(~age_5|lfp, data=Mroz)

