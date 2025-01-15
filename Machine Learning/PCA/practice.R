




df <- data.frame(height = c(177,175,170,165,168,169), weight = c(60, 55, 54, 53, 56, 50))
df
var(df)

a = scale(df)
a

cova <-cov(a)
cova

eig<- eigen(cova)

eig$values
eig$vectors

b <- a %*% eig$vectors
b


pca <- prcomp(a, center = FALSE,scale. = FALSE)

pca$x









a = matrix(data= c(2,1,3,1,2,3,3,3,20), nrow= 3, ncol = 3)
a

eig <- eigen(a)
eig$values
eig$vectors



a = matrix(data= c(1/6, 1/6, 1, -3, -3, 1, -1, 1, 0), nrow= 3, ncol = 3)
a

scale(a)


a = matrix(data= c(8, 4,3, -8,-3,-4, -2, -2, 1), nrow= 3, ncol = 3)
a
eig <- eigen(x = a, symmetric = FALSE)
eig$values
eig$vectors



a = matrix(data= c(4, 1, 2, 1, 3, 0, 2, 0, 5), nrow= 3, ncol = 3)
a
eig <- eigen(x = a, symmetric = FALSE)
eig$values
eig$vectors

a = matrix(data= c(7, 2, 1 ,2, 6, 0, 1, 0, 5), nrow= 3, ncol = 3)
a
eig <- eigen(x = a, symmetric = FALSE)
eig$values





