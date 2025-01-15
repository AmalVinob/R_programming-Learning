#random dataset from uniform dist

df <- data.frame(x1 = runif(100, min = 4, max = 25), x2 = runif(100, min = 3, max = 10))

df


b0 <- 2
b1 <- 1.5
b2 <- -.8
error <- rnorm(100, mean = 0, sd = 1)

y <- b0 + b1*df$x1 + b2*df$x2 + error
y

df$y <- y

head(df)


cov(scale(df))




#linear_model
#------------------

model_1 <- lm(y~x1+x2, data = df)  
summary(model_1)


y <- b0 + b1*df$x1 + error
y

df$y <- y


model_2 <- lm(y~x1, data = df)
summary(model_2)




y <- b0 + b2*df$x2 + error
y

df$y <- y

model_3 <- lm(y~x2, data = df)
summary(model_3)





#multicolinearity
#------------------

cov_mat <- cov(scale(df))
cov_mat

#no multicolinearity, so create

x2 <- df$x1 + df$x2
x2

df$x2 <- x2

cov_mat <- cov(scale(df))
cov_mat

# now multicoliniearity exits







