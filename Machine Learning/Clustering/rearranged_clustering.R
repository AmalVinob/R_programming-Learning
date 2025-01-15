library(cluster)
library(tidyverse)
library(factoextra)
library(gridExtra)


data("iris")
head(iris)

str(iris)

df <- iris
df$Species <- as.numeric(df$Species)
head(df)


df_scaled <- scale(df[, -5])

k1 <- kmeans(df_scaled,centers = 3)
k1

fviz_cluster(k1, data = df_scaled)


df_cluster <- as.data.frame(df_scaled)
df_cluster$cluster <- as.factor(k1$cluster)

head(df_cluster)


set.seed(42)
k1 <- kmeans(df_scaled, centers = 3)
df_clustered <- data.frame(df_scaled)
df_clustered$Cluster <- as.factor(k1$cluster)


set.seed(42) 
df_scaled_shuffled <- df_scaled[sample(nrow(df_scaled)), ]
k1_shuffled <- kmeans(df_scaled_shuffled, centers = 3)

# Check if clusters match
table(df_clustered$Cluster, k1_shuffled$cluster)


table(iris$Species)
