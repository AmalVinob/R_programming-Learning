#1. The sum of any six integers and three real numbers (example 20.53)
a <-c(3,4,5,7,8,9,2.5,6.7,9.4)
sum(a)

#2. The square root and cube root of your favorite integer
a <-64
sqrt(a)
a^(1/3)

#3. Find the value of trigonometric functions such as sin(45)
sin(30)
tan(45)
cos(60)

#4. Find the value of log (350) with base 10, 2, 3 and 5
log10(350)
log2(350)
log(350, base=3)
log(350, base=5)

#5.Compute the cumulative sum of seven integers 3, 5,76,8,5,11,23

a<-c(3,5,76,8,5,11,23)
cumulative_sum<-cumsum(a)
cumulative_sum


#6. Use the code x<-1:10 and y<-2 and compute the product, sum and store these results in p and q

x<-1:10
y<-2

q<- x * y
p<- sum(x) + y
p
q

#7.Verify your workspace by typing the code, ls() and see that in R console the objects created by you 
that is x, y, p and q

ls()
#i get p and q

#8.Create a vector using x, y,z, p and q (as myv<-c(x,y,p,q) )
?myv

x<-2
y<-5
z<-10
p<-8
q<-9

myv<-c(x,y,p,q)
myv

#9. Obtain the length, mean, variance (square of standard deviation),minimum,
#maximum and the length of myv 
length(myv)
mean(myv)
var(myv)
sd(myv)
min(myv)
max(myv)

#10. Remove myv from the workshop and verify myv is removed or not by typing
#the following.
ls()
rm(myv)
ls()

#11. type the following:
ten<-10
nine<-9
class(ten)
class(nine)

#12. type the following and check its type:
v1<-c("A","B","d")
v2<-c(2,4, 7)
class(v1)
class(v2)

#13. Trust you are in position to identify the vectors of numeric, char types
without using the class() function. Now the type the following as it is, note
the errors and correct the code and get its output.
R<- c('ten', 'nine', 'five', 'one')
R
k.mean<-mean(c(1,2,3,45))
k.mean

#14. Measure the heights and weights of your five friends and store them as
High and Weigh vectors
high<-c(150,162,175,174,169)
weight<-c(52,72,82,70,65)
high
weight

#15. Compute the correlation between High & Weigh vectors by using the
function cor( )
cor(high,weight)

#16. Type LETTERS in R console, identify its output
?LETTERS

#17. Create a vector that produces the output as “A”,”A”, “A”, “B”,”B”,B” using
the function rep()
Example: A<-c(1,2,3); rep(A, each=3)

A <-c("A","B","C")
rep(A, each=3)
rep(A, times=5)

#18. Create a vector that produces the output as “A”,”B”,”A”,”B”,”A”,”B” using the
times

B<- c("A","B")
rep(B, times=3)

#19. Obtain 5 random letters in lowercase (Hint: look at question 16 and use
sample(LETTERS,5)
x<-sample(letters,5)
x

#20.Sort the letters obtained in qno15.
sort(high)
sort(weight)

#21. Download the csv file from LMS/email attachment. Read the csv file as
(a) Mydata1<- read.csv(file.choose())
(b) Mydata1<- read.csv(“c:/path”)
Or
Use the function getwd(). Save the csv file in the same directory
then mydata1<- read.csv(“filename”)

setwd("C:\\Users\\amalv\\OneDrive\\Desktop\\alliance\\1st sem notes\\p r p\\sampledataset")
ls()
getwd()
mydata1<-read.csv("cereals.csv")
View(mydata1)


#22. Use the function head(mydata1)
head(mydata1)

#23. Use ? read.csv() and understand the various possibilities of it
?read.csv()

#24. Using read.csv() function, read a csv file and skip from 5 th row to 10th row
and verify it.
data1 <-read.csv("cereals.csv", skip=5, header=TRUE)
View(data1)
View(mydata1)


#25. Use the function str(mydata1) to get the info on the mydata1
str(mydata1)


#26. Create a data frame that has 10 observations with two columns, radius in
inches and height.
(a). Create a new variable namely radius in cms ( hint: 1 inch =2.54)
(b). Create a new variable namely diameter in inches
(c). Create a new variable namely volume using the function with()
 Volume <- with(df, (2*df$radius)^2 *height) 


Height=c(170,169,168,159,160,168,174,172,163,178)
radius=c(5,6,9,8,7,4,6,8,9,8)
df<- data.frame(radius_inch=radius, height=Height)
View(df)

#(a). Create a new variable namely radius in cms ( hint: 1 inch =2.54)
library(dplyr)
df$radius_cm<-df$radius_inch * 2.54
View(df)


#(b). Create a new variable namely diameter in inches
df$diameter_inch<-radius * 2 
View(df)

