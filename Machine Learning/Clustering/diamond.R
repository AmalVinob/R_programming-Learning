library(ggplot2)
library(caret)

library(neuralnet)
library(neuralnet)
library(tidyverse)
library(GGally)

library(corrplot)


data("diamonds")

df <-diamonds

head(df)
dim(df)

?diamonds
sum(is.na(diamonds))

str(diamonds)

df$cut <- as.numeric(df$cut)
df$color <- as.numeric(df$color)
df$clarity <- as.numeric(df$clarity)

df$volume <- df$x * df$y * df$z


str(df)

train <- df[, !(names(df) %in% 'price')]
test <- df[, 'price']
test

corr <- cor(df)
corr

corrplot(corr = corr, method = "number", type = "lower")

scaled_df <- scale(train)
head(scaled_df)

corrplot(corr = cor(scaled_df), method = "number", type = "lower")
# high correlation is therebetween (x, y and z and carat) we will do 4 things(4 ann model),
# 1, keep as it is create model with every value and see how it is 
# 2, keeping (volume = x * y * z) and carat
# 3, keeping only caract
# 4 , add pca to the diamond dataset.


index <- sample(1 : nrow(df), size = 0.8*nrow(df), replace = FALSE)
training_data <- cbind(scaled_df, test)
head(training_data)

trainset <- training_data[index,]
testset <- training_data[-index,]
head(trainset)
head(testset)

#1st NN
hidden_layer <- c(10, 10, 5)
net.diamond <- neuralnet(price~., data = trainset, hidden = hidden_layer, threshold = .01)
plot(net.diamond)


head(trainset)

print(net.diamond)
plot(net.diamond)

dim(dim)

nn.predict <- predict(net.diamond,testset[,!names(testset) %in% 'price'])
nn.predict

summary(nn.predict)




# 2, keeping (volume = x * y * z) and carat

training_data$volume <- training_data$x * training_data$y * training_data$z

training_data <- training_data[, !names(training_data) %in% c('x', 'y', 'z')]
corrplot(corr = cor(training_data), method = "number", type = "lower")
trainset1 <- training_data[index,]
testset1 <- training_data[-index,]
head(trainset1)
head(testset1)

# nn.2  

hidden_layer <- c(10, 10, 10)
net.diamond1 <- neuralnet(price~., data = trainset1, hidden = hidden_layer, threshold = .01)
plot(net.diamond1)

print(net.diamond1)

nn.predict <- predict(net.diamond1,testset1[,!names(testset) %in% 'price'])
nn.predict

summary(nn.predict)





# 2, keeping volume and carat

training_data1 <- training_data[, names(training_data) %in% c('volume', 'carat', 'price')]
trainset1 <- training_data1[index,]
testset1 <- training_data1[-index,]
head(trainset1)
head(testset1)

# nn.3

hidden_layer <- c(5,10, 10,5)
net.diamond1 <- neuralnet(price~carat + volume , data = trainset1, hidden = hidden_layer, threshold = .01)
plot(net.diamond1)



nn.predict <- predict(net.diamond1,testset1[,!names(testset1) %in% 'price'])
nn.predict

summary(nn.predict)


nn.predict <- compute(net.diamond1, testset1[, c('carat', 'volume')])
nn.predicted_values <- nn.predict$net.result
nn.predicted_values

predicted_price <- nn.predicted_values * attr(df$scaled_price, 'scaled:scale') + attr(df$scaled_price, 'scaled:center')
predicted_price



















library(neuralnet)
library(ggplot2)
library(dplyr)

data("diamonds")
df <- diamonds

# Convert categorical variables to numeric
df$cut <- as.numeric(df$cut)
df$color <- as.numeric(df$color)
df$clarity <- as.numeric(df$clarity)

# Calculate volume
df$volume <- df$x * df$y * df$z

# Scale the features and target
df$scaled_price <- scale(df$price)
df$scaled_features <- scale(df[, c('carat', 'volume')])

# Split into training and test sets
set.seed(123)
index <- sample(1:nrow(df), size = 0.8 * nrow(df), replace = FALSE)
trainset1 <- df[index, ]
testset1 <- df[-index, ]

# Train the neural network
hidden_layer <- c(10, 10)
net.diamond1 <- neuralnet(scaled_price ~ carat + volume, data = trainset1, hidden = hidden_layer, threshold = 0.01)

# Predict using the compute function
nn.predict <- compute(net.diamond1, testset1[, c('carat', 'volume')])

# Rescale predictions back to original price range
predicted_price <- nn.predict$net.result * attr(df$scaled_price, 'scaled:scale') + attr(df$scaled_price, 'scaled:center')

# Compare predicted and actual prices
results <- data.frame(
  Actual = testset1$price,
  Predicted = predicted_price
)

summary(results)
