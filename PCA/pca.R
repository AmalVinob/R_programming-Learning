
library(knitr)
library(rgl)

set.seed(123456)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')


data("mtcars")
head(mtcars)

df <- scale(mtcars, center = T, scale = T)
head(df)

pca <- prcomp(df,center = F, scale =F, retx = T )

summary(pca)

pca$rotation

pca$x[,1]

pca$x[,1:3]

clust <- kmeans(pca$x[,1:3], centers = 4, nstart = 100)

plot3d(pca$x[,1:3], xlab="PC 1", ylab="PC 2", zlab="PC 3", cex=1.5, size=1, type="s", col=clust$cluster)
text3d(clust$centers, texts=c("1","2","3","4"))


# applying the pca to 3 variables only 
df_3 <- df[, c("cyl", "qsec", "carb")]
head(df_3)
pca_3 <- prcomp(df_3, center = F, scale=F,  retx = T)
summary(pca_3)

pca_3$rotation

pca_3$x


dsa_3 <- pca_3$x[,1:2] %*% t(pca_3$rotation[,1:2])

plot3d(df_3, xlab="No. Cylinders", ylab="Quart. Mile", zlab="No. Carburetors", 
       xlim=c(-2,2), ylim = c(-3,3), zlim = c(-2,4), cex=1.5, size=1, type="s")
planes3d(pca_3$rotation[,3],alpha=.5)

plot3d(dsa_3, col="red", cex=1.5, size=1, add=TRUE,type="s")

mylist <- list(df_3,dsa_3)
segments3d(do.call(rbind,mylist)[order(sequence(sapply(mylist,nrow))),])


?dist()



