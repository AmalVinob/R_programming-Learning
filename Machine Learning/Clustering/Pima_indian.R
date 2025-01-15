library(mlbench)
library(corrplot)
library(neuralnet)
library(neuralnet)
library(tidyverse)
library(GGally)
library(NeuralNetTools)  # Load the package
library(neuralnet)
library(corrplot)


data("PimaIndiansDiabetes")
df <- PimaIndiansDiabetes
df$diabetes <- as.numeric(df$diabetes) - 1  # Convert diabetes to 0 and 1

# Normalize the dataset
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}
df_norm <- as.data.frame(lapply(df, normalize))
df_norm 


set.seed(123)  # Set seed for reproducibility
index <- sample(1:nrow(df), round(0.90 * nrow(df)))
trainset <- df_norm[index, ]
testset <- df_norm[-index, ]

input <- paste(names(df)[-ncol(df)], collapse = " + ")
output <- names(df)[ncol(df)]
formula <- as.formula(paste(output, "~", input))


netLayer <- c(3)  # Hidden layer with 3 nodes
net.prima <- neuralnet(formula, data = trainset, hidden = netLayer, threshold = 0.01)


plot(net.prima)

net.result1 <- predict(net.prima, testset[, -ncol(testset)])
net.result1 <- net.result1$net.result


binary_output1 <- ifelse(net.result1 > 0.5, 1, 0)


actual_classes <- testset$diabetes


accuracy <- sum(binary_output1 == actual_classes) / length(actual_classes)
print(paste("Accuracy:", accuracy))


confusion_matrix <- table(Predicted = binary_output1, Actual = actual_classes)
print(confusion_matrix)




netLayer1 <- c(6)  # Hidden layer with 3 nodes
net.prima1 <- neuralnet(formula, data = trainset, hidden = netLayer1, threshold = 0.01)

plot(net.prima1)

net.result2 <- predict(net.prima1, testset[, -ncol(testset)])



binary_output2 <- ifelse(net.result2 > 0.5, 1, 0)


accuracy1 <- sum(binary_output2 == actual_classes) / length(actual_classes)
print(paste("Accuracy:", accuracy1))


confusion_matrix <- table(Predicted = binary_output2, Actual = actual_classes)
print(confusion_matrix)








install.packages("gridExtra")

  

