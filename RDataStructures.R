
##### R data structures --------------------


# R Basics  

#     A # at the head of a line is a comment.  R will ignore comments.  You should use comments 
#     extensively in your assignments 

# How to retrieve or set your working directory


#  To find your working directory,  highlight this code and hit "Cntrl Enter"  ( command Enter on a mac)

getwd()

#  Your working directory is where you store and retrieve files.   Any files you are working 
#  with must be in your working directory. 


#You can set your working directory by typing a path in Setwd().  For example:

setwd("C:/Users/USER/Documents")




# Basic Math in R




# Basic Math

1 + 1

1 + 2 + 3

3 * 7 * 2

4 / 2

4 / 3

4 * 6 + 5 

(4 * 6) + 5

4 * (6 + 5)

# Variables
# Variable Assignment


x <- 2
x

y = 5 
y

3 -> z
z

# We can assgn a value to multiple variables at the same time

a <- b <-  7
a
b

# We can also use the assign function

assign('j', 4)
j

# Removing Variables

# We can remove variables with the rm() function 

j
rm(j)
j

# Case sensitive

theVariable <- 17
theVariable
THEVARIABLE







## Vectors -----

# create vectors of data for three medical patients

subject_name <- c("John Doe", "Jane Doe", "Steve Graves")
temperature <- c(98.1, 98.6, 101.4)
flu_status <- c(FALSE, FALSE, TRUE)

# access the second element in body temperature vector

temperature[2]

## examples of accessing items in vector
# include items in the range 2 to 3

temperature[2:3]

# exclude item 2 using the minus sign
temperature[-2]

# use a vector to indicate whether to include item
temperature[c(TRUE, TRUE, FALSE)]



#################################################



## Factors -----

# add gender factor
gender <- factor(c("MALE", "FEMALE", "MALE"))
gender

# add blood type factor

blood <- factor(c("O", "AB", "A"),
                levels = c("A", "B", "AB", "O"))
blood



## Lists -----

# display information for a patient

subject_name[1]
temperature[1]
flu_status[1]
gender[1]
blood[1]

# create list for a patient

subject1 <- list(fullname = subject_name[1], 
                 temperature = temperature[1],
                 flu_status = flu_status[1],
                 gender = gender[1],
                 blood = blood[1])


# display the patient
subject1

## methods for accessing a list

# get a single list value by position
subject1[2]
# get a single list value by name
subject1$temperature

# get several list items by specifying a vector of names
subject1[c("temperature", "flu_status")]

## access a list like a vector
# get values 4 and 5
subject1[4:5]



## Data frames -----
# A data frame is a structure analagous to a spreadsheet with rows and columns
# A data frame is a list of vectors 

# create a data frame from medical patient data

pt_data <- data.frame(subject_name, temperature, flu_status, gender,
                      blood, stringsAsFactors = FALSE)

# display the data frame

pt_data

## accessing a data frame

# get a single column

pt_data$subject_name

# get several columns by specifying a vector of names

pt_data[c("temperature", "flu_status")]

# this is the same as above, extracting temperature and flu_status

pt_data[2:3]

# accessing by row and column

pt_data[1, 2]

# accessing several rows and several columns using vectors

pt_data[c(1, 3), c(2, 4)]

## Leave a row or column blank to extract all rows or columns

# column 1, all rows
# extracts all rows from the first column

pt_data[, 1]

# row 1, all columns
# extracts all columns in the first rows

pt_data[1, ]

# all rows and all columns

pt_data[ , ]

# the following returns 1st and 3rd rows of temp and gender:

pt_data[c(1, 3), c("temperature", "gender")]






################################################

## Matrixes -----
#  A two dimensional table with rows and columns of data
#  typically contain only numerical data
#  To  create a matrix insert data into the matrix() function:


# create a 2x2 matrix
m <- matrix(c('a', 'b', 'c', 'd'), nrow = 2)
m

# equivalent to the above
m <- matrix(c('a', 'b', 'c', 'd'), ncol = 2)
m

# create a 2x3 matrix
m <- matrix(c('a', 'b', 'c', 'd', 'e', 'f'), nrow = 2)
m

# create a 3x2 matrix
m <- matrix(c('a', 'b', 'c', 'd', 'e', 'f'), ncol = 2)
m

# extract values from matrixes
m[1, 1]
m[3, 2]

# extract rows
m[1, ]

# extract columns
m[, 1]





