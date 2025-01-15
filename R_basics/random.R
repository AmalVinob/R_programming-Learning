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



