pipe & dplyr package
--------------

filter, groupby, select, summarise, mutate, arange


1. mutate (to create new column)
-----------

lets attach mtcars 

attach(mtcars)
View(mtcars)

mtcar <-mtcars
here after we gonna use mtcar

Create a new variable "displacement_l" based on "disp"

mtcar<- mutate(mtcar, displacement_1 = disp * .016879)		
head(mtcar)  		#you can see a new column is created

syntax : dataframe name = mutate(dataframe name , new_column_name = value)

lets use pipes

mtcar <- mtcar%>%		# pipes are much simpler
	mutate(displacement_2 = disp * .0235)
head(mtcar)



1.1
#create a column that says if the cyl is greater than 5 then the column shoul show 
#greater, if the cyl is less than 5 then its say less.

mtcar <-mtcar%>%
	mutate(cyl_score =  ifelse( cyl>5, "greater", "lesser"))
	#mutate(colum_name = ifelse(condition, "value1", "value2")

head(mtcar)

#"ifelse(condition, true_value, false_value)"





2. filter

filter used to filter out the things we want or condition we have
eg if u only want values greater than mean then u can use filter

q, we nned only value of disp that is greater than 200

mtcar_1 <- filter(mtcar, disp > 200 )
View(mtcar_1)			# we store it in new var ,we have only data that are greater than 200

View(filter(mtcar, disp > 200 ))   #same as above , it wont store anywhere just display the value
there is row name delete it.




q2,filterout the value that are greater than mean of disp.
we can do it 2 type

mean_disp <-mean(mtcar$disp)

mtcar_mean <- filter(mtcar, disp > mean_disp)
View(mtcar_mean)

mtcar_mean<- filter(mtcar, disp >  mean(disp))
View(mtcar_mean)

# theres one problem if thweere are na values then it wont work so we nned to do something

mtcar_mean<- filter(mtcar, disp >  mean(disp, na.rm= TRUE))  #remove na values
View(mtcar_mean)





3,select 	(to select columns)
--------

mtcar_1 <- select(mtcar, disp, cyl)
View(mtcar_1)


we can select using column numbers 
mtcar_1 <- select(mtcar, 1,2,3,4)
head(mtcar_1)




4,arrange 		# arrange the dataset in asceding or descending order acoording to a column

lets try


mtcar_1 <- arrange(mtcar, cyl)
head(mtcar_1)

View(arrange(mtcar, desc(cyl)))			#arrange df  according to decending order of cyl
View(arrange(mtcar, disp, cyl))			# find what it is.
View(arrange(mtcar, disp, desc(cyl)))



5, summarise    to find summary statistics


summarise(mtcar, mean(disp))
summarise(mtcar, mean(cyl), median(disp))
summarise(mtcar, count= n())



6,group_by 		# grouping elements (mainly factor var or have number in small range)
mtcar_1<- mtcar%>%
	group_by(cyl)%>%
	summarise(count = n())		

mtcar_1



# count n means it will count the value , if u dont use the groupby it will give
#u value 32 ie 32 rows( it count the number if rows)
#now when we use groupby it wil count the no of values in the group



df <- data.frame(group = c('A', 'B', 'B', 'A', 'B'))

summary_df <- df %>%
  group_by(group)
print(summary_df)
				# see the difference
summary_df <- df %>%
  group_by(group)%>%
  summarise(count = n())
print(summary_df)
	



q,
data <- data.frame(
  Region = c("East", "West", "North", "South", "East", "West", "North", "South"),
  Sales = c(1200, 1500, 1800, 900, 1000, 1300, 1600, 800),
  Profit = c(100, 200, 150, 50, 120, 180, 140, 60)
)


# Group by 'Region' and calculate mean 'Sales' and median 'Profit'
summary_by_region <- data %>%
  group_by(Region) %>%
  summarise(mean_sales = mean(Sales), median_profit = median(Profit))

print(summary_by_region)







question
----------
In the "mtcars" dataset, find the average miles per gallon (mpg) for cars with 
different numbers of cylinders (cyl). Additionally, calculate the total number 
of cars and the minimum and maximum horsepower (hp) for each group. Sort the 
results in descending order of average mpg

# not a big question simple one


what is the question 1st find the avg of mpg with diff cylinder
so fist lets try groupby,then summarise finished

mtcar_1 <-mtcar%>%
		group_by(cyl)%>%
		summarise(mean_mpg= mean(mpg), total_count= n(), min_hp = min(hp), max_hp = max(hp))

mtcar_1


arrange the values last step

mtcar_1 <-mtcar%>%
		group_by(cyl)%>%
		summarise(mean_mpg= mean(mpg), total_count= n(), min_hp = min(hp), max_hp = max(hp))%>%
		arrange(desc(mean_mpg)) 	

mtcar_1




question
=---------=
In the "mtcars" dataset, find the top 5 cars with the highest miles per gallon (mpg). For each of 
these top 5 cars, calculate the average horsepower (hp) for cars with the same number of cylinders 
(cyl) as each of the top 5 cars. Sort the results by the average horsepower in descending order.


fist lets find 5 top cars
how? only one method arrange in descending order then take 5 values

top_5_car<- mtcar%>%
		arrange(desc(mpg))%>%
		head(5)
View(top_5_car)			#we success fully selected top 5 ccar now lets continue


calculate the average horsepower (hp) for cars with the same number of cylinders 
(cyl) as each of the top 5 cars

avg_hp <- top_5_car %>%
		group_by(cyl)%>%
		summarise(avg_hp = mean(hp))
avg_hp
#unfortuntly we have only one value because top 5 car are of cyl = 4,
so if its not then arrange it using  # arrange(desc(avg_hp)





	

