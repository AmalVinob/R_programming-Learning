sentence <- "The quick brown fox jumps over the lazy dog."
words <- unlist(strsplit(sentence, "\\s+"))

# Print the words
print(words)
print(words[1])

words_1 <- unlist(strsplit(sentence, " "))
words_1


a = list()
for (i in 1:5){
  a[i] <- i
}
a

i = 1
while(i < 4){
  print(a[i])
  i = i+1
}


data <- data.frame(Name = c("amal", "fadhil", "mura"),
                   roll_no = c(1, 2, 3),
                   job = c("data scientist", "teacher", "chemistist"))
data
data['Name' = 'amal']

filterd = data[data$Name == 'amal',]
filterd
filterd = subset(data, Name=="amal")
filterd
