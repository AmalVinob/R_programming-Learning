library(car)



set.seed(123)

datapoints <- cbind(runif(20), runif(20))

head(datapoints)

scatterplot(datapoints[,1], datapoints[,2])


range(datapoints[,1])


hopkin_statistics <- function(datapoints, num_points = 100){
  
  n <- nrow(datapoints)
  
  x_range <- min(range(datapoints[,1]))
  y_range <- max(range(datapoints[,2]))
  
  ranom_point <- cbind(runif(num_points,x_range, y_range),runif(num_points, min = x_range, max = y_range))
  
  
  distance_matrix <- function(points){
    as.matrix(dist(points))
  }
  
  data_point_dis <- distance_matrix(datapoints)
  data_min_distances <- apply(data_point_dis, 1, function(x) sort(x)[2])
  
  new_df <- rbind(datapoints, random_points)
  new_df_dist <- distance_matrix(new_df)
  random_to_datapoints_dist <- new_df_dist[1:n, (n+1):(n+num_points)]
  data_min_dist_rand <- apply(random_to_datapoints_dist, 1, min)
  
  h <- sum(data_min_distances) / (sum(data_min_distances) + sum(data_min_dist_rand))
  return(h)
  
  
}

h <- hopkin_statistics(datapoints)
h







