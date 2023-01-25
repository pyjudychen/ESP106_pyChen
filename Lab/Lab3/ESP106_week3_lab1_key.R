##########################

# ESP 106
# Lab 3 (Monday) - graphing

##########################

#In this lab we will start by reading merging in data on economic development and indoor and outdoor air pollution. Then we will practice making some graphs with it.


#1. First read in the three csv files: gdppercapitaandgini and airpollution

#Both datasets are from Our World in Data: ourworldindata.org
#The GDP dataset has GDP per capita and the GINI index (a measure of income inequality: https://en.wikipedia.org/wiki/Gini_coefficient)
#The air pollution dataset has death rates from indoor and outdoor air pollution - units are in deaths per 100,000 people
#Indoor air pollution is the Household Air Pollution from Solid Fules
#Outdoor air pollution is split into particulate matter and ozone

#Hint: The column names are long and cumbersome (because they contain information about units et) - you might want to rename some of the columns to make them easier to work with

setwd("G:/.shortcut-targets-by-id/0B7zoH2-YLR5Oa21lZkJTVm5yZzQ/teaching/2023/ESP106/labs")
setwd('C:/Users/judy8/Box/PhD_UCD/TA/ESP106/Lab/Lab3')

ff <- unzip("ESP106_week3_lab1.zip")
gdp <- read.csv("gdppercapiandgini.csv")
air <- read.csv("airpollution.csv")

str(gdp)
str(air)

#colnames(air)[4:7] <- c("partmat", "solfuels", "ozone", "airpol")
colnames(air) <- c("country", "code", "year", "partmat", "inside", "ozone", "airpol")
head(air)

#2. Chose two countries that you are interested in and make a plot showing the death rates from indoor air pollution and outdoor air pollution (sum of particulate matter and ozone) over time
#Distinguish the countries using different colored lines and the types of pollution using different line types
#Make sure to add a legend and appropriate titles for the axes and plot 

#Hint: you can see all the different country names using unique(x$Entity) where x is the data frame containing the air pollution data
#Then create two new data frames that contain only the rows corresponding to each of the two countries you want to look at
#Create a new column of total outdoor air pollution deaths by summing death rates from particulate matter and ozone
#Use these to make your plot and add the lines you need
#Hint: you might have to set the y scale manually to make sure your plot is wide enough to show both countries. You can do this using the "ylim" argument in plot

air$outside <- air$partmat + air$ozone

per <- air[air$country == "Peru", ]
bol <- air[air$country == "Bolivia", ]


# Examples-----------------------------------------------------------------
df <- iris
str(iris)
unique(iris$Species)

iris[iris$Species == 'setosa', ]
subset(df, Species == 'setosa') # doing the same thing as the codes above
#############################################################################

plot(outside ~ year, data=per, ylim=c(0, 120), type="l", col="black", ylab="Death rate", las=1, lwd=3)
#or 
# plot(per$year, per$outside, ylim=c(0, 120), type="l", col="black", ylab="Death rate", las=1, lwd=3)

lines(inside ~ year, data=per, lty=2, col="gray", lwd=3)
lines(outside ~ year, data=bol, lty=3, col="red", lwd=3)
lines(inside ~ year, data=bol, lty=4, col="blue", lwd=3)
legend("topright", c("Peru, outside", "Peru, inside", "Bolivia, outside", "Bolivia, inside"), 
	col=c("black", "gray", "red", "blue"), lty=1:4, bty="n", lwd=3)


#3. Merge the air pollution data with the gdp data using merge()
# Merge is a function that combines data across two data frames by matching ID rows
#By default merge will identify ID rows as those where column names are the same between datasets, but it is safer to specify the columns you want to merge by yourself using "by"
#In our case, we want to merge both by country (either the "Entity" or "Code" columns) and year columns
#Note that by default, the merge function keeps only the entries that appear in both data frames - that is fine for this lab. If you need for other applications, you can change using the all.x or all.y arguments to the function - check out the documentation at ?merge

colnames(gdp) <- c("country", "code", "year", "pop", "continent", "gini", "gdp")
m <- merge(gdp, air, by=c("country", "code", "year"))


#4. Make a plot with two subplots - one showing a scatter plot between log of per-capita GDP (x axis) and indoor air pollution death rate (y axis) and one showing log of per-capita GDP (x axis) and outdoor air pollution (y axis)
#Make sure to add appropriate titles to the plots and axes
#Use ylim to keep the range of the y axis the same between the two plots - this makes it easier for the reader to compare across the two graphs

par(mfrow=c(1,2), las=1)
plot(log(m$gdp), m$inside, cex=.1, xlab="GDP", ylab="Inside air pollution", col="red", ylim=c(0,250))
plot(log(m$gdp), m$outside, cex=.1, xlab="GDP", ylab="outside air pollution", col="orange", ylim=c(0,250))


#STRECTH GOAL CHALLENGE - color the points based on continent. NOT REQUIRED FOR FULL POINTS - a challenge if you want to push yourself - continent info is included in the GDP dataset, but it is only listed for the year 2015
#If you are trying this and getting stuck ASK FOR HELP - there are some tips and tricks for making it easier 

x <- m[, c("code", "continent")]
x <- x[x$continent != "", ]
m$continent <- NULL
m <- merge(m, x, by="code")

cnts <- unique(m$continent)
cols <- rainbow(length(cnts))

par(mfrow=c(1,2), las=1)
plot(log(m$gdp), m$inside, xlab="GDP", ylab="Inside air pollution", ylim=c(0,250), type="n")
for (i in 1:length(cnts)) {
	s <- m[m$continent==cnts[i], ]
	points(log(s$gdp), s$inside, cex=.1, col=cols[i])
}
legend("topright", cnts, col=cols, pch=1, cex=.75, pt.cex=.25)

plot(log(m$gdp), m$outside, xlab="GDP", ylab="Outside air pollution", ylim=c(0,250), type="n")
for (i in 1:length(cnts)) {
	s <- m[m$continent==cnts[i], ]
	points(log(s$gdp), s$outside, cex=.1, col=cols[i])
}
legend("topright", cnts, col=cols, pch=1, cex=.75, pt.cex=.25)


