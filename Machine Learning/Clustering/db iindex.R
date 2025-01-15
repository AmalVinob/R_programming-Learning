
library(cluster)

# Assuming 'data' is your dataset and 'clusters' is the clustering result
# Perform k-means clustering
set.seed(123) # For reproducibility

data("iris")

df<- iris[,-5]
df <- scale(df)

clusters <- kmeans(data, centers = 3) # Example with 3 clusters

# Compute Davies-Bouldin index
db_index <- index.DB(data, clusters$cluster)

# Print the Davies-Bouldin index
print(db_index$DB)

db_index <-   index