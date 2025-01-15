library(rattle)
library(cluster)
library(factoextra)
library(hopkins)
library(gridExtra)
library(purrr)
library(dbscan)
library(dendextend)


data("wine")

head(wine)
str(wine)

df <- wine
df <- na.omit(df)

df$Type <- as.numeric(df$Type)
df <- scale(df)
head(df)

df <- df[,-1]
df <- as.data.frame(df)
dim(df)


hopkins(df)


distance <- dist(df)
distance <- get_dist(x = df)

#fviz_dist(distance, df)
#fviz_dist(as.matrix(distance))


km1 <- kmeans(x = df,centers = 5,nstart = 25)
km2 <- kmeans(x = df, centers = 4, nstart = 25)
km3 <- kmeans(x = df, centers = 4, nstart = 25)
km4 <- kmeans(x = df, centers = 3, nstart = 25)

p1 <- fviz_cluster(km1, df, geom = "point") + ggtitle("k_1")
p2 <- fviz_cluster(km2, data = df, geom = "point")+ ggtitle("k_2")
p3 <- fviz_cluster(km3, data = df, geom = "point")+ ggtitle("k_3")
p4 <- fviz_cluster(km4, data = df, geom = "point")+ ggtitle("k_4")

grid.arrange(p1,p2,p3,p4, nrow=2, ncol=2)


print(km1$tot.withinss)


set.seed(123)
wss <- function(k){
  kmeans(x=df, centers = k,nstart = 10)$tot.withinss
}

k.values <- 1:15
wss_values <- map_dbl(k.values, wss)

plot(k.values, wss_values, type = "b",main = "wssplot", xlab = "no of clusters ", ylab = "ttotal within cluster sum of squares")


fviz_nbclust(x=df, kmeans ,method = "wss")
fviz_nbclust(x= df, kmeans, method = "silhouette")
fviz_nbclust(df , kmeans, method = "gap_stat")

fviz_nbclust(df , dbscan, method = "gap_stat")




#hierarchical clustering 
-------------------------------------
  
dis <- dist(df)

h1 <- hclust(dis,method = "ward.D")
h1


den1 <- df %>% dist %>% hclust(method = "ward.D2") %>% as.dendrogram
den2 <- df %>% dist %>% hclust(method = "complete") %>% as.dendrogram
den3 <- df %>% dist %>% hclust(method = "single") %>% as.dendrogram

dend_list <- dendlist("ward.D2" = den1,"complete" = den2, "single" = den3)

corrr <- cor.dendlist(dend_list)
corrr


#dbscan  
#--------------------  

kNNdistplot(df, k = 5)
abline(h = 3.36)


dbs <- dbscan(x = df, eps = 3.36, minPts = 3)
print(dbs)

fviz_cluster(dbs, data = df, geom = "point")

head(df)

dbs <- dbscan(x = df, eps = 2, minPts = 5)
print(dbs)

fviz_cluster(dbs, data = df, geom = "point")



dbs <- dbscan(x = df, eps = 2.5, minPts = 5)
print(dbs)

fviz_cluster(dbs, data = df, geom = "point")

