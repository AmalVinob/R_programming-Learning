points <- list(c(2,10), c(2,5), c(8,4), c(5,8), c(7,5), c(6,4), c(1,2))
points

# Convert list to matrix
data_matrix <- do.call(rbind, points)
print("Original Data:")
print(data_matrix[1,])


standardize_data <- function(data){
  means <- colMeans(data)
  sds <- apply(data, 2, sd)
  standardize_data <- sweep(data, 2, means, "-")
  standardize_data <- sweep(standardize_data, 2, sds, "/")
  return(standardize_data)
}

standardized <- standardize_data(data_matrix)
standardized

standardized_points <- split(standardized, row(standardized))
standardized_points

a <- list(c(1,2,3),c(4,5,6))
a

matris <- do.call(rbind, a)
matris
splited_matrix <- split(matris, row(matris))
splited_matrix