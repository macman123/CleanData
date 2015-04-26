#features vector will be used later for labeling columns in X_test files
features <-  read.table("./UCI HAR Dataset/features.txt", 
                        stringsAsFactors=FALSE)
features <- features$"V2"

#1st step:
#importing TEST data
        subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        X_test <-  read.table("./UCI HAR Dataset/test/X_test.txt")
        Y_test <-  read.table("./UCI HAR Dataset/test/Y_test.txt")

#properly labeling TEST data and merging into one data set
        names(subject_test) <- "Subject"
        names(Y_test) <- "Activity"
        names(X_test) <- features
        test <- cbind(subject_test, Y_test, X_test)


#importing TRAIN data
        subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        X_train <-  read.table("./UCI HAR Dataset/train/X_train.txt")
        Y_train <-  read.table("./UCI HAR Dataset/train/Y_train.txt")

#properly labeling TRAIN data and merging into one data set
        names(subject_train) <- "Subject"
        names(Y_train) <- "Activity"
        names(X_train) <- features
        train <- cbind(subject_train, Y_train, X_train)

#merging TRAIN and TEST data sets
        data <- rbind(test, train)


#2nd step (NOTE: the subject and Training labels will be kept)
#This line of code will extract the 1st and 2nd columns of the merged dataset 
#along with all the columns that contain "mean" or "std" substrings in them.
        data2 <- data[,c(1,2, grep("mean", names(data)), grep("std", names(data),))]

#including "angle" variables (columns from 557-563) that contain substring "Mean"
        data3 <- data[,c(grep("Mean", names(data)))]

#merging data2 and data3 into dataset which will be processed in later code
        data <- cbind(data2, data3)

###Clearing global environment of unnecessary data objects (rm all but data)
        rm(list=setdiff(ls(), "data"))


#3rd step (naming activityies(= Training labels))
#this task is done manualy with help of activity_lables.txt from raw dataset folder        
#Note: activities object is integer vector at first, but later it is string vector!
        activities <- data$"Activity"
        activities[which(activities==1)] <- "WALKING" 
        activities[which(activities=="2")] <- "WALKING_UPSTAIRS" 
        activities[which(activities=="3")] <- "WALKING_DOWNSTAIRS" 
        activities[which(activities=="4")] <- "SITTING" 
        activities[which(activities=="5")] <- "STANDING" 
        activities[which(activities=="6")] <- "LAYING" 
        data$"Activity" <- activities


#4th step... columns were labeled in step 1


#5th step - new tidy dataset
#Sorting data by Subject and then by Activity
        tidy <- data[order(data$"Subject", data$"Activity"),]
#calculating average of each variable for each activity and each subject.
#This was done with help of melt and dcast functions
        install.packages("reshape2")
        library(reshape2)
        tidy <- melt(tidy, id=1:2)
        tidy <- dcast(tidy, Subject+Activity~variable, mean)
        
#writing to a file
write.table(tidy, file="./CleanData/tidy_Acman.txt", row.name=FALSE)

