#Code Book
###For "tidy_Acman.txt" Dataset
by: Mislav Acman

date: "Sunday, April 26, 2015"


##Variables & Data in "tidy_Acman.txt"

######"tidy_Acman.txt" is a tidy dataset created by using a "run_analysis.R" R-script.

From "README.md" of initial dataset:
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist." [1]

The dataset contains 88 variables: Subject, Activity and other variables are Features.
And 180 observations.

List of Variables in the "tidy_Acman.txt":
Subject; Activity; tBodyAcc-mean()-X; tBodyAcc-mean()-Y; tBodyAcc-mean()-Z; tGravityAcc-mean()-X; tGravityAcc-mean()-Y; tGravityAcc-mean()-Z; tBodyAccJerk-mean()-X; tBodyAccJerk-mean()-Y; tBodyAccJerk-mean()-Z; tBodyGyro-mean()-X; tBodyGyro-mean()-Y; tBodyGyro-mean()-Z; tBodyGyroJerk-mean()-X; tBodyGyroJerk-mean()-Y; tBodyGyroJerk-mean()-Z; tBodyAccMag-mean(); tGravityAccMag-mean(); tBodyAccJerkMag-mean(); tBodyGyroMag-mean(); tBodyGyroJerkMag-mean(); fBodyAcc-mean()-X; fBodyAcc-mean()-Y; fBodyAcc-mean()-Z; fBodyAcc-meanFreq()-X; fBodyAcc-meanFreq()-Y; fBodyAcc-meanFreq()-Z; fBodyAccJerk-mean()-X; fBodyAccJerk-mean()-Y; fBodyAccJerk-mean()-Z; fBodyAccJerk-meanFreq()-X; fBodyAccJerk-meanFreq()-Y; fBodyAccJerk-meanFreq()-Z; fBodyGyro-mean()-X; fBodyGyro-mean()-Y; fBodyGyro-mean()-Z; fBodyGyro-meanFreq()-X; fBodyGyro-meanFreq()-Y; fBodyGyro-meanFreq()-Z; fBodyAccMag-mean(); fBodyAccMag-meanFreq(); fBodyBodyAccJerkMag-mean(); fBodyBodyAccJerkMag-meanFreq(); fBodyBodyGyroMag-mean(); fBodyBodyGyroMag-meanFreq(); fBodyBodyGyroJerkMag-mean(); fBodyBodyGyroJerkMag-meanFreq(); tBodyAcc-std()-X; tBodyAcc-std()-Y; tBodyAcc-std()-Z; tGravityAcc-std()-X; tGravityAcc-std()-Y; tGravityAcc-std()-Z; tBodyAccJerk-std()-X; tBodyAccJerk-std()-Y; tBodyAccJerk-std()-Z; tBodyGyro-std()-X; tBodyGyro-std()-Y; tBodyGyro-std()-Z; tBodyGyroJerk-std()-X; tBodyGyroJerk-std()-Y; tBodyGyroJerk-std()-Z; tBodyAccMag-std(); tGravityAccMag-std(); tBodyAccJerkMag-std(); tBodyGyroMag-std(); tBodyGyroJerkMag-std(); fBodyAcc-std()-X; fBodyAcc-std()-Y; fBodyAcc-std()-Z; fBodyAccJerk-std()-X; fBodyAccJerk-std()-Y; fBodyAccJerk-std()-Z; fBodyGyro-std()-X; fBodyGyro-std()-Y; fBodyGyro-std()-Z; fBodyAccMag-std(); fBodyBodyAccJerkMag-std(); fBodyBodyGyroMag-std(); fBodyBodyGyroJerkMag-std(); angle(tBodyAccMean,gravity); angle(tBodyAccJerkMean),gravityMean); angle(tBodyGyroMean,gravityMean); angle(tBodyGyroJerkMean,gravityMean); angle(X,gravityMean); angle(Y,gravityMean); angle(Z,gravityMean)


####Subject
Contains an integer number that indicates the subject (volunteer) that participated in the research. Every subject preformed all six activities.
There were 30 volunteers so there are 30 possible integer numbers.

####Activity
Contains a string with activity name performed by the subject. There are six possible activities: WALKING, WALKING UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

####Other variables
Other 86 variables are created on the basis of the mesured features that are either mean or standard deviation (std) of some kind.
These 86 variables contain numeric values. Every value is an average of above mentioned features for each activity and each subject.
Units:**Unknown**

##Reference:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
