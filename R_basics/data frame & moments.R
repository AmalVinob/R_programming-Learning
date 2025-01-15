moments , data frame, 
----------------------



dataframe
-----------

how to create one?

college<- data.frame(name = c("akhil", "deeksha", "imam", "mary", "raj", "sai"),
			   rollno = c(1,2,3,4,5,6),
			   marks = c(40, 50, 45, 60, 55, 45),
			   sex = c("m", "f", "m", "f", "m", "m")
)

college

# we use data.frame to create data base,
# like a dictionay stores value the variable college stores these values
# name is the 1st column that have character values

lets do some random basic things that can be done in a dataframe

dim(college)  			# dimention (size of data frame)
summary(college)			# 5 point summary (min, max, quartiles)
str(college)			# structure of df(it will provide you with a concise summary of the structure and contents of the data frame.)
class(college)
head(college)			# it will show 1st 6 value (out data only have 6 value try with some other data set
tail(college)			# show last 6 value,  try it with some other data set
names(college)			# give column names




lets find- mean, median, min, max quantiles etc of marks
mean(college$marks)
median(college$marks)			
min(college$marks)
max(college$marks)
quantile(college$marks) 		# give every quantile 
quantile(college$marks)["25%"] 	# give specific quntile	
quantile(college$marks)["50%"] 	# same as median
quantile(college$marks)["75%"] 		
sd(college$marks)				#standred deviation of data
var(college$marks)			#variance of data

										



# this is the output of college
> college
     name rollno marks sex
1   akhil      1    40   m
2 deeksha      2    50   f
3    imam      3    45   m
4    mary      4    60   f
5     raj      5    55   m
6     sai      6    45   m

rownames(college)
#output = > [1] "1" "2" "3" "4" "5" "6"

##can we delete rownames ? this was the one question asked in exam?

rownames(college) <- NULL
college

here in this dataframe it have rowname shall we deletee it?
data(USArrests)      # calling data frame (u can also use attach(USArrests)
View(USArrests)	   # just viewed	
a<- USArrests	   # give the data set to new var a (a was an empty variable we copy all the values of USArrests to a.)

rownames(a) <- NULL
View(a)
its row name is deleted





table(college$sex) 			# frequency table, which displays the counts of unique values in a categorical variable.

what is factorisation 
make variable factor?
we can make sex in college df as a factor

college$sex <-as.factor(college$sex)			
str(college)
lets check if it converted into factor or not
is.factor(college$sex)				#true

why we factorise? 
#  have a limited number of distinct values. here only (male and female)
#some time we take 2,3,4, values to make it factor


how to levels factor variable?
2 methods

unique(college$sex)
levels(college$sex)


to find number of factor variable we use table
table(college$sex)




?iris  	# this give us the descreption about data, look it before starrting analysis
how to attach a data set
attach(iris)
View(iris)
dim(iris)
....same old things....

how to find if there is any null values in the data set?
is.null(iris)
sum(is.null(iris))




lets take some other data set with na value
attach(airquality)
View(airquality)


# we can see somany NA values in the data set lets count total NA values in the data set
is.na(airquality)			#ucannot understand it so we use sum.
sum(is.na(airquality))		#na and null are deferent, its summ the total na values
is.na - means is there any na values ? and sum sum the total na values

sum(is.na(airquality$Ozone))	# we found there are 37 na values in airquality








moments
----------
library(moments)   		# if u dont have library moments download throurh install.packages("moments")
# moments helps to find the skewnwss , kurtosis (can find central moments also),etc
??moments

skewness(airquality$Ozone)	# why NA because there are na values in Ozone

#so we can remove na
skewness(airquality$Ozone, na.rm= TRUE)  #na.rm means remove na
# if u dont find any skewnwss check for NA value amd use the above equation

kurtosis(airquality$Ozone)
kurtosis(airquality$Ozone, na.rm= TRUE)





how to interept with skewness and kurtosis??

skewness - if the value > 0 then its positive skewed and have a right tail,
		if the value < 0 then its -ve ly skewed and have a left tail,
		if the value = 0 then it is a symetric data ,
		here we got 1.22 for ozone its a right tailed data

kurtosis- if the value = 3 its like a normal distribution, 
    Leptokurtic -value >3 means have more out liers and more value are concentrated around mean and peakness is high
    Platykurtic-value <3 means it have a flat curve rather than a point curve  like Leptokurtic



we will see this later in density curve.







