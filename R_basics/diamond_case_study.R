library(ggplot2)
library(dplyr)

attach(diamonds)
View(diamonds)
sum(is.na(diamonds))
# there are no null values in the data set.

str(diamonds)


cols <- c("model", "manufacturer", "class")


mpg[cols] <- lapply(mpg[cols], function(x) {
  if (!is.factor(x)) {
    factor(x)
  } else {
    x
  }
})

str(mpg)

cols<-c(model, manufacturer, class)

mpg[col] <- lapply(mpg[cols], function()

convert(mpg, col)


attach(mpg)
str(mpg)

col<-factor(diamonds$color,
levels=names(sort(table(diamonds$color),
decreasing=TRUE)))
diamonds %>%
	ggplot(aes(x=col))+
	geom_bar(fill = "red", color= "blue")

str(diamonds)


col <-sort(table(diamonds$color), decreasing = TRUE)
ggplot(aes(x=col))+
geom_bar()




library(ggplot2)
library(ggplot2)

diamonds %>%
  count(color) %>%
  arrange(desc(n)) %>%
  mutate(color = factor(color, levels = color)) %>%
  ggplot(aes(x = color, y = n)) +
  geom_bar(fill = "red", stat = "identity") +
  labs(title = "Count of Diamonds by Color", x = "Color", y = "Count") +
  theme_minimal()





library(ggplot2)
library(dplyr)

mpg_sorted <- mpg %>%
  group_by(class) %>%
  summarise(count = n()) %>%
  arrange(count)


ggplot(mpg_sorted, aes(x = reorder(class, count), y = count)) +
  geom_bar(stat = "identity") +
  labs(title = "Count of Vehicles by Class (Ascending Order)", x = "Vehicle Class", y = "Count") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

