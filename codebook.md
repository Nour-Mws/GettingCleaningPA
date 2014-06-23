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

tBodyAcc-mean()-X
tBodyAcc-mean()-Y              
tBodyAcc-mean()-Z               
tBodyAcc-std()-X               
tBodyAcc-std()-Y                
tBodyAcc-std()-Z               
tGravityAcc-mean()-X            
tGravityAcc-mean()-Y           
tGravityAcc-mean()-Z            
tGravityAcc-std()-X            
tGravityAcc-std()-Y             
tGravityAcc-std()-Z            
tBodyAccJerk-mean()-X           
tBodyAccJerk-mean()-Y          
tBodyAccJerk-mean()-Z           
tBodyAccJerk-std()-Z           
tBodyGyro-mean()-X              
tBodyGyro-std()-X              
tBodyGyro-std()-Y               
tBodyGyro-std()-Z              
tBodyGyroJerk-mean()-X          
tBodyGyroJerk-mean()-Y         
tBodyGyroJerk-mean()-Z          
tBodyGyroJerk-std()-X          
tBodyGyroJerk-std()-Y           
tBodyGyroJerk-std()-Z          
tBodyAccMag-mean()              
tBodyAccMag-std()              
tGravityAccMag-mean()           
tGravityAccMag-std()           
tBodyAccJerkMag-mean()          
tBodyAccJerkMag-std()          
tBodyGyroMag-mean()             
tBodyGyroMag-std()             
tBodyGyroJerkMag-mean()         
tBodyGyroJerkMag-std()         
fBodyAcc-mean()-X               
fBodyAcc-mean()-Y              
fBodyAcc-mean()-Z               
fBodyAcc-std()-X               
fBodyAcc-meanFreq()-X           
fBodyAcc-meanFreq()-Y          
fBodyAcc-meanFreq()-Z           
fBodyAccJerk-mean()-X          
fBodyAccJerk-mean()-Y           
fBodyAccJerk-mean()-Z          
fBodyAccJerk-std()-X            
fBodyAccJerk-std()-Y           
fBodyAccJerk-std()-Z            
fBodyAccJerk-meanFreq()-X      
fBodyAccJerk-meanFreq()-Y       
fBodyAccJerk-meanFreq()-Z      
fBodyGyro-mean()-X              
fBodyGyro-mean()-Y             
fBodyGyro-mean()-Z              
fBodyGyro-std()-X              
fBodyGyro-std()-Y               
BodyGyro-std()-Z              
fBodyGyro-meanFreq()-X          
fBodyGyro-meanFreq()-Y         
fBodyGyro-meanFreq()-Z          
fBodyAccMag-mean()             
fBodyAccMag-std()               
fBodyAccMag-meanFreq()         
fBodyBodyAccJerkMag-mean()      
fBodyBodyAccJerkMag-std()      
fBodyBodyAccJerkMag-meanFreq()  
fBodyBodyGyroMag-mean()        
fBodyBodyGyroMag-std()          
fBodyBodyGyroMag-meanFreq()    
fBodyBodyGyroJerkMag-mean()     
fBodyBodyGyroJerkMag-std()     
fBodyBodyGyroJerkMag-meanFreq()
