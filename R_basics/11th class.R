library(dataMaid)
attach(dataMide)
attach(mtcars)
View(mtcars)
makeDataReport(
mtcars,
output="html",
replace="TRUE")
str(mdf)
attach(dataMaid)

Create a data frame which consisting of 3 vector of length 7 first  two are 
character and next 1 is number repetetion is requried

mdf<-data.frame(a<-c("A","B","c","A","B","E","B"),
b<-c("AB","BA","AB","AC","AB","AB","BA"),
c<-101:107)

str

##write a function to compute the power of x till the length of the vector x
mdt<-data.table(a<-1:10,b<-21:30,c<-31:40)
sapply(mdt,class)

powfun<-function(x){

##moving Average of a data

MA<-function(x){
n<-length(x)
(x[1:(n-2)]+x[2:(n-1)]+x[3:(n)]/3)
}

A<-c(1,23,45,67,98)
MA(A)
##to pull out particular value of a paticular value
mtcars[1,]

attach(lynx)