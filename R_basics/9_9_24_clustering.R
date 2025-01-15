#manhaten
data("USArrests")
sa <- sample(1:50, 20)
df <- USArrests
df.scaled <- scale(df)


mann_dist <- get_dist(df.scaled, method = "manhattan")
round(mann_dist,2)

dist.mh <-dist(df.scaled, method = "manhattan")
round(as.matrix(dist.mh)[1:3,1:3], 2)

??dist
?dist
?daisy


library(factoextra)
data("flower")
flower
head(flower,3)

set.seed(134)
km.res <- kmeans(df.scaled, 4, nstart = 25)
print(km.res)

fviz_cluster(km.res, data = df.scaled)


aggregate(USArrests, by = list(cluster = km.res$cluster), mean)

fviz_cluster(km.res, data = df.scaled, 
             ellipse.type = "euclid",
             palette = c("brown", "lightblue", "green", "red", "black"), star.plot= TRUE, repel = TRUE,
             ggtheme = theme_minimal())



pam.res <- pam(df.scaled, 2)
print(pam.res)




