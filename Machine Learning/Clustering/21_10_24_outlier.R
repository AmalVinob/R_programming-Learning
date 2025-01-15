library(tidyverse)
library(mlbench)
library(solitude)
library(uwot)

data("PimaIndiansDiabetes")
PimaIndiansDiabetes = as_tibble(PimaIndiansDiabetes)

PimaIndiansDiabetes

splitter = PimaIndiansDiabetes %>%
  select(-diabetes) %>%
  rsample::initial_split(prop = 0.5)

pima_train = rsample::training(splitter)
pima_test = rsample::testing(splitter)

dim(pima_train)
dim(pima_test)


iso = isolationForest$new()
iso$fit(pima_test)

score_train = pima_train %>%
  iso$predict() %>%
  arrange(desc(anomaly_score))

score_train

library(dplyr)

umap_train = pima_train%>%
  scale() %>%
  uwot::umap()%>%
  setNames(c("v1", "v2")) %>%
  as_tibble() %>%
  rowid_to_column() %>%
  left_join(score_train, by = c("rowid" = "id"))


pima_train


umap_train %>%
  ggplot(aes("v1", "v2"))+
  geom_point()



?Satellite
data(Satellite)
Satellite

is_outliers <- Satellite$classes %in%  c("damp grey soil", "cotton crop","vegetation stubble")
sat_without_class <- Satellite[, names(Satellite)[names(Satellite) != "classes"]]
dim(sat_without_class)
summary(is_outliers)





set.seed(123)
r_num <- matrix(rnorm(1000))
library(isotree)

isfmodel <-isolation.forest(r_num, ndim = 1, ntrees = 10, nthreads = 1)
scores <- predict(isfmodel, r_num, type = "avg_depth")

par(mar= c(4, 5, 3, 2))
plot(r_num, scores, type = "p", col= "brown", main = "avg depth for ND", xlab = "val", ylab = "svg isolation depth")


set.seed(1234)
cluster1 <- data.frame(
  x = rnorm(1000, -1, .4),
  y = rnorm(1000, -1, .2)
)
cluster1

cluster2 <- data.frame(
  x = rnorm(1000, +1, .2),
  y = rnorm(1000, +1, .4)
)

outlier <- data.frame(
  x = -1,
  y = +1
)

outlier


X <- rbind(cluster1, cluster2, outlier)
X

pts = seq(-3, 3, .1)
space_d <- expand.grid(x = pts, y=pts)
space_d

plot.space <- function(Z, ttl, cex.main, 1.4){
  image(pts, pts, matrix(Z, nrow = length(pts)),
        col = rev(heat.colors(50)),
        main = ttl, cex.main = cex.main,
        xlim = c(-3, 3), ylim = c(-3, 3),
        xlab = "", ylab = "")
  par(new= TRUE)
  plo
}







