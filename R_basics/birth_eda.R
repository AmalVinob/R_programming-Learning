birth <-read.csv("C:\\Users\\amalv\\OneDrive\\Desktop\\alliance\\1st sem notes\\p r p\\New folder\\ncbirths.csv")
library(dplyr)

View(birth)
dim(birth)
summary(birth)

str(birth)

we are taking 6 variable(1.mage, 2.weeks, 3.gained, 4.weight, 5.lowbirthweight,6.habit)
y factor cannod be a dependent variablr

birth_1<- birth("mage","weeks","gained","weight","lowbirthweight","habit")

birth_1<- subset(birth, select= c("mage","weeks","gained","weight","lowbirthweight","habit"))

View(birth_1)

plot(birth_1)

str(birth_1)



model1 <-lm(gained~weeks, data=birth_1)
summary(model1)
with(birth_1, cor(gained,weeks))
cor(birth_1$weeks,birth_1$gained)



