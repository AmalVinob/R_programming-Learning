attach(mtcars)
View(mtcars)
dim(mtcars)
attach(iris)
makeDataReport(iris)
makeDataReport(
 data=mtcars$cyl,
 outputDir=NULL,
 codebook=TRUE,
 summary=TRUE)

###QUESTION 1
mdf<-data.frame(a<- c("a","s","d","m","n","o","t"),
b<- c("k","a","n","a","t","e","k"),d<- c(12,13,32,12,43,54,62))
mdf
str(mdf)
sapply(mdf,class)
##2.
gt<-data.table(a<- c("a","s","d","m","n","o","t"),
b<- c("k","a","n","a","t","e","k"),d<- c(12,13,32,12,43,54,62))
sapply(gt,class)
matcars
##3.
powf<-function(x){
 x^(1:length(x))
}
powf(3:8)

##4.
MA<- function(x){
 n<- length(x)
 (x[1:(n-2)]+x[2:(n-1)]+x[3:n])/3
}
z=c(1,3,4,6,9)
MA(z)

##
MAX<- function(x){
 n<- length(x)
 (x[1:(n-4)]+x[2:(n-3)]+x[3:(n-2)]+x[4:(n-1)]+x[5:n])/5
}
s=c(2,4,3,2,6,7)
MAX(s)