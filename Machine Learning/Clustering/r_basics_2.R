x = c(1,2,3,4)
x
str(x)
class(x)

library("lobstr")
obj_addr(x)

a <- c(1,2,3,4,5)
b <- c(5,6,7,8,9)

c = rbind(a,b)
c
d = cbind(a,b)
d

factorial <- function(n){
  if(n == 0){
    return(1)
  }else{
    return (n * factorial(n-1))
  }
}
factor_1 <- factorial(5)
print(factor_1)

my_list = list(1,2,"amal", "hai", 6)
print(my_list)

group <- c("fadhil", "amal", "akhil", "husain")
sort(group)
sort(group, decreasing = T)

data <- data.frame(Roll_no = c(1 ,2 ,3 ,4),
                   Name = c("amal", "akhil", "anu", "fadhil"),
                   profession = c("DS", "ML", "Manager","Teacher"))
data

sorted <- data[order(data$Name),]
sorted

library('dplyr')
sorted_name <-data%>%
  arrange(data$Name)
sorted_name

length(group)
length(data$Name)


data <- data.frame(Roll_no = c(1 ,2 ,3 ,4),
                   Name = c("amal", "akhil", "anu", "fadhil"),
                   profession = c("DS", "ML", "Manager","Teacher"))
nchar(data$Name)
for i in length(data$Name){
  data['# char_name'] = nchar(data$Name[i])
}

data <-data%>%
  mutate(char_count = nchar(Name))
data
