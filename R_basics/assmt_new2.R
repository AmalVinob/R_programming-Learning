source("http://www.openintro.org/stat/data/cdc.R")

1,
dim(cdc)
names(cdc)


2,
str(cdc)


3, 
plot(cdc)

4
numerical summary
-----------------
summary(cdc$height)
summary(cdc$weight)

IQR(cdc$height)
IQR(cdc$weight)

relative frequency distribution for genter and exerancy


View(cdc)
How many males are in the sample?
no_male <- sum(cdc$gender == "m")
no_male


What proportion 
of the sample reports being in excellent health?
table(cdc$genhlth)
nrow(cdc)
proportion_excel_hlt <-(sum(cdc$genhlth == "excellent") / nrow(cdc)) * 100
proportion_excel_hlt 



5,
library(mosaic)
mplot(gender ~smoke100, 1)
table(cdc$gender)
table(cdc$smoke100)
mosaicplot(table(cdc$smoke100,cdc$gender),main="masaic plot")




6. Extract just the data for the men in the sample using the function subset()
View(cdc)
cdc_men <-subset(cdc, gender == "m")
View(cdc_men)


7.. Extract just the data for the men and whose age is more than 30
age_more_30<- filter(cdc, age>30)
View(age_more_30)


8. Extract just the data for the men or age is more than 30

age_men_30 <- filter(cdc, age>30 & gender=="m")
View(age_men_30) 


9. Make a scatterplot of weight versus desired weight. Describe the relationship 
between these two variables
View(cdc)
library(car)
scatterplot(weight~wtdesire, cdc)

# we can say its a positive linear relation ship between weight and desired weight
#most of the people have weight & desired weight between 100 and 200, but there are people
# whose weight more than 250 
# most of the people have a desired weight but when it comes to the peoplw weight above 250
# they dont have a desired weight weight is much more than desired weight,



10. Let’s consider a new variable: the difference between desired weight 
(wtdesire) and current weight (weight). Create this new variable by 
subtracting the two columns in the data frame and assigning them to a new 
object called wdiff


cdc_1 <-mutate(cdc, wdiff = wtdesire - weight)
View(cdc_1)


11.11. What type of data is wdiff? If an observation wdiff is 0, what does this mean 
about the person’s weight and desired weight. What if wdiff is positive or 
negative?
a)
typeof(cdc_1$wdiff)
type is integer

b)when diff between desired weight and weight is 0 , that means the person have a perfect weight
  or the weight and desired weight are equal

c)there are positive and negative values , that means sometime weight is more than desired weiht
  and some time weight is less than desired weight



12. Describe the distribution of wdiff in terms of its center, shape, and spread, 
including any plots you use. What does this tell us about how people feel about 
their current weight?

View(cdc_1$wdiff)
hist(cdc_1$wdiff, breaks=20,main= "histogram of diff in weights", col="red")
boxplot(cdc_1$wdiff)
qqnorm(cdc_1$wdiff)




13. Using numerical summaries and a side-by-side box plot, determine if men tend 
to view their weight differently than women


men_differ <- filter(cdc, gender == "m")
women_differ <- filter(cdc, gender == "f")
summary(women_differ$weight)
summary(men_differ$weight)

boxplot(weight~gender, data=cdc)


we can see that min, mean and maximum weight of men is greater than women


#or



men_diff <- cdc_1$wdiff[cdc_1$gender == "m"]
women_diff <- cdc_1$wdiff[cdc_1$gender == "f"]
summary(men_diff)
summary(women_diff)

boxplot(weight~gender, data=cdc_1)

from the summary we can say the men tend to shape their body greater than women,
beacuse the average weight differenc eif men is less than women, implises that women is less
care of body fat than men



14. Now it’s time to get creative. Find the mean and standard deviation 
of weight and determine what proportion of the weights are within one 
standard deviation of the mean.
mean_w <- mean(cdc$weight)
sd_w <- sd(cdc$weight)

we have lower bound = mean - sd
&
we have upper bound = mean + sd
ie,

low_bound <- mean_w - sd_w
low_bound
upp_bound <- mean_w + sd_w

we have - 68% of the data falls within onesd, so we can say the lenght b/w this range is 68% 
so we div by total length 

length(cdc$weight)
weight_prop <- length(cdc$weight[cdc$weight >=low_bound & cdc$weight<=upp_bound])/length(cdc$weight)
weight_prop

len<-length(cdc$weight[cdc$weight >=low_bound & cdc$weight<=upp_bound])
len



or 

weight_new <- filter(cdc,weight >=low_bound & weight <=upp_bound)
weight_prop1 <- length(weight_new$weight) / length(cdc$weight)
weight_prop1


we god the same






