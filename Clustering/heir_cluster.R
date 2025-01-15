library(cluster)
library(factoextra)

data("USArrests")
df <- USArrests

head(USArrests)

df <- scale(USArrests)
head(df)

res.dist <- dist(df, method = "euclidean")


res.h2 <- hclust(res.dist, method = "ward.D2")


fviz_dend(res.h2, cex = 0.5)

fviz_dend(res.h2, cex = 0.5, color_labels_by_k = TRUE, k=4, rect = TRUE)


hpindistance

nc <- cutree(res.h2,  k=4)

head(nc)

nc

?fviz_dend


table(nc)

rownames(USArrests)[nc ==4]


?diana

diana(x = df, diss = inherits(df, "dist"), metric = "euclidean")







library(dplyr)
library(dendextend)
res.dist <- dist(df, method = "euclidean")
hc1 <- hclust(res.dist, method = "average")
hc2 <- hclust(res.dist, method = "ward.D2")
hc3 <- hclust(res.dist, method = "median")
hc4 <- hclust(res.dist, method = "ward.D")


den1 <- as.dendrogram(hc1)
den2 <- as.dendrogram(hc2)
den3 <- as.dendrogram(hc3)
den4 <- as.dendrogram(hc4)

dend_list = dendlist(den1, den2, den3, den4)
dend_list




tanglegram(den1, den2)


cor.dendlist(dend_list)



df <- df[sample(nrow(df), size = 20),]
dim(df)
df


res.dist <- dist(df)

hc1 <- hclust(res.dist, method = "ward.D2")
hc2 <- hclust(res.dist, method = "ward.D")

den1 <- as.dendrogram(hc1)
den2 <- as.dendrogram(hc2)

a <- fviz_dend(hc1, cex = 0.5)
b <- fviz_dend(hc1, cex= 0.5)

grid.arrange(a, b)




#how to compare multiple dendogram

dend1 <- df%>% dist %>% hclust("complete") %>% as.dendrogram
dend2 <- df%>% dist %>% hclust("single") %>% as.dendrogram
dend3 <- df%>% dist %>% hclust("centroid") %>% as.dendrogram
dend4 <- df%>% dist %>% hclust("average") %>% as.dendrogram


# computing correlation matrix
#library(igraph) for polyginic circlular hirerachical clustering
dend_list <- dendlist("complete" = dend1,
                      "single" = dend2,
                      "centroid" = dend3,
                      "average" = dend4)

corre <-round(cor.dendlist(dend_list), 2)
corre


library(igraph)

?igraph





 data("iris")
df <- scale(iris[,-5])
df

dist <- dist(df)

hc1 <- hclust(dist, method = "ward.D2")
fviz_dend(hc1, cex = 0.5)
 
library(corrplot)
corrplot(corre, "pie", "upper")
