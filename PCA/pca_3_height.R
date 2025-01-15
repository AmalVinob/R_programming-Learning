a <- matrix(c(2,10,2,5,8,4,5,8,7,5,6,4,1,2,4,9), ncol = 2, byrow = TRUE)
a

distance <- dist(a,method = "euclidean")
print(distance)

df = data.frame(height = c(177,175,170,165,168,169), weight = c(60,55,54,53, 56, 50))
df

summary(df)
a = var(df)
a**.5

scaled_df <- scale(df)
scaled_df

scaled_df <- as.data.frame(scaled_df)
scaled_df



mean(scaled_df$height)
mean(scaled_df$weight)

var(scaled_df)

cova <- cov(scaled_df)

eige <- eigen(cova)
eige$values
eige$vectors





pca <- prcomp(scaled_df,center = FALSE, scale. = FALSE)
pca$x




vara <- var(pca$x)
vara

variance <- diag((vara))
variance

total <- sum(variance)
total

vari <- variance/total
vari



total_variance <- sum(variance)

percent_variance <- (variance / total_variance) * 100

percent_variance