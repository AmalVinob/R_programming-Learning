??USArrests
?USArrests

data("USArrests")
head(USArrests)
dim(USArrests)

sum(is.na(USArrests))
str(USArrests)

library(cluster)
library(tidyverse)
library(factoextra)
library(gridExtra)

help(factoextra)
?factoextra
??factoextra


df <- USArrests
df <- na.omit(df)
head(df)
df <-scale(df)
head(df)

distace <- get_dist(x = df)
distace

# drawing the distance matrix
fviz_dist(distace, gradient = list(low='green', mid='white',high = 'red'))


#fviz_dist(distace, gradient = list(low= "#00AFBB", mid = "white", high = "#FC4E07"))

fviz_dist(distance, gradient = list(low = "#00AFBB", mid = "white", high = "#FC4E07"))




k2 <- kmeans(df, centers =2, nstart = 25)
str(k2)


k2 <-kmeans(x = df, centers = 2, nstart = 25)
fviz_cluster(k2, data=df)

k3 <- kmeans(df, centers = 3, nstart = 25)
k4 <- kmeans(df, centers = 4, nstart = 25)
k5 <- kmeans(df, centers = 5, nstart = 25)
str(k3)
str(k4)
str(k5)

p1 <- fviz_cluster(k2, geom = "point", data =df) + ggtitle("K=2")
p2 <- fviz_cluster(k3, geom = "point", data = df) + ggtitle("K=3")
p3 <- fviz_cluster(k4, geom = "point", data = df) + ggtitle("K=4")
p4 <- fviz_cluster(k5, geom="point",data=df) + ggtitle("K=5")

library(gridExtra)
grid.arrange(p1,p2,p3,p4, nrow = 2)

set.seed(123)
wss <- function(k){
  kmeans(df, k ,nstart = 10)$tot.withinss
}

k.values <- 1:15

wss_values <- map_dbl(k.values, wss)

plot(k.values, wss_values, type = "b", pch=19, frame=FALSE, xlab = "No. of Clusters",ylab="Total Within- Cluster sum of squares")


fivz_nbclust(df, kmeans, method = "wss")
fviz_nbclust(df, kmeans, method = "wss")

avg_sil <-function(k){
  km.res <-kmeans(df, centers = k, nstart = 25)
  ss <- silhouette(km.res$cluster, dist(df))
  mean(ss[, 3])
}

k.values <- 2 : 15

avg_sil_values <- map_dbl(k.values, avg_sil)

plot(k.values, avg_sil_values, 
      type = "b", pch = 19, frame=FALSE,
      xlab = "number of cluster K",
     ylab = "average silhouettes")

---------------------------------------------------------------
  #manhaten
data("USArrests")
sa <- sample(1:50, 20)
df <- USArrests[sa,]
df.scaled <- scale(df)


mann_dist <- get_dist(df.scaled, method = "manhattan")
round(mann_dist,2)

dist.mh <-dist(df.scaled, method = "manhattan")
round(as.matrix(dist.mh)[1:3,1:3], 2)

??dist
?dist
?daisy


