# ***********   Module 2    *********** #
#----------------------------------------------
# clear all existing variables from console
 cat("\014") 
# clear all data variables 
rm(list=ls())
#---------------------------------------------------
#  FILE I/O 
# --------------------------------------------------
# Reporting Car data for Models haveing Sales > 500 
#---------------------------------------------------


# Read the Car Sales Csv file 
Car_Data<-read.csv(file="CarSales.csv")

# Display  car sales data  
Car_Data

# Subset- Choose car Make and Model, Sales  for sales > 300 
TopSales <- subset(Car_Data,Sales>300)

# and list in Descending Order 
Sorted_TopSales <- TopSales[order(-TopSales$Sales),]

# Display Sorted Data
Sorted_TopSales

# Write output file 
write.table(Sorted_TopSales,file="Sorted_Top_Sales.csv", sep=",",row.names=FALSE)
#------------------------------------------------------------------
#  Misc. Control Functions 
#-----------------------------------------------------------------
#-----------------------
# Conditional functions
#-----------------------
# Create a vector of 5 numbers 
Vec1<-c(15,2,32,45,50)

# Return 1 if value is 2 return 0 otherwise 
ifelse(Vec1==2,1,0)

# Check for odd and even  

 TestVec = c(5,9,2,3)
 ResultVec <- ifelse(TestVec %% 2 == 0,"even","odd")
 # Dispay Result Vector
 ResultVec

#----------------------
# Concatenation
#----------------------

paste("a","b")

paste("Hello","World",sep="_")


String1<-c("hello","world")
paste(String1)

paste(String1,collapse=" ")

paste(String1,collapse="")

#---------------------------
# Checking for null
#--------------------------
# Create a vector with NULL 
Vec1 <-c(1,2,3,NA,4,5,NA,NA)

# Check for  NULL
is.na(Vec1)

# Copy non Null values to another vector
No_Null_Vec <- Vec1[!is.na(Vec1)]

# Display No Null Vec
No_Null_Vec


# Replace Null with zeros in the original Vector
Vec1[is.na(Vec1)] <-0

#Display after replace 
Vec1

#---------------------------------------------------------------------------
# Merge dataframes
#---------------------------------------------------------------------------
df1 = data.frame(CustomerId = c(1:6), Product = c(rep("Toaster", 3), rep("Radio", 3)))
df2 = data.frame(CustomerId = c(2, 4, 6), State = c(rep("Alabama", 2), rep("Ohio", 1)))
df1
df2

#---------------------------------------------------------------
#   Example of Inner Join 
#---------------------------------------------------------------
Inner_Merged <- merge(x = df1, y = df2, by = "CustomerId")
Inner_Merged


#---------------------------------------------------------------
#   Example of Outer Join 
#---------------------------------------------------------------
Outer_Merged <- merge(x = df1, y = df2, by = "CustomerId", all=TRUE)
Outer_Merged

#----------------------------------------------------------------


#---------------------------------------------------------------
#   Example of Left Outer Join 
#---------------------------------------------------------------
L_Outer_Merged <- merge(x = df1, y = df2, by = "CustomerId", all.x=TRUE)
L_Outer_Merged

#----------------------------------------------------------------

#---------------------------------------------------------------
#   Example of Right Outer Join 
#---------------------------------------------------------------
R_Outer_Merged <- merge(x = df1, y = df2, by = "CustomerId", all.y=TRUE)
R_Outer_Merged

#----------------------------------------------------------------


# Load and save
ls()
rm(list=ls())                        # clean up
y.vector = runif(20)                 # a vector of 20 random numbers
ls()
save(y.vector, file="yvec.saved")    # save to the working directory
rm(y.vector)                         # removed
ls()
load("yvec.saved")                   # loaded back in
class(ls())
x<-"a"
rm(list=c("x","y.vector"))

#---------------------------------------------------------------------------
#---  One way and Two way tables 
#---------------------------------------------------------------------------

# Create Gender Vector 
Gender<-c("male","male","female","male","female")
# Create Marital Status Vector 
Mstatus<-c("Married","Single","Married","Single","Married")

# One way tabulation 
table(Gender)

# Two way tabulation 
table(Gender,Mstatus)

#-------------------------------------------------------------------------
#  LOOPS 
#-------------------------------------------------------------------------
# For loop

for(i in 1:5){
  print(i)
}

for(j in 1:5){
  j
}

# Display 'j' outside loop
j


i<-1:5

for(j in i){
  print(j)
}

#---------------------------
# While loop
#---------------------------

x<-0
while(x <5){ 
  print( x<-x+1) 
}

#--------------------------------------
# Repeat - similar to a do-while loop
#-------------------------------------
y<-0
repeat{
  print(y<-y+1)
  if(y>5){
    break
  }
}

#-----------------------
# USER DEFINED FUNCTIONS 
#-----------------------
# Writing a user defined function

# Function Definition without arguements 
Hello_World<-function(){
  print("Hello World")
  return()
}

# Function Call 
Hello_World()


# Function with arguements 
Sum_Two_Nos<-function(a,b){
  sum2 <- a + b 
  print(paste("Sum is ",sum2)) 
}

# Function Call 
ReturnVal <-Sum_Two_Nos(5,10)

# - Multiple Input Values , Multiple Output 
# Function definition 
Compute_mean_std_Tot<-function(x,y){
  Tot<- x + y 
  mu<-mean(x+y)
  sigma<-sd(x+y)
  return(list(mean=mu,stand_dev=sigma,Totals=Tot))
}


#-------------------  END    of MODULE 2  #------------------------------------------------
  

