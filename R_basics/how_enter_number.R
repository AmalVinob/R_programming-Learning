how to enter a number using comand


number = readline(prompt = "enter your umber : ")

number = as.numeric(number)

print(paste("the number u entered is :", number))


cat("enter yor numebr")
num <- scan(n=1, what = numeric())
num


cat("enter 2 number  :")
c(num1, num2) <- scan(n= 2, what= numeric())
print(num1,num2)



cat("Enter 2 numbers separated by a space: ")
input_values <- scan(n = 2, what = numeric())
5
# Assigning values to variables num1 and num2
num1 <- input_values[1]
num2 <- input_values[2]

# Printing the entered values
print(paste("You entered num1:", num1))
print(paste("You entered num2:", num2))






number1 <-as.numeric(readline(prompt = "enter your number"))

number1








vote <- function(){
	age<- as.numeric(readline(prompt = "enter your age : "))
	if(age <=0){
		print("give a valid age")
	}else{
		if(age>=18){
			print("your are eligible for voting ")
		}else{
			print("your are eligible not for voting ")
		}
	}
}

vote()














