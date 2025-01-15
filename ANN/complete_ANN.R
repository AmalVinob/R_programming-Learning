library(mlbench)
library(tidyverse)
set.seed(79430)

sim_data<- mlbench.spirals(500, cycles = 1, sd=0)


sim_data<- tibble(x1= sim_data$x[ ,1]+rnorm(100,0,0.1),
                  x2 = sim_data$x[, 2]+rnorm(100,0, 0.1),
                  y = as.numeric(sim_data$classes)-1)

ggplot(data=sim_data %>% mutate(class_of_y =factor(y)),
       aes(x =x1, y = x2, color = class_of_y)
) + geom_point()## upto here

sigmoid <- function (x) { 1/(1+exp(-x))}

par(bg="black", col="white", col.axis="white", col.amin="white")
x <- seq(-10,10,0.01)
plot(x=x, y= sigmoid(x))
abline(y= 0)


## Feedforward forward pass
feedforward <- function (X, w1, w2) # input matrix, wieghts b/w input  llayer to 
  # hiddern layer and hl to o/p layer
{
  z1 <- X%*%w1
  h <- sigmoid(z1)
  H <-cbind(1,h)
  z2 <-H%*%w2
  y_predict<- sigmoid(z2)
  return(sigmoid(z2))
}

## fforward <- function(X,w1,w2){sigmoid(cbind(1, sigmoid(X%%w1))%*%w2)}

## if we use loss function as Summation(y_i *log(y_i) + (1-y_i)*log(1-y_i)

loss_fn <- function(y, y_hat) # true value, preidctied values
{ sum(y*log(y_hat) + (1-y)*log(1-y_hat))
}

# BP Algorithm
subset_obs <- sim_data[1:10,]
subset_obs
x <-cbind(intercept =1, subset_obs[,-3])%>%as.matrix()
x


------------------------------
  ## input 2 and 1 bias, hidden layer with 6 nuerons and 1 neuron in output layer
  
  ##intialize the weights
  set.seed(696969430)
w1<-matrix(rnorm(3*5), nrow=3, ncol=5)
w2<-matrix(rnorm(6*1), nrow=6, ncol=1)

# with these random weights and sample datapoints, let us compute y_hat
feedforward(X=x, w1=w1, w2=w2)

## compute the loss and update the wieghts
loss_fn( y = subset_obs$y,
         y_hat = feedforward( X = x, w1 = w1, w2 = w2 )
)

# some things we need to calculate the gradient:
y <- subset_obs$y
y_hat <- feedforward( X = x, w1 = w1, w2 = w2 )
h <- sigmoid( x %*% w1 )
H <- cbind(1, h)

# the gradient/derivative of our loss function with respect to w2 is 
dL_dW2 <- t(H) %*% (y_hat - y)
dL_dW2

## update the weight and compute the loss function
adjusted_w2 <- w2 + c(-0.001, 0, 0, 0, 0, 0)

# the change in the loss function is:
loss_fn( y = y, 
         y_hat = feedforward( X = x, w1 = w1, w2 = adjusted_w2 ) ) -
  loss_fn( y = y, 
           y_hat = feedforward( X = x, w1 = w1, w2 = w2 ) )
# the grad of the loss function w rt first weights
dh  <- (y_hat - y) %*% t( w2[-1, drop = FALSE] )
dL_dW1 <- t(x) %*% (h * (1 - h) * dh)
dL_dW1

# to see the change

adjusted_w1 <- w1 + matrix( c( 0, 0, 0, 0,     0,
                               0, 0, 0, 0.001, 0,
                               0, 0, 0, 0,     0
),
byrow = TRUE,
nrow=3, ncol = 5
)
loss_fn( y = y, 
         y_hat = feedforward( X = x, w1 = adjusted_w1, w2 = w2 ) ) -
  loss_fn( y = y, 
           y_hat = feedforward( X = x, w1 = w1, w2 = w2 ) )

##  We iteratively update each weight according to the rule:

##   Wt+1=Wt???\eta ??? L(Wt)

## So, for each weight (weights updated simultaneously):

## We get the rate of change of the loss function for this weight at it's current value ??? L(Wt),
## assuming that all other weights do not change.

##We update this weight by a very small (controlled by \eta) amount in the direction in which we expect to reduce the loss function.

