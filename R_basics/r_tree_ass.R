data(trees)
attach(trees)
View(trees)

summary(trees)

mean_girth <- mean(trees$Girth)
mean_girth

median_girth <- median(trees$Girth)
median_girth

sd_girth <- sd(trees$Girth)
sd_girth

mean_height <- mean(trees$Height)
mean_height

median_height <- median(trees$Height)
median_height

sd_height <- sd(trees$Height)
sd_height

mean_volume <- mean(trees$Volume)
mean_volume

median_volume <- median(trees$Volume)
median_volume

sd_volume <- sd(trees$Volume)
sd_volume




cat("Girth - Mean:", mean_girth, " Median:", median_girth, " SD:", sd_girth, "\n")


cat("Height - Mean:", mean_height, " Median:", median_height, " SD:", sd_height, "\n")


cat("Volume - Mean:", mean_volume, " Median:", median_volume, " SD:", sd_volume, "\n")

data(trees)
attach(trees)
View(trees)

boxplot(trees$Girth,trees$Height,trees$Volume, main="Girth- height- volume")
trees<-attach(trees)
hist(trees$Girth,
	col='steelblue',
	main='Histogram',
	xlab='Girth',
	ylab='Frequency')

hist(trees$Height,
	col='steelblue',
	main='Histogram',
	xlab='height',
	ylab='Frequency')

hist(trees$Volume,
	col='steelblue',
	main='Histogram',
	xlab='volume',
	ylab='Frequency')



plot(trees$Height,trees$Girth,col="steelblue")
plot(trees$Height,trees$Volume,col="steelblue")

attach(trees)
library(dplyr)
trees%>%
	select(Girth,Height,Volume)%>%
	explore(target=Girth)

trees%>%
	explore_tbl()


library(e1071)
# Example data
data <- c(10, 15, 20, 25, 30, 35, 40, 45, 50, 55)

# Calculate skewness
skew <- skewness(trees$Girth)
print(skew)
skew <- skewness(trees$Height)
print(skew)
skew <- skewness(trees$Volume)
print(skew)


install.packages("moments")
library(moments)
kurt <- kurtosis(trees$Girth)
kurt

kurt <- kurtosis(trees$Height)
kurt

kurt <- kurtosis(trees$Volume)
kurt