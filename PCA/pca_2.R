df <- data.frame(bbp = c(78,80,81,82,84,86),
                 sbp= c(126,128,127,130,130,132),
                 ht = c(67,77,89,90,50,55),
                 wt = c(1.7,1.77,1.83,1.87,1.65,1.64))

cov <- cov(df)
cov

# step 1 : scale

a <- scale(df,center = TRUE, scale=TRUE)
a


# step 2 covariance matrix
cov_df <- cov(a)

# step 3 eigen values and eigen vectors

eig <- eigen(cov_df)

eig_val <- eig$values
eig_val
eig_vec <- eig$vectors
eig_vec

#

pc_score <- a %*% eig_vec

pc_score

# tot find if it captures the max variance
pc_scale <- scale(pc_score)
pc_scale

var(pc_scale)

a <- diag(var(pc_scale))
a

pca <- prcomp(df, scale. = TRUE)
pca$x



variance of pc scores
--------------------------
  
  
vara <- var(pca$x)
variance <- diag((vara))

total <- sum(variance)

vari <- variance/total
vari


