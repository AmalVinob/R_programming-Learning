x <-15
y <-20

is_greater <- x>y
is_lessthan <- x<y

is_greater
is_lessthan

class(is_greater)

v1 <-c(1,2,3,4,5)
v2 <-c(7,8,9,3,2)
v3 <-v1<v2
v3


vec <-c(1,2,3,4,5)
append(vec,6:8)


a <-list(12,18,200,85,-32)
x<-length(a)
x
voters<-list()
for(i in 1:x){
	if(a[i]>=18){
		voters<-append(voters,paste(a[[i]],"=Eligible for voting"))
	}else if(a[i]<=0 || a[i]>=120){
		voters<-append(voters,paste(a[[i]],"=Give a valid age !!!!"))
	}else{
		voters<-append(voters,paste(a[[i]],"=Not eligible for voting"))
	}
}
voters
print(voters)
class(voters)
names(voters)<-a
voters

a <-list(12,18,23,85,3)
x<-length(a)
x
voters<-list()
voters<-append(voters,a)
voters

a <-20
if(a > 18)
print("eligible for vote")



b <-list(12,18,23,85,3)
b<-append(b,5)
b






name cats hw
-----------------
cats<-c(2,4,6)
names(cats)<-c("simba","iza","max")
cats

cats<-cats*2
cats


groceries<-c(2.5,2.1,5.3,9.1)
groceries
names(groceries)<-c("bread","milk","biscut","jam")
groceries
barplot(groceries)




a <-list(12,18,200,85,-32)
x<-length(a)
x
voters<-list()
for(i in 1:x){
	if(a[i]<=0 || a[i]>=120){
		voters<-append(voters,paste(a[[i]],"=Give a valid age !!!!"))
	}else if(a[i]>=18){
		voters<-append(voters,paste(a[[i]],"=Eligible for voting"))
	}else{
		voters<-append(voters,paste(a[[i]],"=Not eligible for voting"))
	}
}
voters


