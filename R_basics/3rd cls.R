a <-c(1,2,3,4,5,6)

b <-a^2

a
b

plot(a,b)
attach(women)
View(women)

attendence <-65
dsa <-33

if(attendence >=80 & dsa >= 50){
	print("you are passed you have greater attendence and dsa")
}else{
	print("you are not passed")
}



1:10-1
1:(10-1)
1:9

x <-matrix(1:6, 2, 3)
x

x<- matrix(seq(1:9), 3, 3)
x

y<-matrix(1:9,3,3)
y
typeof(x)
class(x)
typeof(y)


n=5
fact= 1
while(n>0){
	fact <-fact*n
	print(fact)

	n = n-1
}
print(fact)


k <-c(1,2,3,4,66,78,9)
diff(k)

k <-c(k,12)
k

append(1:6,0:2,after=3)

append(1:5,0:1,after = 3)


append(1:5, 5, after= 3)


l<-c()
l
type(l)
length(l)

k <-c(1,2,3,4,66,78,9)
min(k)
max(k)
which.min(k)
which.max(k)

x<-k
any(x > 10)
all(x>10)

a <-c(1,4,55,66,23,45)
any(a>15)

all(a<10)

which(all(a<10))

cats <-c(2,6,7)
cats
barplot(cats)



x<-c(1,2,3)
names(x)<-c("h","j","i")
x
names(x)
rownames(x)<-c("a")

x <- matrix(1:6, 3, 2)
x
rownames(x)<-c("a","b","c")


y <- c(1,2,3,4,5)
names(y)<-c("a","b",5,"z",7)
plot(y)
barplot(y)


cats <-c(2,6,7)
cats
names(cats)<-c("hussu","kaif","gaur")
barplot(cats)

cats[2]<-12
cats



x<-seq(1,20,.1)
x

rep(3, times=20)
y<-sqrt(x)
y

plot(x,y)

cats<-c(2,4,6)
names(cats)<-c("simba","iza","max")
cats

cats<-cats*2
cats


rep(c(3,5), times=5)
rep(c(3,5), each=5)






