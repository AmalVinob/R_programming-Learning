library(broom)
library(tidyverse)
library(statsr)
install.packages("statsr")
2. Use the dataset hfi in the package openintro and study the variables

library(openintro)
attach(hfi)
View(hfi)
?hfi

(a) What is hfi stands for?
hfi - Human Freedom Index


(b) Dimension of hfi
dim(hfi)
row- 1458  
column -123

(c) Use the function glance() , identify what the function retuns?
library(broom)
names(hfi)
?glance()
model1 <-lm(pf_ss_disappearances_disap ~ pf_ss_disappearances_violent, data= hfi)
glance(model1)

glance is used to find the summary of a model.
when glance is applied to a linear regression model, it return a tibble
contain summary staatistics about the model1



(d) Extract the data for the year 2016 with six selected variables and
store it hfi_2016

library(dplyr)
hfi_2016 <- hfi%>%
		filter( year == 2016) %>%
		select("countries", "pf_rol_criminal", "pf_ss_homicide", "pf_ss_disappearances_violent","pf_ss_women","hf_score")
View(hfi_2016)



(e) What type of plot would you use to display the relationship between
the personal freedom score, pf_score, and pf_expression_control?
Plot this relationship using the variable pf_expression_control as the
predictor. Does the relationship look linear?

i will use scatter plot from car package, so its so beautiful and can iterept well.
library(car)
scatterplot(pf_score~pf_expression_control, data= hfi )

from the scatterplot ican see there is a positive linear relation ship between variable



(f) If the relationship is linear, confirm the same with an appropriate
statistical measure. (hint: use pipes and summarize)

View(hfi$pf_expression_control)

hif_lm <- hfi%>%
	filter(pf_score >0, pf_expression_control>0)%>%
	summarise(correlation = cor(pf_score,pf_expression_control))

hif_lm

by finding the corelation between 2 variable the out put is 0.797 and its a positve correlation and 
its shows a relatively strong relationship.


(g) What is the output for the following code:

plot_ss(x = pf_expression_control, y= pf_score, data = hfi_2016,showSquare =TRUE)	# its inn statsr library

irepetedly run the code for 20 times and found that the 

Coefficients:
(Intercept)            x  
     3.8458       0.6989  


sum of squared :


smallestsum of squared is 965.721  (Sum of Squares:  965.721)
Sum of Squares:  118312.6
Sum of Squares:  68479.03
Sum of Squares:  1147.656
Sum of Squares:  1346.741
Sum of Squares:  1133.959
Sum of Squares:  1054.854
Sum of Squares:  1154.632
Sum of Squares:  992.085
Sum of Squares:  1343.44
Sum of Squares:  1090.625
Sum of Squares:  1386.992
Sum of Squares:  1038.263
Sum of Squares:  1287.636
Sum of Squares:  2190.579
Sum of Squares:  1220.019
Sum of Squares:  1259.453
Sum of Squares:  965.721
Sum of Squares:  992.989
Sum of Squares:  1034.86
Sum of Squares:  1035.568
Sum of Squares:  1015.182




h)
model <-lm( pf_score ~ pf_expression_control, data= hfi)
summary(model)
for this model 63.42 % of the variability in pf_score can be explaned by  pf_expression_control

intercept =  coef(model)[1]
intercept 
slop = coef(model)[2]
slop

pfscore =  4.617074 + 0.4914312 * pf_expression_control



i)

tidy(model)
 A tibble: 2 × 5
  term                  estimate std.error statistic   p.value
  <chr>                    <dbl>     <dbl>     <dbl>     <dbl>
1 (Intercept)              4.62     0.0575      80.4 0        
2 pf_expression_control    0.491    0.0101      48.8 8.19e-303

tidy is used to extrat the info about coefficients or parameter estimates .the information including 
estimate, standred error, statistics , and variable name,
it give a report of the effect ofpredictor variable in linear regression

in the given example the pvalue is very small that implises pf_expression_control is a strong predictor variable


glance(model)
# A tibble: 1 × 12
  r.squared adj.r.squared sigma statistic   p.value    df logLik   AIC   BIC
      <dbl>         <dbl> <dbl>     <dbl>     <dbl> <dbl>  <dbl> <dbl> <dbl>
1     0.634         0.634 0.832     2386. 8.19e-303     1 -1701. 3407. 3423.
# ℹ 3 more variables: deviance <dbl>, df.residual <int>, nobs <int>


glance give and high level summary statistrics that gprovide and overview of the model
it gives the out purt include rsquared .

in this example we can say that using r squared , 69 % of the time the pf_expression_control predicts pfscore


j)

library(mosaic)
mplot(model,1)
we can see some flluctuations on the line, so we can say that , it shows some unequal spread of residualss

mplot(model, 2)
there are some outliers and the line is not going throught the straight line we can say its showing some
non colinearity

mplot(model, 3)

mplot(model,4)

mplot(model, 5)

mplot(model, 6)

mplot(model, 7)











