#ReadMe file
###For "run_analysis.R" R-script
by: Mislav Acman

date: "Sunday, April 26, 2015"


##Explaining the code in "run_analysis.R"
###It is advisable to look at the notes in the code itself for better understanding.

####In the 1st step there are three main operations performed:
1) Data import for train and test data of inital raw data
example:
```{r, echo=FALSE}
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <-  read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <-  read.table("./UCI HAR Dataset/test/Y_test.txt")
```
2) Labeling the columns with proper names for imported train and test data
NOTE: The step 4 is therefore skipped.
example:
```{r, echo=FALSE}
names(subject_train) <- "Subject"
names(Y_train) <- "Activity"
names(X_train) <- features
```
3)Merging (first all the test and train data was merged by columns and then test data and train data were binded by rows)
```{r, echo=FALSE}
test <- cbind(subject_test, Y_test, X_test)
train <- cbind(subject_train, Y_train, X_train)
data <- rbind(test, train)
```

####2nd step - Filtering
The script uses grep function to get the column positions of the columns which name has a substring "mean" or "std". Then it subsets the data frame.
NOTE:"Mean" was also included.
```{r, echo=FALSE}
data2 <- data[,c(1,2, grep("mean", names(data)), grep("std", names(data),))]
data3 <- data[,c(grep("Mean", names(data)))]
data <- cbind(data2, data3)
```


####3rd step - "Activity"
Script changes numeric activity names to descriptive activity names in the "Activity" column of the data. (Used the old fashioned way)
```{r, echo=FALSE}
activities <- data$"Activity"
activities[which(activities==1)] <- "WALKING" 
activities[which(activities=="2")] <- "WALKING_UPSTAIRS" 
        ...
data$"Activity" <- activities
```

####4th step - skipped (see 1st step above)

####5th step - average of the features
This was done by using the melt and dcast functions of the "reshape2" R package.
(Just like in video lecture of 3rd week: "Reshaping Data" )
```{r, echo=FALSE}
tidy <- melt(tidy, id=1:2)
tidy <- dcast(tidy, Subject+Activity~variable, mean)
```

####Writing data frame to a file:
```{r, echo=FALSE}
write.table(tidy, file="./CleanData/tidy_Acman.txt", row.name=FALSE)
```