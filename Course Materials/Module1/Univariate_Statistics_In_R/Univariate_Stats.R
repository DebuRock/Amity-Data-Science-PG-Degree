###############################################################
# ***********   Univariate Stats in R    *********** #
#--------------------------------------------------------------
###############################################################

# clear all existing variables from console
 cat("\014") 
# clear all data variables 
rm(list=ls())

#--------------------------------------------------------------
#  Packages Needed 
#--------------------------------------------------------------
#install.packages("Hmisc")

#install.packages("pastecs")

#install.packages("psych")

###########  GET DATA ###########################
# import the data set into the current workspace
data <- read.csv("bank_data.csv", header = T)
#################################################


######## Explore Your Data  ###################
View(data)  # allows us to view the data set

names(data)  # names of the variable

# rename first col
colnames(data)[1] <- "age"

names(data)

dim(data)  # dimension (number of rows and columns)

str(data)  # structure of the data set

class(data)  # type of data

head(data, n = 5)  # displays the first 5 rows 

tail(data, n = 5)  # displays the last 5 rows

#----------------------------------------------------------------
# Univariate Stats 
#----------------------------------------------------------------
# Load packages 
library(Hmisc)
library(pastecs)
library(psych)
library(dplyr)


# Summary 
summary(data)

#-------------------------------------------------------
# Choose subset of data for EDA 
#-------------------------------------------------------
var <- c("age", "marital", "education", "housing")
eda_data <- select(data, var)
names(eda_data)


# Stats on age 
summary(eda_data$age)


#The mean and median are pretty close and we can say that the 
# distribution of the variable is approximately normal

#--------------------------------------------------------------
# Let us use the describe function now from  'Hmisc' package 
#--------------------------------------------------------------
# Number of rows
# Standard deviation
# Trimmed mean
# Mean absolute deviation
# Skewness
# Kurtosis
# Standard error
#---------------------------------------------------------------
describe(eda_data$age)

#--------------------------------------------------------------
# stat.desc() function which is part of the pastec package 
# gives us additionaly 

# Variance
# Coefficient of variation
# Confidence interval for mean
#--------------------------------------------------------------

stat.desc(eda_data$age)

#--------------------------------------------------------------
#  Graphical views:  1   Histogram 
#--------------------------------------------------------------
hist(eda_data$age,
     main = "Histogram of Age",
     xlab = "Age in Years")


#   What can we say about age groups > 60 ?

#-------------------------------------------------------------
# Graphical views:  2 Box plots 
#-------------------------------------------------------------
boxplot(eda_data$age,
        main = toupper("Boxplot of Age"),
        ylab = "Age in years",
        col = "blue")


#------------------------------------------------------------
#   Kernel Density Plot 
#------------------------------------------------------------
d <- density(eda_data$age)
plot(d, main = "Kernel density of Age")
polygon(d, col = "red", border = "blue")


#--------------------------------------------------------------
#                         Descriptive Stats
#--------------------------------------------------------------

# Read the data file 
PCData<- read.csv(file='PC_Sales.csv', header=T, sep=',')


######## Explore Your Data  ###################

# Provides basic descriptive statistics and frequencies.
summary(PCData) 

# Open data editor
edit(PCData) 


# Provides the structure of the dataset
str(PCData) 

# Lists variables in the dataset
names(PCData)

# First few rows of the dataset 
head(PCData) 

# First 2 rows of dataset
head(PCData, n=2)

# Last few rows 
tail(PCData) 

# Last 2 rows
tail(PCData, n=2)

# Rows 2 to 4 
PCData[2:4, ]

# Rows 2 to 4 with Columns 1 to 3 
PCData[2:4,1:3] 

# Rows 2 to 4 with Columns 1  and 3 
PCData[2:4,c(1,3)] 

#------------------------------------------------------
#   Descriptive Statistics   
#------------------------------------------------------

# Mean of a particular column 
mean(PCData$Units_Shipped_Q1_2016) 

# Another Way fo getting the mean 
with(PCData, mean(PCData$Units_Shipped_Q1_2016))

# Median 
median(PCData$Units_Shipped_Q1_2016)

# Variance
var(PCData$Units_Shipped_Q1_2016)

# Standard Deviation
sd(PCData$Units_Shipped_Q1_2016)

# Maximum
max(PCData$Units_Shipped_Q1_2016) 

# Minimum
min(PCData$Units_Shipped_Q1_2016) # Min value

# Range
range(PCData$Units_Shipped_Q1_2016) # Range

#Quantile 25% 
quantile(PCData$Units_Shipped_Q1_2016) 

# Number of Observations 
length(PCData$Units_Shipped_Q1_2016) 

# Length
length(PCData$Units_Shipped_Q1_2016)

# Which is the Maximum
PCData$Company[[which.max(PCData$Units_Shipped_Q1_2016)]]

#------------------------------------------------
#  apply() 
#-----------------------------------------------  
# clear all existing variables from console
cat("\014") 
# clear all data variables 
rm(list=ls())


# Create a Matrix
mat1 <- matrix(rep(seq(4), 4), ncol = 4)
mat1

#row sums of mat1
apply(mat1, 1, sum)

#column sums of mat1
apply(mat1, 2, sum)


#  Applying a user defined function across Rows 
#  Row Sum + 2 
apply(mat1, 1, function(x) sum(x) + 2)

#-------------------------------------------
#     lapply()
#-------------------------------------------  

#creating a data frame using mat1
mat1.df <- data.frame(mat1)
mat1.df

#obtaining the sum of each variable in mat1.df
lapply(mat1.df, sum)  # Note a List is Returned 

#storing the results of the lapply function in the list y
y <- lapply(mat1.df, sum)

#verifying that y is a list
is.list(y)


# user defined function with multiple arguments
# function defined inside the lapply function
y1 <- lapply(mat1.df, function(x, y) sum(x) + y, y = 5)

#displaying the first two results in the list
y1[1:2]

#-------------------------------------------------------  
#    sapply()
#-------------------------------------------------------

y2 <- sapply(mat1.df, function(x, y) sum(x) + y, y = 5)

# Display y2
y2

# Test If Vector   
is.vector(y2)

#------------------------------------------------------
#      tapply()
#------------------------------------------------------

# Consider the inbuilt data set iris
# a sneak peek into iris    
head(iris)

# How many Species is Data available for ?
UniqueSpeciesCnt <- length(unique(iris$Species))
UniqueSpeciesCnt

# What are the different species listed ? 
UniqueSpecies <- unique(iris$Species)
UniqueSpecies

# Find Mean Sepal Length in Dataset iris, Split the Result by Species
tapply(iris$Sepal.Length, iris$Species, mean)

















#---------------------  END of MODULE -------------------------------------