#(c). Create a new variable namely volume using the function with()
volume = pie * r^2 * h
df$volume<-with(df, 3.14*df$radius_inch^2*height)

View(df)

#27. use summary(A) function on mydata1 and fivenum(A), where A is the vector
created in qno17

View(mydata1)
summary(mydata1)
fivenum(mydata1,na.rm=True)

A <- c(5, 6, 9, 8, 7, 4, 6, 8, 9, 8)
summary(A)
fivenum(A)

#28. Find the number of rows, columns of dataframe using the function nrow() &
ncol()
nrow(mydata1)
ncol(mydata1)


#29 Creating two vectors as
Num <- c(2,4,7,9,100,8,9)
Num1 <- c(2.3, 8.4, 2.5, 9.8, 2.13, 3.14, 0.7, 0.9)
(a). Extract first element of Num
(b). Extract second element of Num1
(c). Extract first four elements of Num1.

Num <- c(2,4,7,9,100,8,9)
Num1 <- c(2.3, 8.4, 2.5, 9.8, 2.13, 3.14, 0.7, 0.9)

Num[1]
Num1[2]
Num[1:4]


#30 Create a sequence from 2 to 10 and select every other elements
B<- seq(2,10)
B<- seq(2:10, by =2)
Do the same by replacing by =2 as by =3 and observe the difference

B<- seq(2,10)
B
B<- seq(2,10, by =2)
B

B<- seq(2,10, by =3)
B

#31. Attach the dataset iris
attach(iris)

#32.Extract 4th row and 2nd column value and verify the same using View(iris)
a <-iris[4,2]
a

View(iris)

#33.Compare your result with iris[4, “Sepal.Width”]
iris[4, "Sepal.Width"]

#34.Extract first 3 rows for the column name Sepal.Length
iris[1:3,"Sepal.Length"]

View(iris)

#35. Extract the values in the fourth column
View(iris[4,])

#36. Select Sepal.Length and Petal.Length and store in a dataframe, “iris1”
iris1<- iris[,c("Sepal.Length", "Petal.Length")]
View(iris1)

iris2 <- iris %>% select(Sepal.Length, Petal.Length)
View(iris2)


#37. Extract all observations that has Sepal.Length >2.3
iris_sepal<-iris[,"Sepal.Length">2.3]
View(iris_sepal)

#38. Extract the observations that has only Sepal.Length and Petal.Length and
stor in a new dataframe iris2, using the function subset()

iris2<-subset(iris, select = c(Sepal.Length, Petal.Length))
iris2
View(iris2)

#39. 39.Delete the second column in iris2 using iris2 <- iris2[,-2]

iris2<- iris2[,-2]
View(iris2)


#40. . Use subset() to remove a column, iris3<- subset(iris, select=-k)
iris3<-subset(iris, select= -Sepal.Length)
View(iris3)

#41. Use the dataset mtcars, obtain subset of it where mpg >16
➢ Mtcars[mpg>16]
attach(mtcars)
View(mtcars)
a=mtcars[,"mpg">16]
View(a)
View(mtcars[,"mpg">16])


#42.Use the mtcars dataset, what is the mean mpg for all cars where mpg was
atleast 18. Use as in the previous question.

mt_car <-mtcars[,"mpg">18]
mean(mt_car$mpg)


#43. Identify the 20th alphabet in English, using LETTERS
alp_20<-LETTERS[20]
alp_20

44.What is the last letter of the alphabet. (use code, the function length())
length((LETTERS))

45. Use ? sample in R console to understand how to sample with replacement.
Obtain a sample of 18 letters with replacement. Are any duplicates in the 
sample?

alp <-sample(LETTERS,18, replace=TRUE)
alp


46. From the attached file called cereals.csv. Read in the dataset using the 
function read.csv(file.choose()) and apply str() , write your observations

setwd("C:\\Users\\amalv\\OneDrive\\Desktop\\alliance\\1st sem notes\\p r p\\sampledataset")
ls()
getwd()
mydata1<-read.csv("cereals.csv")
str(mydata1)


47. Add a new variable to the dataset name it as “totcarb”, that is sum of carbo 
and sugars. Verify by typing the function names(cereals)

mydata1$totcarb<- mydata1$carbo + mydata1$sugars
View(mydata1)
View(mydata1[,c("totcarb","carbo","sugars")])



#48.How many cereals in the dataframe are ‘cold’ cereals? (hint: use subset() 
and nrow() )


unique(mydata1$Cold.or.Hot)
?subset
1st method
-----------
mydata1_cold <-subset(mydata1, select="Cold.or.Hot")
mydata1_cold.nrow("c")
nrow(mydata1_cold)
?nrow
table(mydata1_cold)


2nd method
----------
mydata2_cold <-subset(mydata1, Cold.or.Hot == "C")
nrow(mydata2_cold)
#worked

