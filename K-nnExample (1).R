

##### Classification using Nearest Neighbors --------------------

## Example: Classifying Cancer Samples ----

# These are 569 examples of breast cancer biopsies with 32 features, most are numeric 
# measurements of the characteristics of the cell nuclei shape and size.

#######  Exploring and preparing the data #########

# import the CSV file

wbcd <- read.csv("wisc_bc_data.csv", stringsAsFactors = FALSE)

# examine the structure of the wbcd data frame

str(wbcd)

###  We don't need the ID variable.  We can exclude it by making 
# a copy of the wbcd data and excluding ID. 

# drop the id feature

wbcd <- wbcd[-1]

# Diagnosis is the outcome variable we want to predict. This 
# feature is either benign or malignant.
# Table() output can give us the count of each. 

# table of diagnosis

table(wbcd$diagnosis)

# In R most of the ML classifiers require that the target feature is
# a factor.  So, we need to recode the diagnosis variable
# We can also improve the labels using the labels parameter.

# recode diagnosis as a factor

wbcd$diagnosis <- factor(wbcd$diagnosis, levels = c("B", "M"),
                         labels = c("Benign", "Malignant"))

#  We can look at the proportions of benign and malignant diagnosis
#  using prop.table()

# table or proportions with more informative labels


round(prop.table(table(wbcd$diagnosis)) * 100, digits = 1)



###############  Normalizing the Data ####################

# The rest of the features are numeric and comprise 3 different 
# measurements of 10 characteristics.
# Let's look at 3 of them:

# summarize three numeric features
summary(wbcd[c("radius_mean", "area_mean", "smoothness_mean")])

# We can see that there are differences in scale with some features:
# The smoothness_mean and area_mean ranges are vastly different
# The impact of area will be much larger, causing problems with the # # # classifier. 
# The distance calculation is heavily dependent on the measurement
# scale of the input features.

# create normalization function

normalize <- function(x) {
    return ((x - min(x)) / (max(x) - min(x)))}

#  We can test our normalization function on any vector set

# test normalization function - result should be identical

normalize(c(1, 2, 3, 4, 5))
normalize(c(10, 20, 30, 40, 50))

# normalize the wbcd data
# We can use the lapply() function.  It takes a list and applies
# the function to each element of the list. 
# And then converts the list to a data frame. 

wbcd_n <- as.data.frame(lapply(wbcd[2:31], normalize))

# confirm that normalization worked by looking at one variable
# the range that was 143.5  to 2501.0 is now 0 to 1. 
summary(wbcd_n$area_mean)

#  we want to know how well our model will generalize beyond our 
# training data to new data.  We divide our data into training and test
# sets (469 records for training, 100 for testing)

# create training and test data

wbcd_train <- wbcd_n[1:469, ]
wbcd_test <- wbcd_n[470:569, ]

# Extracting elements from a dataframe is by using [row, column]
# syntax. A blank for a row or column indicates all row or column 
# values should be included. 

############### Other Options for Sampling ##################

# Another way to partition the data (but, for this example, use the one above)

part <- sample(2, nrow(wbcd_n), replace=TRUE, prob=c(0.7, 0.3))


trainData <- wbcd_n[part==1,]

testData <- wbcd_n[part==2,]

#  Why would we need to partition the data this way?
#  It would be required if the dataset is NOT schuffled
# (that is, all the same target values are lumped together)

#############################################################

# create labels for training and test data
# when we constructed our training and test data we excluded 
# the target variable, diagnosis.
# We need to add that back in. 


wbcd_train_labels <- wbcd[1:469, 1]
wbcd_test_labels <- wbcd[470:569, 1]

######### Training a model on the data ############

# load the "class" library

install.packages ("class")    # if necessary
library(class)

# the knn() function in the class package is a standard implementation
# of the kNN algorithm.  This is characterized by identifying k-nearest
# neighbors using euclidean distance, where k is user specified. 
# Testing is classified by a count or vote among the k-nearest neigbors. 

# We use the knn() function to return a factor vector of predicted
# labels for each of the examples in the test data set. 

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test,
                      cl = wbcd_train_labels, k=21)

########### Evaluating model performance ############

# load the "gmodels" library
install.packages('gmodels')
library(gmodels)

# We want to determine how well the predicted values in the predicted
# (wbcd_test_pred) set match up with those known values in the test set # (wbcd_test_labels).
# We use the CrossTable() function in the gmodels package. 

# Create the cross tabulation of predicted vs. actual

CrossTable(x = wbcd_test_labels, y = wbcd_test_pred,
           prop.chisq=FALSE)

# Shows 98% accuracy 

############# Improving model performance ##############

# To potenially improve the accuracy, we can try different values # for k in the model (try that with the existing model.  

# We can also try using a different method of normalization before running the model:

# Can z-score standardization improve the accuracy?
# Allows outliers to be weighed more heavily in the distance
# calculation.
# the scale() function by default rescales values using the 
# z-score standarization - can be applied directly to the
# data frame w/o using lapply () function. 

# use the scale() function to z-score standardize a data frame

wbcd_z <- as.data.frame(scale(wbcd[-1]))

# confirm that the transformation was applied correctly


summary(wbcd_z$area_mean)



# create training and test datasets on the z values

wbcd_train <- wbcd_z[1:469, ]
wbcd_test <- wbcd_z[470:569, ]

# re-classify test cases

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test,
                      cl = wbcd_train_labels, k=1)

# Create the cross tabulation of predicted vs. actual


CrossTable(x = wbcd_test_labels, y = wbcd_test_pred,
           prop.chisq=FALSE)

# try several different values of k

wbcd_train <- wbcd_n[1:469, ]
wbcd_test <- wbcd_n[470:569, ]

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k=1)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k=5)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k=11)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k=15)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k=21)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k=27)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)

# Which value of k leads to the highest accuracy?


##############  Evaluating model performance #############


install.packages('caret')

#Import required library
library(caret)



i=1                          # declaration to initiate for loop
k.optm=1                     # declaration to initiate for loop
for (i in 1:28){ 
    knn.mod <-  knn(train=wbcd_train, test=wbcd_test, cl=wbcd_train_labels, k=i)
    k.optm[i] <- 100 * sum(wbcd_test_labels == knn.mod)/NROW(wbcd_test_labels)
    k=i  
    cat(k,'=',k.optm[i],'\n')       # to print % accuracy 
}


wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, 
                      cl = wbcd_train_labels, k=5)

confusionMatrix(wbcd_test_labels,wbcd_test_pred)


# No Information rate - The accuracy achievable by always predicting the 
# majority class

# Kappa - the measurement of agreement between what the classifier predicted and 
# the true values, 1= perfect agreement, 0 = no agreement. 

# Sensitivity - True Positive Rate - How often does it predict the positive class?

# Specificity - True Negative Rate - How often does it predict the negative class?

