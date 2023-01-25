## This is the lab for week 2. 
## Add working R code in between the questions
## The chapters refer to the sections in http://rspatial.org/intr/

## Chapter 8  (Functions)

## 18) Write a function 'f' that behaves like this:
## > f('Jim')
## [1] "hello Jim, how are you?"

f <- function(name) {
	r <- paste0("hello ", name, ", how are you?")
	return(r)
}

## 19) Write a function 'sumOfSquares' that behaves like this:


## > d <- c(1,5,2,4,6,2,4,5)
## > sumOfSquares(d)
## [1] 21.875

# To compute the "sum of squares", subtract the mean value of all numbers from each number. 
# Square these numbers and sum them
# (bonus: make a variant that can handle NA values)


sumOfSquares1 <- function(x, na.rm=FALSE) {
	mn <- mean(x, na.rm=na.rm)
	difsq <- (x - mn)^2
	ss <- mean(difsq, na.rm=na.rm)
	return(ss)
}	

sumOfSquares2 <- function(x, na.rm=FALSE) {
	if (na.rm) x <- na.omit(x)
	mn <- mean(x)
	difsq <- (x - mn)^2
	ss <- mean(difsq)
	return(ss)
}	
	
d <- c(1,5,2,4,6,2,4,5)
sumOfSquares(d)


## Chapter 9 (Apply)

## 20) compute the minimum, mean and maximum values for each variable in state.x77 using 'apply'


apply(state.x77, 2, min)
apply(state.x77, 2, mean)
apply(state.x77, 2, max)


## Chapter 10  (Flow control)

## 21) Write a for loop that adds the numbers 1 to 10

r <- 0
for (i in 1:10) {
	r <- r + i
}
r


## 22) Write a for loop that adds the uneven numbers between 1 and 10 

r <- 0
for (i in 1:10) {
	if ((i %% 2) != 0) {
		r <- r + i
	}
}
r


r <- 0
s <- seq(1,9,2)
for (i in s) {
	r <- r + i
}
r



## Chapter 12  (Graphics)

## 23) Make a histogram of population using the state.x77 data

hist(state.x77[, 'Population'], xlab="Population (1000s)", main="Population by state")


## 24) Make a scatterplot of income vs. illiteracy using the state.x77 data
##     --- use nice axis labels

plot( Illiteracy ~ Population, data=state.x77)

plot(state.x77[, c('Population', 'Illiteracy')], xlab="Pop (1000s)", ylab="Illiteracy (%)")

## 25) add a regression line to the plot made in question 25

d <- data.frame(state.x77)
m <- lm( Illiteracy ~ Population, data=d)
abline(m)


