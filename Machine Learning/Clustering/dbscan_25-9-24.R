library(NbClust)
library(factoextra)
library(cluster)
library(gridExtra)

data("USArrests")
df <-scale(USArrests)

df

fviz_nbclust(df, kmeans ,method = "wss")+
  geom_vline(xintercept = 4 , linetype= 3)+
  labs(subtitle= "elbow method")


?fviz_nbclust 



library(fpc)
library(dbscan)

?multishapes

data("multishapes", package = "factoextra")

head(multishapes)

df <- multishapes[,1:2]
set.seed(123)

dbc <- fpc::dbscan(df, eps = 0.15, MinPts = 5)

dbc

a =fviz_cluster(dbc, data= df, stand = FALSE, ellipse = FALSE, show.clust.cent = FALSE, geom = "point",
             palette="jco")+ theme_classic()

b = fviz_cluster(dbc, data= df, stand = FALSE, ellipse = FALSE, geom = "point",
             palette="jco")+ theme_classic()

grid.arrange(a, b, nrow=1, ncol=2)


kNNdistplot(df, k=5)
abline(h = 1.13, lty=3)

?fviz_nbclust

fviz_nbclust(df, kmeans,  method = "wss")+ 
  labs(subtitle = "elbow method")

fviz_nbclust(df, kmeans,  method = "silhouette")+ 
  labs(subtitle = "silhoutte method")

fviz_nbclust(df, kmeans,  method = "silhouette")+ 
  labs(subtitle = "gap_stat")



data(stat.x77)

data()

sessionInfo()



#--------------------------------------------------------------------------------


data("iris")

df <- scale(iris[,-5])
df
?fviz_nbclust

elbow <- fviz_nbclust(df, kmeans, method = 'wss') +
  labs(subtitle = "elbow method")

silhoutte <- fviz_nbclust(df, kmeans, method = 'silhouette') +
  labs(subtitle = "silhouette method")

gap_stat <- fviz_nbclust(df, kmeans, method = 'gap_stat') +
  labs(subtitle = "gap_stat method")


grid.arrange(elbow, silhoutte, gap_stat, nrow=2, ncol=2)
?grid.arrange

x <- kmeans(x = iris, centers = 3, nstart = 25)







