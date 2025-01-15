library(factoextra)
library(cluster)

library(gower)

a <- c(1,2,3,4)
b <-c(4,2,1,7)
gower_dist(a,b)

data("iris")
iris

d1 <- iris[1:10,]
d2 <- iris[6:15,]
d1
d2
gower_dist(d1,d2)


dat1 <- dat2 <- iris[1:10,]
gower_dist(dat1,dat2)

gower_dist(iris)

data("iris")
df <- scale(iris[,-5])
df

dist <- dist(df)
dist