#49.How many unique manufacturers are there in the dataset? (Hint use the 
function unique() and length())

names(mydata1)
count_man<-unique(mydata1$Manufacturer)
length(count_man)


#50. Obtain a subset of the dataset with only the manufacturer “Q”

manu <- subset(mydata1,Manufacturer == "Q")
View(manu )



#51. 51. Obtain a subset of the dataset of all cereals that have less than 75 calories 
and 15 units of vitamins.

mydata2<-mydata1%>%
	filter(calories > 75 & vitamins>15)
there is no vitamins with value 15
View(mydata2)


#52. Obtain a subset of the dataframe that has at least 1 unit of sugar and 
subset mut have the variables, “Cereal.name”, “Calories” and “vitamins” only 
and verify the same by the function head() or names()

mydata3<- mydata1%>%
	filter(sugars > 1)%>%
	select(Cereal.name,calories,vitamins)
head(mydata3)
names(mydata3)



#53. Use ?? write.csv to understand it and write a new csv with name cr1 in your 
system using write.csv()


?write.csv()
write.csv(mydata2, "C:\\Users\\amalv\\OneDrive\\Desktop\\alliance\\1st sem notes\\p r p\\sampledataset", row.names = FALSE)




#54.Attach the dataset, “Titanic” and it will throw error. But you use 
View(Titanic) you would see the dataset. Why it so?. Convert is as a 
dataframe by typing Titanic <- data.frame(Titanic)

View(Titanic)
Titanic <-data.frame(Titanic)


#55. Obtain two new data frames (a) subset of females survivors and (b) subset 
of male survivors (Two possible ways (a) .[ ] or (b).subset())

sup_male<-Titanic[Titanic$Sex =="Male",]
sup_male


sup_female <-subset(Titanic, Sex== "Female")
sup_female



56.56. Read the csv file called hydro.csv and understand the data well
hydro <-read.csv("hydro.csv")
View(hydro)


#57. Suppose the storage is less than 240 Gwh then it very low and all other 
problems may arise. How many weeks was the dam storage less than or equal 
to this level (240)


hydro1<-hydro%>%
	filter(storage<=240)%>%
	summarise(count = n())

hydro1




58. Use diff() function and what did you notice on applying this function on Date
?diff
diff(hydro$Date)
str(hydro)
numeric_dates <- as.numeric(hydro$Date)
date_diff <- diff(numeric_dates)
date_diff


59. Convert CO2_treatement as a factor variable, inspect the levels of this 
factor variable.
str(Titanic)











62..Make a line plot of storage v/s Date for hydro dataset
You may see an empty screen, one of reasons for this is that the date is not 
in an appropriate format. Verify first using class(hydro$date).To convert it 
we will use lubridate package as:
hydro2<-hydro
str(hydro2)
class(hydro$Date)

hydro$Date <-as.date(hydro$Date)
?as.date

library(lubridate)
library(ggplot2)
hydro$Date<-as.Date(dmy(hydro$Date))
ggplot(hydro, aes(x=hydro$Date, y=hydro$storage))+geom_line()



Install.packages(lubridate)
hydro$Date <- as.Date(dmy(hydro$Date)

ggplot(data = hydro, aes(x = Date, y = storage)) +
  geom_line()




63. Using the following and observe and make comments
library(epade)
?epade
attach(mpg)
attach(mtcars)
str(mtcars)
histogram.ade(mpg~ hp,data=mtcaras)
hist.epade(mpg ~ hp, data = mtcars)
histogram_activity(data=mtcars)



64. Make scatter plot of Frass v/s PupalWeight using different colors for each 
CO2 concentration. (use ggplot2)

pupae<- read.csv("pupae.csv")
View(pupae)

ggplot(data = pupae, aes(x=Frass , y=PupalWeight))+geom_point()


60.. Plot a scatterplot of Frass V/s PupalWeight with bluesolid circles for CO2 
concentration of 280 ppm and red for 400ppm and add a legend (lables). 
[Hint use the function palette() for colors]

pupae$CO2_treatment <-as.factor(pupae$CO2_treatment)
ggplot(data=pupae, aes(x=Frass , y=PupalWeight, color=CO2_treatment))+geom_point()


61. Observe the previous plot has both temperature treatment is combined. 
Hence, make two plots (adjacent to each other/separate plots) one with the 
“ambient” temperature and the other with elevated.

ggplot(pupae,aes(x=Frass, y=PupalWeight, color=CO2_treatment))+
geom_point()+labs(title="Frass vs PupalWeight", x = "Frass", y="PupalWeight") 


ggplot(pupae, aes(x=T_treatment))+
facet_wrap(~T_treatment, ncol=1)+geom_bar(fill="blue")



#65.Write a function to find variance of a set of given numbers.
