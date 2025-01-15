# author  amalvinob
# data 14 /  sep / 2024

library(cluster)
library(factoextra)

data("USArrests")
head(USArrests)
data <- scale(USArrests)
data


dist_metric <- dist(data)

dist_metric


h1 <- hclust(dist_metric, method = "ward.D2")
h1

cust_col <- c("red", "green", "blue", "violet")

fviz_dend(h1, k = 4, k_colors = cust_col, label_cols = "purple", rect = TRUE)

?fviz_dend 

library(dplyr)

h2 <- hclust(dist_metric, method = "complete")
dend1 <- df%>% dist %>% hclust("complete") %>% as.dendrogram
dend2 <- df%>% dist %>% hclust("single") %>% as.dendrogram
dend3 <- df%>% dist %>% hclust("centroid") %>% as.dendrogram
dend4 <- df%>% dist %>% hclust("average") %>% as.dendrogram

dend1 <- data %>% dist %>% hclust("ward.D2") %>% as.dendrogram
dend2 <- data %>% dist %>% hclust("complete") %>% as.dendrogram
dend3 <- data %>% dist %>% hclust("single") %>% as.dendrogram
dend4 <- data %>% dist %>% hclust("centroid") %>% as.dendrogram
dend5 <- data %>% dist %>% hclust("average") %>% as.dendrogram
dend6 <- data %>% dist %>% hclust("ward.D") %>% as.dendrogram
dend7 <- data %>% dist %>% hclust("median") %>% as.dendrogram

dend1 <-as.dendrogram(h1)

dend1
plot(dend1)

library(dendextend)

dend_list <- dendlist(dend1, dend2,dend3, dend4, dend5, dend6, dend7)
dend_list

cor_matrix <- cor.dendlist(dend_list)
a <- cor_matrix[lower.tri(cor_matrix, diag = FALSE)]
a
print(a)

cor_matrix

corrr <- round(cor_matrix, 3)
corrr


library(corrplot)
corrplot(corrr, method = "pie", type = "lower")




