
#normal method
#---------------------




train_inp <- runif(50, min = 0, max = 20)
train_out <- train_inp^3
train_out



# rapshon method

new_raphson <- function(fx){
  x0 <- fx/2
  for(i in 1 : 1000){
    x1 <- x0 -  (x0^3 - fx) / (3 * x0^2)
    x0 <- x1
  }
  return(x1)
}

# random value
fx <- 64
result <- new_raphson(fx)
cat("The cube root of", fx, "is approximatelly", result, "\n")




result <- sapply(train_out, new_raphson)
result
train_inp

result == train_inp

#or 
tolerance <- 1e-5
comparison <- abs(result - train_inp) < tolerance
comparison





