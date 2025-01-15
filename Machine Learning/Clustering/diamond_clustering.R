library(cluster)
library(gridExtra)
library(factoextra)
library(tidyverse)


data("diamonds")
diamonds

df <- diamonds
df <- na.omit(df)

df$cut <- as.numeric(df$cut)
df$color <- as.numeric(df$color)
df$clarity <- as.numeric(df$clarity)

df <-scale(df)
head(df)


sampled_df <- sample(df, size = 5000)
sampled_df
sampled_df <- df[sample(1:nrow(df), 5000),]
sampled_df


disctance <- get_dist(sampled_df)
disctance

fviz_dist(disctance,gradient = list(low='green', mid='white',high = 'red'))


k1 <- kmeans(sampled_df, centers = 2, nstart = 25)
fviz_cluster(k1, data = sampled_df)


k2 <- kmeans(sampled_df, centers = 3, nstart = 25)
fviz_cluster(k2, data = sampled_df)

k3 <- kmeans(sampled_df, centers = 4, nstart = 25)
fviz_cluster(k3, data = sampled_df)

k4 <- kmeans(sampled_df, centers = 5, nstart = 25)
fviz_cluster(k4, data = sampled_df)


p1 <- fviz_cluster(k1, geom = "point", data =sampled_df) + ggtitle("K=2")
p2 <- fviz_cluster(k2, geom = "point", data = sampled_df) + ggtitle("K=3")
p3 <- fviz_cluster(k3, geom = "point", data = sampled_df) + ggtitle("K=4")
p4 <- fviz_cluster(k4, geom="point",data=sampled_df) + ggtitle("K=5")

grid.arrange(p1, p2,p3, p4, nrow=2, ncol=2)


wss_func <- function(k)
  {
    kmeans(sampled_df, k, nstart = 25)
  }

k.values <- 1:15
wss_values <-map_dbl(k.values,wss_func)

plot(k.values, wss_values, type='b',pch=19, frame=FALSE, xlab="no of clusters", ylab="total within - cluster sum of squares")














k.values <- 1:15

wss_values <- map_dbl(k.values, wss_func)

plot(k.values, wss_values, type = "b", pch=19, frame=FALSE, xlab = "No. of Clusters",ylab="Total Within- Cluster sum of squares")


