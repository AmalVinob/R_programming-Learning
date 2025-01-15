data(airquality)
attach(airquality)
View(airquality)

dim(airquality)

col(airquality)
summary(airquality)



boxplot(airquality$Ozone,airquality$Solar.R,airquality$Wind,airquality$Temp,airquality$Month,airquality$Day,names=c("Ozone","solar.R","wind","temp","Month","Day"))




library(moments)
library(e1071)

skew <- skewness(airquality$Ozone)
print(skew)

skew <- skewness(airquality$Solar.R)
print(skew)

skew <- skewness(airquality$Wind)
print(skew)

skew <- skewness(airquality$Temp)
print(skew)

skew <- skewness(airquality$Month)
print(skew)

skew <- skewness(airquality$Day)
print(skew)








kurt <- kurtosis(airquality$Ozone)
print(kurt)

kurt <- kurtosis(airquality$Solar.R)
print(kurt)

kurt <- kurtosis(airquality$Wind)
print(kurt)

kurt <- kurtosis(airquality$Temp)
print(kurt)

kurt <- kurtosis(airquality$Month)
print(kurt)

kurt <- kurtosis(airquality$Day)
print(kurt)



hist(airquality$Ozone,
	col='steelblue',
	main='Histogram',
	xlab='Ozone',
	ylab='Frequency')

hist(airquality$Temp,
	col='steelblue',
	main='Histogram',
	xlab='Temp',
	ylab='Frequency')


hist(airquality$Wind,
	col='steelblue',
	main='Histogram',
	xlab='wind',
	ylab='Frequency')


hist(airquality$Day,
	col='steelblue',
	main='Histogram',
	xlab='day',
	ylab='Frequency')




