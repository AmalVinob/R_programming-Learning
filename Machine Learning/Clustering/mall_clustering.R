library(cluster)
library(factoextra)
library(gridExtra)
library(purrr)



setwd("D:\\alliance\\3rd sem\\machine learning_2\\DATASET\\archive (4)")

df <- read.csv("Shopping Mall Customer Segmentation Data .csv")
df

dim(df)

head(df)

df <- df[-1]
head(df)


DataExplorer::plot_bar(df)


summary(df$Spending.Score)

summary(df)

DataExplorer::plot_boxplot(df)

str(df)


boxplot(df$Spending.Score)


df <- na.omit(df)

df$Gender <- as.factor(df$Gender)
df$Gender <- as.numeric(df$Gender)

df_spend <- df$Spending.Score



dist <- get_dist(df_spend)
k1 <- kmeans(x = df, centers = 5, nstart = 25)
fviz_cluster(k1,data = df)


df_scale <- scale(df)
k1 <- kmeans(x=df_scale, centers = 5, nstart = 25)
fviz_cluster(k1,data = df_scale)


df_spend_sc <- scale(df_spend)
k2 <- kmeans(x=df_spend_sc, centers = 5, nstart = 25)
fviz_cluster(k2,data = df)

optimal_k <- 3  # Replace with your determined number of clusters
kmeans_result <- kmeans(df_spend_sc, centers = optimal_k, nstart = 25)
data$Cluster <- kmeans_result$cluster


##kmeans

head(df_scale)

set.seed(123)



iss<- function(k){
  kmeans(df_scale[,2:4], k, iter.max = 100, algorithm = 'Lloyd')$tot.withinss
}

k.values <- 1 :10

iss_values <- map_dbl(k.values, iss)
iss_values

plot(k.values, iss_values,
     type = 'b')

?kmeans







