start<- Sys.time()
a<-c(2,4,6,8,10,15)
which.min(a)
which.max(a)
median(a)
quantile(a)["25%"]
quantile(a)["50%"]
quantile(a)["75%"]
summary(a)

quantile(a)["25%"]


quantile(a)["25%"]
quantile(a)["75%"]
summary(a)

print(Sys.time() - start)


x<-matrix(seq(1:12), nrow=4, ncol=3)
x
z<-matrix(1:6,2,3)
z

z<-matrix(seq(1:12), nrow=4, byrow=TRUE)
z


a = matrix(seq(10:20), nrow= 2, ncol= 5)
a
a[2,2] = 3
a

w<-matrix(nrow=4, ncol=3)
w

w[1,1]<-3
w[2,2]<-4
w[3,3]<-9
w



a<-c(2,4,6,8,10,15,5,9,8)
a
class(a)

dim(a) <-c(3,3)
a


---------------------------



## running time of our project
time complexyty

start<- Sys.time()
a<-c(2,4,6,8,10,15,5,9,8)
summary(a)
fivenum(a)

print(Sys.time()-start)





a<- matrix(seq(1:20), nrow=5, ncol= 4)
a
summary(a)
print(Sys.time() - start)




---------------------------------------


library(datasets)

attach(iris)
View(iris)

dim(iris)
head(iris)
head(iris,3)
tail(iris)
names(iris)
summary(iris)
mean(iris$Sepal.Width)
min(iris$Sepal.Length)

IQR(iris$Sepal.Width)
a=quantile(iris$Sepal.Width)["25%"]
b=quantile(iris$Sepal.Width)["75%"]
b
a
b-a

sd(iris$Sepal.Width)

---------------------------------------------------
which.max(iris$Sepal.Width)
hist(iris$Sepal.Width,
	col="red",
	xlab= "sepal width",
	main= "histogram" ,
	xlim = c(1.8,5))


hist(iris$Sepal.Width, col="red", xlab="sepal width", ylab="akhil", main="heading")
abline(v = median(iris$Sepal.Width),lwd=10, col="yellow")


class(iris)
str(iris)

boxplot(Sepal.Length~Species, data=iris, col=c("red","yellow","blue"))

barplot(table(Species), data=iris)
dim(iris)

create hist

hist(iris$Sepal.Length,
	col='steelblue',
	main='Histogram',
	xlab='Length',
	ylab='Frequency')


create boxplot
-------------------

boxplot(Sepal.Length~Species,
	data=iris,
	main='Sepal length by species',
	xlab='Species',
	ylab='Sepal Length',
	col ='steelblue',
	border='black')


boxplot(Sepal.Length~Sepal.Width,
	data=iris,
	main ="box plot",
	xlab="sepal length",
	ylab="sepal width",
	col= "steelblue",
	border= "black")


pie(table(iris$Species))

-----------------------------------


survey <-c(apple=40,banana=50,orange=60,grape=20,mango=30)
survey
pie(survey,main="Fruits Availabilyty per dozen")
-------------------------------------------------------



apply funtion
----------------
                     
mat <-matrix((1:12), nrow=4)
mat

print(apply(mat,1,max))
#1 for row value, 2 for column

vect <-(2,4,6)
print(lapply(vect,addtwo))

sal <-c(8000,9000,50000,60000,75000)


print(Sys.time()-start)



apply
----------
mat <-matrix(seq(1:12), nrow = 4)
mat

row_sum <- apply(mat, 2, sum)
row_sum



lapply(list apply)
------------------
l = list(a = 25, b= 36, c= 49)
squrt <- lapply(l, sqrt)
squrt



sapply (simple apply, return like vectors or matrix)

my_list <- list(a = 16, b = 25, c = 36)
sqrt_vector <- sapply(my_list, sqrt)
print(sqrt_vector)




tapply() is used to apply a function over subsets of a vector, usually grouped by one or more factors. It returns an array.
---------------------

# Example: Applying mean() to a vector grouped by a factor
values <- c(10, 15, 12, 18, 25, 20)
factor <- c("A", "B", "A", "B", "C", "C")
mean_by_factor <- tapply(values, factor, mean)
print(mean_by_factor)


