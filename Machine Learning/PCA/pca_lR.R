setwd("D:/alliance/3rd sem/machine learning_2/R_studo/datasets")

wine <- read.csv("wine.csv")

wine

head(wine)


wine_1 <- wine[,-1]
wine_2 <- wine_1[,-1]
head(wine_2)

cor(wine_2)

wine_scaled <- scale(wine_2)

pca <- prcomp(wine_scaled, center = FALSE, scale. = FALSE)
pca$x

std_dev <- pca$sdev
std_dev

vara <- var(pca$x)
variance <- diag((vara))
variance

total <- sum(variance)
total

vari <- variance/total
vari



variance <- std_dev^2

total_variance <- sum(variance)

percent_variance <- (variance / total_variance) * 100

percent_variance







protein <- readLines("protein.txt")
head(protein)




split_df <- strsplit(protein, split = ",")

splited <- do.call(rbind, split_df)

df <- as.data.frame(splited, stringAsFactor= FALSE)
