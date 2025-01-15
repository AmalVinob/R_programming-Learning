library(neuralnet)
library(neuralnet)
library(tidyverse)
library(GGally)

set.seed(42)


train_inp <- as.data.frame(runif(50, min = 0, max = 20))
train_out <- train_inp * train_inp * train_inp


training_data$input <- (training_data$input - min(training_data$input)) / (max(training_data$input) - min(training_data$input))
training_data$output <- (training_data$output - min(training_data$output)) / (max(training_data$output) - min(training_data$output))



training_data<-cbind(train_inp, train_out)
training_data
colnames(training_data) <- c("input", "output")
head(training_data)



cat("will train a NN with the following configuration of hidden layer ?")
netLayer<-c(10,10)
netLayer

net.cube<-neuralnet(output~input, training_data, hidden = netLayer, threshold = 0.01, act.fct = 'tanh')
cat("NN training result")
print(net.cube)
plot(net.cube)



test_data <- as.data.frame((1:10)^3)
test_data


cat("NN response to test sample \n")

net.restuls <-predict(net.cube, test_data)
net.restuls















