# 8-weeks-machine-learning-tutorial(RMU instructor - prof JOHN STEWART)
this is the 8 weeks tutorial for machine learning 
Welcome to Machine Learning.

This first week we get an introduction to Machine Learning and become familiar with RStudio and some basic R code and functions. We will also explore the steps in developing a basic model (k-nn) in R.

Start with the PowerPoints and the topics in the readings. Understand the concepts and the terms. 

Download R and RStudio to your laptop. Instructions are in the syllabus . 

If you are not familiar with R Studio, look at the Tutorial. The interface layout is pretty simple. In R Studio, the upper left pane is the text editor. Any code you develop or bring into the text editor you can highlight and hit "control-enter" and the code will run in the console (lower left pane).  You can open .R files into R Studio by going to File -> Open File, and navigate to the file you want to load. 

Objectives

Upon completion of this week, you will be able to:

Understand the basic processes involved in developing a data mining model
Have an understanding of basic R structures and have familiarity with the RStudio interface
Be able to develop and evaluate a basic k-nn model in R
Readings

Read the Syllabus  You are responsible for knowing what is in it. 
Read Chapter 1 in the textbook: You should understand the difference between supervised and unsupervised learning, 
Read Chapter 2 and
                          understand the problem with overfitting, bias and variance, 

                          understand why and how you partition the data, 

                           sampling methods and cross validation, 

                           model evaluation methods, and the confusion matrix. 

                           understand why it may be necessary to normalize data, 

Note: The textbook is recommended. You can get the information I mention in the Readings from the slides that are posted and resources online. You can also get a better understanding of anything you are unsure of, in this course, by looking at the large number of resources available online. I will mention readings in the recommended text, but you can get the information from the PowerPoints AND other sources. 

Assignments

Download R and RStudio to your laptop. . 

Assignment 1: Due February 3, 6 PM . Find a dataset. Develop your own k-nn model in the same way we did with the examples using your own diastase. Begin with an idea and questions. In our example, the question would be: "What factors determine whether a tumor is malignant or benign?" Locate a diastase you want to work with and develop a k-NN model in R. Note that your target variables should be a small number of categories (like malignant and benign in the example problem). Do not use the iris dataset, any dataset overused on the internet, or any that are used in the examples (that applies to the entire course). Do not attempt to develop a model with a target variable that has several levels.  Develop a k-NN model and try several different values for k to obtain the best accuracy. Create a confusion matrix and interpret kappa, the no inform ation rate, sensitivity, and specificity. Evaluate the model and offer your conclusion. Find and use a dataset related to a work problem or based on your interests.

You can find datasets in R. Type data(), and you can find them everywhere online. Kaggle has datasets.  You just type "datasets" or "classification datasets" into Google. 

The steps prior to running a model are fairly standard for machine learning models.  Put the data in a form conducive to analysis. Eliminate any unnecessary variables. Normalize the data (if necessary). Create training and testing data sets. 

Requirements for ALL Deliverables

Upload your .R file, data file, and WORD doc. with code and output together to BlackBoard. 

In your Word doc., along with your code, show the output of your code, and a complete explanation of what you did, why you did it, the results, and your conclusion.   Explain what your objective is at the beginning of your Word dec., relative to your data, and show the output and interpretation of each output of your analysis. Show the output of str() so I can understand your data.

 Deliverables are:

Upload a copy of your Word doc. ( 12 or 14 pt. type) with code (and output right after each line of code). That is code, output, code, output, etc .  
.R file uploaded to BlackBoard
Your data file (.csv file) uploaded to Blackboard
I need to be able to look at your Word doc. and understand your objective, what you did, and your interpretation of the results. So, be sure to explain everything clearly. 
