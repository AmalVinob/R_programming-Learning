dataset(mtcars)
attach(mtcars)
View(mtcars)



mtcars[1:5,]

mtcars[1:5,"cyl"]

mtcars[c(1:5),]

mtcars[30,4]

hist(mtcars$mpg, col="steelblue", main="milage per gallon",
	xlab="mpg")

eff_cars <-subset(mtcars, mpg>23)
eff_cars

eff_cars <-subset(mtcars, mpg<20 & disp>150)
eff_cars

