2+3
5-6
3-2
2*5
5/2
5%2
log(3)
log2(3)
2^(log2(3))
2^10


x <-c(1,2,3,4)
x

y <-c("a","b","c")
y

str(x)
class(x)
class(y)
sum(x)
mean(x)
sd(x)
5/0
5*2


mark <-c(95,75,65,85,50,58,87,95,75,86,96,66)
mean(mark)

mean_mark <-sum(mark)/length(mark)
mean_mark

mean(mark)
median(mark)

z<-x
z

obj_addr(x)
library(lobstr)

obj_addr(x)

a <-c(5,6,7,9,12)
b <-c(13,19,20,21,23)
a
b
ab <-cbind(a,b)
ab

ac <-rbind(a,b)
ac

c <-c(5,4)
d <-c(6,4)
f <-c(8,5)

cd <-rbind(c,d,f)
cd

add <- function(a,b){
	a+b
}
add(2,3)


mul <- function(a,b){
	a*b
}
mul(5,6)


facter <-function(n){
if(n==1 | n==0){
return(1)
}
else{
return(n*fact(n-1))
}
}
a <-5
facter(a)




a <-C(1,2,3,4)
a