df <- read.csv("C:\\Users\\amalv\\OneDrive\\Desktop\\sample\\penguins-raw.csv")
View(df)
summary(df)
sum(is.na(df))

class(df)
str(df)

dim(df)

colnames(df)

mean(df$Culmen.Length..mm.)
df$Culmen.Length..mm.

sum(is.na(df$Culmen.Length..mm.))

median(df$Culmen.Length..mm.)

typeof(df$Culmen.Length..mm.)

hist(df$Culmen.Length..mm., col="yellow")

df[4,10] = (df[3,10]+df[5,10])/2


str(df)





df[4,10]

df[272,10] = (df[271,10]+df[273,10])/2
df[272,10]

sum(is.na(df$Culmen.Length..mm.))





rows_with_na <- which(apply(is.na(df), 1, any))
columns_with_na <- which(apply(is.na(df), 2, any))

print("Rows with missing values:")
print(rows_with_na)

print("Columns with missing values:")
print(columns_with_na)

sum(is.na(df))


a = factor(df$studyName)
levels(a)

t= split(df, df$studyName)
barplot(table(df$studyName),col="yellow")

table(df$studyName)
colnames(df)

boxplot(Flipper.Length..mm.~Species,data=df)

summary(df$Flipper.Length..mm.)


barplot(table(df$Island), col="yellow")

colnames(df)
str(df)

hist(df$Sample.Number )

table(df$Region )

table(df$Clutch.Completion)

table(df$Stage)

str(df)
table(df$Individual.ID)

table(df$Date)

levels(factor(df$Date.Egg))

m =mean(df$Culmen.Length..mm.)
m
median(df$Culmen.Length..mm.)
hist(df$Culmen.Length..mm. > 43, col="steelblue")

eff = subset(df,Culmen.Length..mm.>43)
eff

hist(df$Culmen.Length..mm., col="steelblue")

str(df)

mean(df$Culmen.Depth..mm.)
sum(is.na(df$Culmen.Depth..mm.))


boxplot(df$Flipper.Length..mm., df$Culmen.Depth..mm.)


str(df)

study_name <- as.factor(df$studyName)
levels(study_name)


barplot(table(df$Sex),df$Flipper.Length..mm.)

numbers_list <- list(a = 1:5, b = 6:10, c = 11:15)
result <- lapply(numbers_list, mean)


df[c(1:5),"studyName"]


hist(df$Body.Mass..g., breaks=10, main="body mass", col="skyblue")
abline(v=mean(df$Body.Mass..g.), col="yellow", lwd=10)


which.min(df$Body.Mass..g.)

body_mass <-subset(df, Body.Mass..g.>314)
hist(body_mass, breaks=10, main="body mass", col="skyblue")
abline(v=mean(body_mass$Body.Mass..g.), col="yellow", lwd=10)
mean(body_mass$Body.Mass..g.)





boxplot(Flipper.Length..mm.~Species, data=df, col=c("green","yellow","red"),
	main="which cylynder is better",xlab="transmisiion type",
	ylab="milles per gallon")

library(magrittr)
library(dplyr)
a = filter(df, Flipper.Length..mm.> 200)
a

b = group_by(a, Species)
b


c <- summarise(b,avg_mean= mean(Flipper.Length..mm.))
c

d<- arrange(c, desc(avg_mean))
d


df %>%
	filter(Flipper.Length..mm.> 200)%>%
	group_by(Species)%>%
	summarise(avg_mean = mean(Flipper.Length..mm.))%>%
	arrange(desc(avg_mean))

str(df)

library(explore)
df  %>%
	explore_tbl()

df %>% describe()

df%>%
	explore_all()

df%>%
	explore_all(Flipper.Length..mm.)

df %>%
	select(Flipper.Length..mm.,Delta.15.N..o.oo.,Culmen.Depth..mm.,Culmen.Length..mm.)%>%
	explore(target = Flipper.Length..mm.)	


df%>%
	extract(,1:4)%>%
	head





---------------------------------------------------
rows_with_na <- which(apply(is.na(df), 1, any))
columns_with_na <- which(apply(is.na(df), 2, any))

print("Rows with missing values:")
print(rows_with_na)

print("Columns with missing values:")
print(columns_with_na)

------------------------------------------



find the missing values and change it





library(ggplot2)

ggplot(df, aes(x = Sex, y = Flipper.Length..mm.)) +
  geom_boxplot(fill = "skyblue") +
  labs(title = "Comparison of Flipper Length by Sex", 
       x = "Sex", y = "Flipper Length (mm)")
