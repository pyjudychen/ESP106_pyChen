## This is the lab for week 1. 
## Add working R code inbetween the questions
## The chapters refer to the sections in https://rspatial.org/intr/index.html

## Chapter 2

## 1) create a vector with all uneven numbers between 1 and 25

s <- seq(1,25,2)

## 2) create a vector with the names of four California cities

v <- c("Los Angeles", "Davis", "Fresno", "Sacramento")


## Chapter 3

## 3) create a variable 'x' that holds this matrix (without typing in all the numbers!)

##     [,1] [,2] [,3] [,4]
##[1,]    5   10   15   20
##[2,]   25   30   35   40
##[3,]   45   50   55   60
##[4,]   65   70   75   80
##[5,]   85   90   95  100

x <- matrix(seq(5,100,5), ncol=4, byrow=TRUE)


## 4) create a data.frame of the four California cities from question 2 and add two numerical variables (e.g. popluation) (the numbers do not matter).


d <- data.frame(city=c("Los Angeles", "Davis", "Fresno", "Sacramento"), pop=1:4, size=4:1)


## 5) create a list than contains the answers to question 1, 2, 3, and 4

x <- list(s, v, x, d)

## Chapter 4

## 6) create a matrix by subsetting matrix 'x' (question 3) by extracting the third and fourth column of 'x'

m <- x[,3:4]


## 7) which elements in matrix 'x' are larger than 80?

i <- which(x>90)

## Chapter 5

## 8) create 20 random numbers between 0 and 1

r <- runif(20)

## 9) multiply them by 100

r <- r * 100

## 10) create a 5 x 4 matrix 'y' of these numbers

y <- matrix(r, nrow=5)

## 11) multiply this matrix with a vector of 1 to 5

y * 1:5

## 12) multiply 'y' with 'x'

y * x

## Chapter 6

## R comes with some data sets. See `data()` for a list. These are useful for examples and exercises.  
## E.g. "state.x77"

## 13) Write the state.x77 data to a "text" file (e.g. "csv" format)

write.csv(state.x77, "state.csv")

## 14) Read the data from this file into a variable "states"

states <- read.csv("state.csv")

## 15) What is the number of columns of state.x77?

nrow(state.x77)
nrow(states)

## Chapter 7

## 16) for each variable in state.x77, use a function to compute the minimum and a function to compute the mean value 

apply(state.x77, 2, min)
apply(state.x77, 2, mean)


## 17) Use functions summary, table, quantile, and boxplot to summarize the data for life expectancy in the state.x77 data

summary(state.x77[, "Life Exp"])
table(round(state.x77[,"Life Exp"]))
quantile(state.x77[, "Life Exp"])
boxplot(state.x77[, "Life Exp"])



