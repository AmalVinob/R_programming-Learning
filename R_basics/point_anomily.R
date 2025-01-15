

temp <- data.frame(temp = c(19, 18, 17, 21, 25, 26, 23, 21, 30 ,27, 21, 32, 29,34, 36,33 ,60))
summary(temp)


boxplot(temp, ylab="celcius")



plot(temp)



hist(temp$temp, breaks = 6)



