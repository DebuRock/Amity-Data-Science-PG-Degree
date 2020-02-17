#Question1: Import Telecom_Weekly data and name the object as tele_weekly
tele_weekly = read.csv('Telecom_Weekly.csv')
tele_weekly

#Question2: Check number of rows, columns and customers in the data
str(tele_weekly)
# There are 23828 rows and 5 columns
number_of_rows = nrow(tele_weekly)
number_of_cols = ncol(tele_weekly)
#Removing NA Columns
tele_weekly_cleaned = tele_weekly[complete.cases(tele_weekly), ]
number_of_customers = length(unique(tele_weekly_cleaned$CustID))
number_of_customers

#Question3: Display first 10 rows
print(head(tele_weekly, 10))

#Question4: Display last 5 rows
print(tail(tele_weekly, 5))

#Quesion5: Describe(summarize) all variables
summary(tele_weekly)

#Question6: Display Structure of the data
str(tele_weekly)
