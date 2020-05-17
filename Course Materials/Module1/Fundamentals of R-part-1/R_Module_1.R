# --------------------------------------------------
#   Module 1 -  supporting codes 
# --------------------------------------------------
#
# clear all existing variables from console
cat("\014") 
# clear all data variables 
rm(list=ls())
# --------------------------------------------------
#  BASIC OPERATIONS 
#---------------------------------------------------

# Assignment 
x <- 11; y <- 4;
# Add
z = x + y
z
# Subtract
z = x-y 
z
x <- 11; y <- 4;
# add
z = x + y
z
# subtract
z = x-y 
z
# multiply 
z = x*y
z
# to the power 
z = x^y
z
# modulo division remainder
z = x%%y
z
# integer divide 
z = x%/%y
z
############################
# Log and exponentials 
vec <- (1:10)
# Natural log 
z = log(vec)
z
# exp 
y = exp(z)
# Base 10 log 
z = log(vec, base = 10)
z
##################################
# Other math operations 
# square root 
z = sqrt(4)
z
# factorial
z =  factorial(4)
z
# combinatorics ncr
n = 5 ; r  = 3
num = choose(n,r)
num
num2 = choose(n,n-r)
num2
###################################
# Rounding Numbers
x = 123.456
# normal rounding 2 decimal places
z = round(x,digits = 2)
z
# flooring 
z = floor(x)
z
# ceiling
z = ceiling(x)
z
# truncating decimal part 
z = trunc(x)
z
# ##################################
# Working with  NaN s and Infinity 
# z is infinite 
z = x/0
# check if z is finite 
y = is.finite(z)
y
# check if z is nan
y1 = is.nan(z)
y1

#---------------------------------------------------
# VECTORS 
#---------------------------------------------------
# Define a Vector 
My_First_Vector <- c(12,4,4,6,9,3)

# Generating a vector using sequence of numbers with increment 
My_Second_Vector = seq(from = 2.5, to = 5.0, by = 0.5)

# linear operation on two vectors 
My_Third_Vec  = 10* My_First_Vector + 20*My_Second_Vector 

# combining two vectors 
First_and_Second <- c(My_First_Vector,My_Second_Vector)
First_and_Second

# repeat a vector 3 times 
vec3 <- c(0,0,7)
Rvec3 <-rep(vec3,times=3)
Rvec3

# Generating a vector using 'n' numbers equally spaced
vec2 = seq(from = 2.5, to = 7, length.out = 10)
vec2


# Repeat individual occurences of a vector specified number of times 
Rvec321 <- rep(c(1,2,3),times = c(3,2,1))
Rvec321

# repeat each occurence in a vector 'n' times
Rvecn <- rep(c(1,2,3),each=3)
Rvecn


#########################################################
#  Logical Vectors 
#########################################################
#  for 5 Games played by 2 Players
Player_1 <- c(10,34,54,78,99)
Player_2 <- c(4,24,67,49,100)

# Find out How Player 1 performed  vs Player 2 
Player_1.success <- Player_1 > Player_2

# Which matches did Player 1 win ?
Player_1_win  <- which(Player_1.success)

# What did Player 1 score in the matches player 1 won ?
P1_win_scores <- Player_1[Player_1_win]

# summarizing logical vectors 

# How many matches did Player 1 win ?
sum(Player_1.success)

# Did Player 1 win any match ?
any(Player_1.success)

# Did Player 1 win all the matches ?
all(Player_1.success)
########################################################
# ***********   Text and Strings    *********** #
#######################################################
  # clear all existing variables from console
  cat("\014") 
# clear all data variables 
rm(list=ls())
##################################
# Simple string operations 
##################################
# Define  a  string
x <- "Hello World" 

# Get its length
lenx = length(x)

# How many characters in x ?
ncharx = nchar(x)
ncharx

# Define a vector of 2 strings 
y  <- c("Hello","World")

# get its length 
leny = length(y)
lenyy
# How many characters ?
nchary = nchar(y)
nchary
##################################
# Naming strings
##################################
# create a vector month.days
month.days <- c(31,28,31,30,31,30,31,31,30,31,30,31)

# Assign Month short names 
mon.shortname <- c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
names(month.days) <- mon.shortname


# print name of the 5th month 
names(month.days[5])


# print month names having days = 31
names(month.days[month.days==31])

# print names in descending order of month lengths consider the largest 5 months only 
names(sort(month.days,decreasing=TRUE)[1:5])

###############################################################################################
# MATRICES 
# ------------------------------------------------------------------------------------------

# Define  a 2 by 3 matrix 
A <- matrix(c(2, 4, 3, 1, 5, 7), nrow=2,ncol=3,byrow=TRUE)

# Print the  matrix
A

# Extract 2nd row 3rd column 
A23 <- A[2, 3]      

# Extracting a Vector from the Matrix 
ARow2Vec <-  A[2, ]       # the 2nd row

# Extracting a Sub Matrix from the given Matrix 
A2by2 <- A[1:2,1:2]

# Adding Row and Column Names 
dimnames(A) = list(c("row1", "row2"),c("col1", "col2", "col3"))
A
# ----------------------------------------------------------------------------------------
# Data Frames 
# ----------------------------------------------------------------------------------------
# Define individual vectors 
n<- c(2,3,5)
s<- c("aa","bb","cc")
b<- c(TRUE,FALSE,TRUE)
# Define dataframe 
df<- data.frame(n,s,b)
df

# Get the first 6 rows of a built in data frame 'mtcars'
head(mtcars)

# extract a particular element   with row and col names 
mtcars["Mazda RX4", "cyl"] 

# Get number of Rows information 
nrow(mtcars)    

# Get number of Columns information 
ncol(mtcars)

# ---------------------------------------------------------------------------------------
#    LISTS 
# ---------------------------------------------------------------------------------------
n=c(2,3,5)
s=c("aa","bb","cc","dd","ee")
b=c(TRUE,FALSE,TRUE,FALSE,FALSE)
# x contains copies of n,s,b
x=list(n,s,b,3)
x

# Extracting a child list 
child_list <- x[c(2, 4)] 
child_list

# Slicing the list to extract a member 
Second_Elem_Slice <- x[2] 
Second_Elem_Slice
# Directly referencing a member of a list
Sec_Member <- x[[2]] 
Sec_Member

#  -  List initialization concepts 
# ------------------------------------
# Create list column names 
mylist.names <- c("COL_1", "COL_2", "COL_3")

# Create empty list 
mylist <- vector("list", length(mylist.names))

# Initialize list with three vectors of different lengths
mylist  <- list(a=1, b=1:2, c=1:3)

# Display list 
mylist

# Name list  columns 
names(mylist) <- mylist.names 

# check list again 
mylist

# ----------   End of   Module 1 -----------------------------------------------