backpropagate <- function( X,          # design matrix (with first column of 1s)
                           y,          # vector of true observed outcomes
                           y_hat,      # vector of current model predictions
                           w1,         # matrix of current weights between input layer and hidden layer
                           w2,         # matrix of current weights between hidden layer and output layer
                           learnrate   # the chosen learning rate (lambda) 
){
  
  h <- sigmoid(X%*%w1)
  H <- cbind( 1, h )
  dL_dw2 <- t(H) %*% (y_hat - y)       # calculate the gradients for W2
  dL_dh  <- (y_hat - y) %*% t(w2[-1, , drop = FALSE])
  dL_dw1 <- t(x) %*% (h * (1 - h) * dL_dh)  # calculate the gradients for W1
  
  w1 <- w1 - learnrate * dL_dw1         # update the weights W1
  w2 <- w2 - learnrate * dL_dw2         # update the weights W2
  
  return(  list(w1 = w1, w2 = w2)  )
  
}

## Testing our nn 

x <-cbind(1, sim_data[,1:2])%>% as.matrix()
head(x,5)

nrow(x)

y<-sim_data$y
y

## change the weights and repeat the same more times
new_w1 <- matrix(rnorm(3*30), ncol=30, nrow=3)
new_w2 <- matrix(rnorm(31*1), nrow=31, ncol=1)
new_w1

## Let us repeat these for 5000 times
store_cost <- as.numeric(rep (as.matrix(NA), 5000))
head(store_cost,5)

# with started initial weights, output
current_y_hat <- feedforward( X = x,
                              w1 = new_w1,
                              w2 = new_w2
)

# show first 10 values
head( current_y_hat, 5)

# Loss 
loss_fn(y=y, y_hat =current_y_hat)

##Now, we perform the following sequence 5,000 times:

#forward propagation:Feed our inputs through the network and get the network output.

#Calculate our loss/cost for our current network predictions (output) and store this to refer to later.

#back propagation: Calculate the gradient (rate of change) of the cost/loss function with respect to each weight in the network for the current weights.

#Simultaneously update all of our weights by a small amount using the gradient of the cost function


for( i in 1:5000){
  
  #print(i)
  
  # get network output for current weights:
  current_y_hat <- feedforward( X = x, 
                                w1 = new_w1,
                                w2 = new_w2
  )
  
  # store the cost/loss at this point:
  store_cost[i] <- loss_fn( y = y, y_hat = current_y_hat )
  
  # calculate the gradient (back propagate) and update the weights:
  do_backprop <- backpropagate( X = x,          # design matrix (with first column of 1s)
                                y = y,          # vector of true observed outcomes
                                y_hat = current_y_hat,      # vector of model predictions
                                w1 = new_w1,         # matrix of weights between input layer and hidden layer
                                w2 =new_w2,         # matrix of weights between hidden layer and output layer
                                learnrate = 0.001   # the learning rate (lambda) 
  )
  
  # store the new weights:
  new_w1 <- do_backprop$w1
  new_w2 <- do_backprop$w2
  
}

## let us see how it is approaching after every iteration
plot( x = 1:length(store_cost),
      y = store_cost,
      xlab = "iteration",
      ylab = "loss/cost",
      #type = "b",
      cex = 0.5
)

##If we consider a network output (prediction) of greater than 0.5 as a predicted label 1 and 0.5 or less as a 0 label, 
##then the predictions of our trained network are:

fitted_values <- as.numeric( current_y_hat > 0.5 )

# show first 20 predictions
head(fitted_values, 20)

# represent as table
table(fitted_values,y)

# PROPOTION
table( fitted_values, y ) %>% prop.table()

## we can plot the decision boundaries of our network predictions over the data
## that we trained the network on:

pred_grid <- expand.grid( x1 = seq( min(sim_data$x1)-0.1, 
                                    max(sim_data$x1)+0.1, 
                                    0.01 ),
                          x2 = seq( min(sim_data$x2)-0.1, 
                                    max(sim_data$x2)+0.1, 
                                    0.01 )
)
pred_grid_labels <- as.numeric( 
  feedforward( X = as.matrix( cbind(1,pred_grid) ),
               w1 = new_w1,
               w2 = new_w2
  ) > 0.5
) 

ggplot( data = sim_data,
        aes( x = x1, 
             y = x2, 
             colour = factor(y)
        )
) +
  geom_point( data = cbind( pred_grid, y = pred_grid_labels),
              aes(x = x1 , y = x2 ),
              size = 0.02 ) +
  geom_point()

## let us do the samething for the original fitted values instead y>0.5

pred_grid_fitted_values <- 
  feedforward( X = as.matrix( cbind(1,pred_grid) ),
               w1 = new_w1,
               w2 = new_w2
  ) 

ggplot( data = sim_data,
        aes( x = x1, 
             y = x2, 
             colour = y
        )
) +
  geom_point( data = cbind( pred_grid, y = pred_grid_fitted_values),
              aes(x = x1, y = x2 ),
              size = 0.02 ) +
  geom_point()