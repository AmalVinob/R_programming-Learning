
points <- list(c(2,10), c(2,5), c(8,4), c(5,8), c(7,5), c(6,4), c(1,2))

a<- matrix(0,nrow = length(points), ncol = length(points))

eucledien <-function(x, y){
  return(sqrt(sum((x - y)^2)))
}

for(i in 1:length(points)){
  for(j in 1:length(points)){
    a[i, j]<-eucledien(points[[i]],points[[j]])
  }
}

non_zero <- a[a!=0]
mini <- min(non_zero)
mini

a

rownames(a) <- paste(points)
colnames(a) <- paste(points)
print("Original Matrix:")
print(a)



