## This is the lab for week 2. 
## Add working R code in between the questions
## The chapters refer to the sections in https://rspatial.org/intr/

## Chapter 8  (Functions)

## 1) Write a function 'f' that behaves like this:----
## > f('Jim')
## [1] "hello Jim, how are you?"

f <- function(name) {
  r <- paste0("hello ", name, ", how are you?")
  return(r)
}


## 2) Write a function 'sumOfSquares' that behaves like this:----


## > d <- c(1,5,2,4,6,2,4,5)
## > sumOfSquares(d)
## [1] 21.875

# To compute the "sum of squares", subtract the mean value of all numbers from each number. 
# Square these numbers and sum them
# (bonus: make a variant that can handle NAs)

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

## 3) compute the minimum, mean and maximum values for each variable in state.x77 using 'apply'----

apply(state.x77, 2, min)
apply(state.x77, 2, mean)
apply(state.x77, 2, max)

## Chapter 10  (Flow control)

## 4) Write a for loop that adds the numbers 1 to 10
r <- 0
for (i in 1:10) {
  r <- r + i
}
r

## 5) Write a for loop that adds the odd numbers between 1 and 10 
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

