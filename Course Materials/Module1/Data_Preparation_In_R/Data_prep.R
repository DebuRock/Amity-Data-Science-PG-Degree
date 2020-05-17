###############################################################
# ***********  Data Prep  in R    *********** #
#--------------------------------------------------------------
###############################################################

# clear all existing variables from console
 cat("\014") 
# clear all data variables 
rm(list=ls())

#--------------------------------------------------------------
#  Packages Needed 
#--------------------------------------------------------------

#   DATA PREP CASE 1 :  reading a file with NA's and faulty data 

#--------------------------------------------
# Read Input    
#--------------------------------------------
person <- read.csv("file1.txt")
person

#--------------------------------------------
# Read Input again but neglect headers and row names 
#--------------------------------------------
person <- read.csv(file="file1.txt",header=FALSE,col.names=c("age","height"),row.names = NULL, sep= " ")
person


######## Explore structure of Data  ###################
str(person) 
# Note Height is treated as a factor here !


#----  Lets try another read method -----------------
person <- read.csv(file="file1.txt",header=FALSE,col.names=c("age","height"),row.names = NULL, sep= " ",stringsAsFactors=FALSE)
person
str(person)
# Now the height is still a string column - but not factor 

# Lets convert!
person$height <- as.numeric(person$height)
str(person)

# Ok so now we have some NA's!!!

#--------------------------------------------------------------------------------
# Data Prep CASE 2 : reading a data file with readlines 
#----------------------------------------------------------------
# Typical Steps required for file data process 
#----------------------------------------------------------------
# 1 Read the data with readLines character
# 2 Select lines containing data character
# 3 Split lines into separate fields list of character vectors
# 4 Standardize rows list of equivalent vectors
# 5 Transform to data.frame data.frame
# 6 Normalize and coerce to correct type data.frame
#-----------------------------------------------------------------

# Step 1  Read 
#------------------------------------------------------------
txt <- readLines("dalton.txt")
txt
# Note Output shows 5 lines are present in the file !

# Step 2:  Getting rid of commented  lines 
# ----------------------------------------------------------

# detect lines starting with a percentage sign..
I <- grepl("^%", txt)
# and throw them out
dat <- txt[!I]
dat

#----------------------------------------------------------
# Step 3:  Split Lines 
#----------------------------------------------------------
fieldList <- strsplit(dat, split = ",")
fieldList


#-----------------------------------------------------------
#  Step 4 : Standardize Rows : 
# 1  Every row should have same nos of fields 
# 2  Fields should be in right order 
#-----------------------------------------------------------

assignFields <- function(x){
  out <- character(3)
  # get names
  i <- grepl("[[:alpha:]]",x)
  out[1] <- x[i]
  # get birth date (if any)
  i <- which(as.numeric(x) < 1890)
  out[2] <- ifelse(length(i)>0, x[i], NA)
  # get death date (if any)
  i <- which(as.numeric(x) > 1890)
  out[3] <- ifelse(length(i)>0, x[i], NA)
  return(out)
} 
standardFields <- lapply(fieldList, assignFields)
standardFields


#----------------------------------------------------------------
#  Step 5 :  coerce to dataframe 
#----------------------------------------------------------------
# Create Matrix  from List 
(M <- matrix(
  unlist(standardFields)
  , nrow=length(standardFields)
  , byrow=TRUE))

# Set col names for Matrix 
colnames(M) <- c("name","birth","death")

# Populate data frame 
daltons <- as.data.frame(M, stringsAsFactors=FALSE)
daltons


#----------------------------------------------------------------
#  Step 6 :  Normalize to correct data types 
#----------------------------------------------------------------
daltons$birth <- as.numeric(daltons$birth)
daltons$death <- as.numeric(daltons$death)
daltons


#------------  Now dataframe is ready for EDA! ------------------------

#  Handlings NA's  while doing EDA 

# Find the Average of the age column from data below
Age_Vec <- c(23,16,NA)
Mean_Age <- mean(Age_Vec)
Mean_Age

# Oops we have an issue here !
# As the column has NA it could not process

# Bypass NA's 
Mean_Age <- mean(Age_Vec,na.rm=TRUE)
Mean_Age


# Back to the Daltons Example
# How many rows have NA's ? '

NA_row_count <- nrow(daltons) - sum(complete.cases(daltons))
NA_row_count

# How can I remove rows which have NA's ?

Good_Rows <- na.omit(daltons)
Good_Rows

# Imputation :   can I replace the NA's with the mean for the below vector?
Age_Vec <- c(23,16,15,26,19,NA)
Mean_Age <- mean(Age_Vec,na.rm=TRUE)
# Check Mean Age 
Mean_Age
# Impute with Mean 
Age_Vec[is.na(Age_Vec)]<- Mean_Age
Age_Vec
