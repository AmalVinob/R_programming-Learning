library(neuralnet)
library(neuralnet)
library(tidyverse)
library(GGally)


train_inp <- c(7.5,8.1)
train_out <- 7.5

training_data<-cbind(train_inp[1],train_inp[2] ,train_out)
training_data
colnames(training_data) <- c("input1", "input2","output")
training_data



netLayer<-c(3)
netLayer

net.network<-neuralnet(output~input1+input2, training_data, hidden = netLayer, threshold = 0.01)
cat("NN training result")
print(net.network)
plot(net.network)


