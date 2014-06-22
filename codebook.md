Code Book
========================================================

The dataset can be downloaded as a zip file from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Please refer to the following website for further information concerning the experiments:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The features file in the unzipped file contains a list of the 561 features of the dataset (for more information, consult the features_info.txt file). The dataset in this analysis include only the 79 features with names containing "mean" or "std". The list at the end of this document represents these features.

The first step in obtaining the transformed tidy dataset is to merge the files (subject_test, X_test and y_test) in the train and test files respectively. This will result in 10299 rows.

The activity ids are replaced by activity labels featuring in the "activity_labels.txt" file in the main directory, and appropriate variables names are chosen (more details in the readme file).

The final dataset is obtained by aggregating the previous table. The average of each feature is calculated for each (subject id, activity label) combination. So each row contains the subject id (1st column, subjectID), an activity label (last column, label), and in between the aggregated averaged value of each feature for this given subject and this given activity type.

List of selected features:

[1] tBodyAcc-mean()-X               tBodyAcc-mean()-Y              
 [3] tBodyAcc-mean()-Z               tBodyAcc-std()-X               
 [5] tBodyAcc-std()-Y                tBodyAcc-std()-Z               
 [7] tGravityAcc-mean()-X            tGravityAcc-mean()-Y           
 [9] tGravityAcc-mean()-Z            tGravityAcc-std()-X            
[11] tGravityAcc-std()-Y             tGravityAcc-std()-Z            
[13] tBodyAccJerk-mean()-X           tBodyAccJerk-mean()-Y          
[15] tBodyAccJerk-mean()-Z           tBodyAccJerk-std()-X           
[17] tBodyAccJerk-std()-Y            tBodyAccJerk-std()-Z           
[19] tBodyGyro-mean()-X              tBodyGyro-mean()-Y             
[21] tBodyGyro-mean()-Z              tBodyGyro-std()-X              
[23] tBodyGyro-std()-Y               tBodyGyro-std()-Z              
[25] tBodyGyroJerk-mean()-X          tBodyGyroJerk-mean()-Y         
[27] tBodyGyroJerk-mean()-Z          tBodyGyroJerk-std()-X          
[29] tBodyGyroJerk-std()-Y           tBodyGyroJerk-std()-Z          
[31] tBodyAccMag-mean()              tBodyAccMag-std()              
[33] tGravityAccMag-mean()           tGravityAccMag-std()           
[35] tBodyAccJerkMag-mean()          tBodyAccJerkMag-std()          
[37] tBodyGyroMag-mean()             tBodyGyroMag-std()             
[39] tBodyGyroJerkMag-mean()         tBodyGyroJerkMag-std()         
[41] fBodyAcc-mean()-X               fBodyAcc-mean()-Y              
[43] fBodyAcc-mean()-Z               fBodyAcc-std()-X               
[45] fBodyAcc-std()-Y                fBodyAcc-std()-Z               
[47] fBodyAcc-meanFreq()-X           fBodyAcc-meanFreq()-Y          
[49] fBodyAcc-meanFreq()-Z           fBodyAccJerk-mean()-X          
[51] fBodyAccJerk-mean()-Y           fBodyAccJerk-mean()-Z          
[53] fBodyAccJerk-std()-X            fBodyAccJerk-std()-Y           
[55] fBodyAccJerk-std()-Z            fBodyAccJerk-meanFreq()-X      
[57] fBodyAccJerk-meanFreq()-Y       fBodyAccJerk-meanFreq()-Z      
[59] fBodyGyro-mean()-X              fBodyGyro-mean()-Y             
[61] fBodyGyro-mean()-Z              fBodyGyro-std()-X              
[63] fBodyGyro-std()-Y               fBodyGyro-std()-Z              
[65] fBodyGyro-meanFreq()-X          fBodyGyro-meanFreq()-Y         
[67] fBodyGyro-meanFreq()-Z          fBodyAccMag-mean()             
[69] fBodyAccMag-std()               fBodyAccMag-meanFreq()         
[71] fBodyBodyAccJerkMag-mean()      fBodyBodyAccJerkMag-std()      
[73] fBodyBodyAccJerkMag-meanFreq()  fBodyBodyGyroMag-mean()        
[75] fBodyBodyGyroMag-std()          fBodyBodyGyroMag-meanFreq()    
[77] fBodyBodyGyroJerkMag-mean()     fBodyBodyGyroJerkMag-std()     
[79] fBodyBodyGyroJerkMag-meanFreq()
