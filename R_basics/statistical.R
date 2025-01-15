library(ggplot2)
dt <- ggplot2::mpg


dt



dim(dt)
?mpg


summary(dt)


boxplot(dt$hwy)


range(dt$hwy)

hist(dt$hwy)


hist(dt$hwy, breaks = sqrt(length(mpg$hwy)))


iqr <-IQR(x = dt$hwy)
iqr
# in summary statistics iqr is there


library(dplyr)

q1 <- quantile(dt$hwy,0.25)
q1

q3 <- quantile(dt$hwy,0.75)
q3


lowerbound <- q1-1.5*iqr
upperbound <- q3 + 1.5 * iqr

out <- boxplot.stats(dt$hwy)$out
out

out_index <- which(dt$hwy %in% c(out))
out_index


dt[out_index,]


library(rstatix)
identify_outliers(data = dt, variable = "hwy")


boxplot(dt$hwy, ylab="hwy", main= "box plot of highway mpg")
mtext(paste("outliers: ", paste(out, collapse = ",")))



#hampel filter method to find outliers

?hampel?
  

  
library(car)

qqPlot(dt$hwy)



df <- rnorm((50), 5)
df

qqPlot(df)
hist(df)


library(outliers)
test <- grubbs.test(df, opposite = TRUE)
test


#dataset should be less than or equal to 25
sudt <- c(df[1:20], max(df))
test <- dixon.test(sudt)
test



# hw - hampel filter



?dbscan
library(dbscan)




