library(factoextra)
library(cluster)
library(dbscan)

#1.Create a new data frame using all but the last variable from the iris data set, which is supplied with R.


data("iris")
df <- iris[,-5]

#2. Use the scale function to normalize values of all variables in the new data set (with default settings). 
#Ensure that the resulting object is of class data.frame.

df <- scale(df)
head(df)

scaled_df <- as.data.frame(df)
scaled_df

class(scaled_df)


# 3.Plot the distribution of distances between data points and their fifth nearest neighbors using the kNNdistplot 
#function from the dbscan package.
#Examine the plot and find a tentative threshold at which distances start increasing quickly. On the same plot, 
#draw a horizontal line at the level of the threshold.

?dbscan
?kNNdistplot

kNNdistplot(x=scaled_df, k = 5)
abline(h = 1.111, col="red")


#4. Use the dbscan function from the package of the same name to find density-based clusters in the data. 
#Set the size of the epsilon neighborhood at the level of the found threshold, and set the number of minimum points in the epsilon region equal to 5.
#Assign the value returned by the function to an object, and print that object.


density_cl =dbscan(x = scaled_df, eps=1.111, minPts = 5)

print(density_cl)






# 5. Plot the clusters with the fviz_cluster function from the factoextra package. Choose the geometry 
#type to draw only points on the graph, and assign the ellipse parameter value such that an outline 
#around points of each cluster is not drawn.
#(Note that the fviz_cluster function produces a 2-dimensional plot. If the data set contains two 
#variables those variables are used for plotting, if the number of variables is bigger the first 
#two principal components are drawn.)

fviz_cluster(density_cl,data = scaled_df, geom="point", ellipse.type = "none")
fviz_cluster(density_cl,data = scaled_df, geom="point")






# 6. Examine the structure of the cluster object obtained in Exercise 4, and find the vector with cluster assignments. Make a copy of the data set, 
#add the vector of cluster assignments to the data set, and print its first few lines.

str(density_cl)

cls_assi <- density_cl$cluster
cls_assi

iris_copy <- scaled_df
iris_copy$cluster <- cls_assi

iris_copy
head(iris_copy)




# 7.

kNNdistplot(x=scaled_df, k = 5)
abline(h=1.8, col="blue")
abline(h=.5, col="yellow")
abline(h=.4, col="green")

density_cl1 <- dbscan(x=scaled_df, eps = 1.8, minPts = 5)
density_cl2 <- dbscan(x=scaled_df, eps = .5, minPts = 5)
density_cl3 <- dbscan(x=scaled_df, eps = .4, minPts = 5)

print(density_cl1)

fviz_cluster(density_cl1,data = scaled_df, geom="point", ellipse.type = "none")
fviz_cluster(density_cl1,data = scaled_df, geom="point")


print(density_cl2)
fviz_cluster(density_cl2,data = scaled_df, geom="point", ellipse.type = "none")
fviz_cluster(density_cl2,data = scaled_df, geom="point")

print(density_cl3)
fviz_cluster(density_cl3,data = scaled_df, geom="point", ellipse.type = "none")
fviz_cluster(density_cl3,data = scaled_df, geom="point")







#########################################################################3 
##whole sales customers

setwd("D:/alliance/3rd sem/machine learning_2/R_studo/DBSCAN/wholesale+customers")

customer <- read.csv("Wholesale customers data.csv")
head(customer)


customer <- customer[,c("Fresh", "Milk")]
head(customer)

scaled_cus <- scale(customer)

scaled_cus <- as.data.frame(scaled_cus)

kNNdistplot(x = scaled_cus, k = 5, minPts = 5)
abline(h = .90, col="red")

db_cluster_customer <- dbscan(x = scaled_cus, eps = .90, minPts = 5)


kNNdistplot(x = scaled_cus, k = 5, minPts = 5)
abline(h = .77, col="red")
db_cluster_customer2 <- dbscan(x = scaled_cus, eps = .77, minPts = 5)

str(db_cluster_customer)

fviz_cluster(db_cluster_customer, data=scaled_cus,geom = "point")
fviz_cluster(db_cluster_customer2, data=scaled_cus,geom = "point")


###################
# 9.0


thre <- 2.5

customer_core <- scaled_cus[abs(scaled_cus$Fresh) <= thre & abs(scaled_cus$Milk) <= thre,]

km_clusters_customers <- kmeans(customer_core, centers = 4, nstart = 10)

fviz_cluster(km_clusters_customers, data = customer_core)


# 1
db_cluster <- db_cluster_customer$cluster

distance <- dist(scaled_cus)


silhouette_db <- silhouette(db_cluster, distance)

fviz_silhouette(silhouette_db) + ggtitle("silhouette analysis")


#2
km_cluster <- km_clusters_customers$cluster
distance_k <- dist(customer_core)
silhouette_km <- silhouette(km_cluster, distance_k)
fviz_silhouette(silhouette_km) + ggtitle("silhouette analysis")


# Average silhouette width for DBSCAN
avg_silhouette_dbscan <- mean(silhouette_db[, 3])

# Average silhouette width for K-Means
avg_silhouette_kmeans <- mean(silhouette_km[, 3])

# Print average silhouette widths
cat("Average Silhouette Width for DBSCAN:", avg_silhouette_dbscan, "\n")
cat("Average Silhouette Width for K-Means:", avg_silhouette_kmeans, "\n")















