library(car)
library(ggplot2)
library(dplyr)
library(mosaic)




# reading file from directory
std_df <- read.csv("C:\\Users\\amalv\\OneDrive\\Desktop\\alliance\\1st sem notes\\p r p\\python + r\\student_data.csv")
View(std_df)

#viewing dimensions
dim(std_df)
names(std_df)  # names of columns


#creating new dataframe using oldone by reducing no of attributes
std_prf <- std_df[,c("age", "sex" ,"school",'Pstatus', "famsize", "Medu","Fedu","studytime", "Mjob","Fjob","failures","traveltime","absences","famrel","health","G1","G2","G3")]     
View(std_prf)
dim(std_prf)
str(std_prf)
sum(is.na(std_prf))   #checking for null values



#finding count of factor variable
print(table(std_prf$school))
print(table(std_prf$sex))
print(table(std_prf$pstatus))
print(tally(std_prf$famsize))		#we can use tally too
print(tally(std_prf$health))		



#converting to factor variable
library(dplyr)
std_prf <- std_prf%>%
	mutate(sex= as.factor(sex),
	school= as.factor(school),
	famsize= as.factor(famsize),
	Mjob= as.factor(Mjob),
	Fjob= as.factor(Fjob),
	Pstatus = as.factor(Pstatus))
str(std_prf)

summary(std_prf)  #finding summary




ploting graphs
--------
plot(std_prf)				#plots every variable
#boxplot(std_prf, col="blue")	
numerical_data <-std_prf[, sapply(std_prf, is.numeric)]
boxplot(numerical_data, col="blue")		#box plot of every variable




visualisation for the variable 'age'   (# univariate)
---------------------------------------
par(mfrow = c(2,2))
plot(x=std_prf$age, y = std_prf$G3, col ="red")
hist(x = std_prf$age, col = "steelblue")
barplot(table(std_prf$age), col="skyblue")
Boxplot(std_prf$age,col = "lightblue")  # one outlier in age, age 248 its not a good thing.. shall we filter it out

std_prf <- std_prf %>%
	filter(age<248)
Boxplot(std_prf$age~std_prf$absence,col = "lightblue")
scatterplot(x=std_prf$age, y = std_prf$G3, col ="red") 



visualisation for the variable 'medu' #mother education
----------------------------------------
barplot(table(std_prf$Medu), col ='red')
ggplot(std_prf, aes(x = Medu, fill=Medu))+geom_bar()
Boxplot(std_prf$Medu, col="blue")

ggplot(std_prf, aes(x = Medu))+geom_histogram(binwidth=.5, fill="lightblue")+geom_density(col= "red")
ggplot(std_prf, aes(x = Medu))+geom_bar( fill="lightblue")+geom_smooth(method='lm',col= "red")

ggplot(data = std_prf, aes(x = Medu, y = G3))+
	geom_point()+
	geom_smooth()





visualisation for the variable 'study_time'
--------------------------------------------------
par(mfrow = c(2,1))
hist(x = std_prf$studytime, col="blue")
Boxplot(std_prf$studytime, col= "red", id=list(label = rownames(std_prf)))

ggplot( data=std_prf, aes(x=studytime, y = school, fill=school))+ geom_boxplot(col = "red", fill="steelblue")+
facet_grid(.~sex)	



visualisation for the variable  'failures'
-------------------------------------------
par(mfrow = c(1,2))
hist(x = std_prf$failures, col = "blue")
Boxplot(~failures, data=std_prf, col = "lightblue", id = list(label= rownames(std_prf)))


scatterplot(x= std_prf$failures, y = std_prf$G3)
ggplot(data = std_prf, aes(x =failures, y = G3))+geom_point()



visualisation for the variable  'G1,G2,G3'  (# bivariate plot)
-------------------------------------------
scatterplot(x = std_prf$G1, y = std_prf$G2)
scatterplot(x = std_prf$G1, y = std_prf$G3)
scatterplot(x = std_prf$G2, y = std_prf$G3)


# pie chart
pie(table(std_prf$sex))
sex_tab <- table(std_prf$sex)
pie(sex_table, main= "Distribution of Gender", labels =paste(names(sex_tab),sex_tab), cex= 0.8)
pie3D(sex_tab, main= "3D Pie Chart", explode= 0.2,  labels =paste(names(sex_tab),sex_tab))




relation ship between variables and G3
---------------------------------
result_list <- list()

for ( i in names(std_prf)){
	uniq_val <- unique(std_prf[[i]])
	if( any(uniq_val > 6)){
	}else{
		result <-std_prf %>%
			group_by(across(all_of(i)))%>%
			summarise(mean_mark = mean(G3, na.rm =TRUE), .group= 'drop')
		result_list[[i]] <- result
	}
}

print(result_list)






 model  building
------------------

for(i in names(std_prf)){
	model <- lm(G1~std_prf[[i]], 
			data= std_prf)
	print(i)
	print(summary(model))
}# by doing this i get to know which are the varibles that are good at predicting....


#orginal dataset model
for(i in names(std_df)){
	model <- lm(G1~std_df[[i]], 
			data= std_prf)
	print(i)
	print(summary(model)$r.squared)		#r-squared should be good for the variables that used in predicting
}



linear modeling of G2 on G1
--------------------------
G2 - dependent #mark 1st sem
g1 independent  # mark 2nd sem
model <- lm(G2~G1, 
		data= std_df)
summary(model)
summary(model)$r.squared
0.7261052
#here G2 explanes 72 % change in the mark-G2


linear modeling G3 on G2
model <- lm(G3~G2, 
		data= std_df)
summary(model1)
summary(model1)$r.squared
0.8187861
#here G2 explanes 82 % of the change in  the mark G3



plot(density(std_prf$absences))   # positive skewed data so we are going to do log transformation
std_prf$logabs <- log10(std_prf$absence + .1)
model1 <-lm(G1~logabs,
		data = std_prf)
summary(model)
#R-squared:  0.6424, so absence tells or explanes 65 % of the change in mark 





multiple linear regression
--------------------------
# here G3 is dependent variable and it is dependent on independent variable G2 and G1
model2 <- lm(G3 ~ G2+G1,
		data = std_prf)
summary(model2)
#both G1 and G2 explanes 82 % of the change in G3



names(std_df)
#model2 <- lm(G3 ~ traveltime+failures,
#		data = std_prf)
#summary(model2)
# R-squared:  0.137
# not a good model



mlr with G3 as dependent and g2 and logabs(absences) as independent
model2 <- lm(G3 ~ G2+logabs,
		data = std_prf)
summary(model2)
#R-squared:  0.8389,  this model G2 and absences explanes 83 % change in G3


















