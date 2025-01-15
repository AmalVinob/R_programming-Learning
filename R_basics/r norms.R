?xtabs
glm for logitic regression


?glm

library(stats)
?stats
??stats

??stones
??stone

library(mosaic)
\
?mosaic

attach(stones)
mosaicplot(stones, sort= 3:1) 


install.packages("DAAGxtras", dependency = TRUE)
library(DAAGxtras)

??DAAGxtras

dnorm ?
??qnorm - given the qumilative prob optaoin the normal deviate
?rnorm - take a random sample from theoretical distribution
?dnorm - to get density for theoretical dist
p norm - given a normal diveate optain the  qumilative probability 
qq norm - compare the wmpirical distribution of a set of values with a empirical normal distribution

# Calculate the density of the standard normal distribution at x = 1
density <- dnorm(1)
density

# Calculate the cumulative probability that a standard normal variable is less than 1
cumulative_prob <- pnorm(1)
cumulative_prob 
cumulative_prob <- pnorm(1, lower.tail= TRUE)
cumulative_prob 
cumulative_prob <- pnorm(1, lower.tail= FALSE)
cumulative_prob 
If lower.tail is set to TRUE, it returns the cumulative probability for values less than 
or equal to x; if set to FALSE, it returns the probability for values greater than x.


 
# Find the value (quantile) for a cumulative probability of 0.75 in the standard normal distribution
quantile_value <- qnorm(0.75)
quantile_value


qnorm(p, mean = 0, sd = 1, lower.tail = TRUE) calculates the quantile value x for a given cumulative probability p for a normal distribution with a specified mean and standard deviation.
It is essentially the inverse of pnorm.

# Create a Q-Q plot to check the normality of a dataset
qqnorm(rnorm(100))  # Plots a Q-Q plot for 100 random values from a standard normal distribution
qqnorm(rnorm(100))




Density, distribution function, quantile function and random generation for the normal distribution with mean equal to mean and standard deviation equal to sd.



q , plot density and qumilative prob curve for a normal dist with mean - 2.5, 
sd - 1.5

?curve

library(graphics)
?pnorm
curve(pnorm(x, 2.5, 1.5),from = 2.5 - 3*1.5, to = 2.5+ 3* 1.5)
curve(pnorm(x, 2.5, 1.5),from = 2.5 - 6*1.5, to = 2.5+ 3* 1.5)
w

library(MASS)
attach(Animals)

ani <-Animals
str(ani)
library(car)
library(mosaic)
View(ani)

histogram(x = body,density = TRUE)
plot(density(ani$body))


ani$body <- log10(ani$body)
plot(density(ani$body))



plot(density(ani$brain))
ani$brain <-log10(ani$brain)
plot(density(ani$brain))
density(ani$brain)

the plot is not normal so we can normal using boxcos 


create a randsom sample of 50 point

a <- seq(1:50)
a<- log10(a)
plot(density(a))


plot(density(rnorm(50)))
rnorm(50)
how to know wheratetr the data follows a std n d


