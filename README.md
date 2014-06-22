Read Me
========================================================
### Getting the initial dataset
The dataset can be downloaded as a zip file from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Please refer to the following website for further information concerning the experiments:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### Reading files
The unzipped file contains a lot of seperate files that we are not going to use. We are basically needing the files (activity_labels, features, Readme) in the main folder, and the files contained in the train and test folder. "Inertial Signals" folders" and their content are not needed in this analysis.

In this step, I am going to read files related to test and train data only. These are:
1. subject_test
2. X_test
3. y_test
in the test and train directories.

The code is as follows:
```{r}
#read training data
subjectID_Train=read.table("UCI HAR Dataset\\train\\subject_train.txt", sep='\n')
xTrain = read.table("UCI HAR Dataset\\train\\X_train.txt", strip.white=T)
yTrain = read.table("UCI HAR Dataset\\train\\y_train.txt", sep='\n')

#read test data
subjectID_Test=read.table("UCI HAR Dataset\\test\\subject_test.txt", sep='\n')
xTest = read.table("UCI HAR Dataset\\test\\X_test.txt", strip.white=T)
yTest = read.table("UCI HAR Dataset\\test\\y_test.txt", sep='\n')

```

### Merging training and testing datasets
Now that we have read 6seperate files, we need to merge them in one single file. To do this, I will start by combining the columns of the 3 training-related tables and do the same for the test-related tables using the cbind() command. I will then join the rows of these 2 resulting tables using the rbind() command. This results in a table with 10299 rows and 563 columns.

```{r}
#merge the training data into one dataset
trainDataset = cbind(subjectID_Train, xTrain, yTrain)

#merge the test data into one dataset
testDataset = cbind(subjectID_Test, xTest, yTest)

#merge the train and test datasets
data = rbind(trainDataset, testDataset)
dim(data)
```

### What are the features I selected?
I selected every feature containing the word "mean" or "std" referring to the mean and standarddviation respectively but did not include the angles features since they did not seem relevant.
The following code shows how I selected these features.
I then subsetted the dataset obtained in the previous step and kept only the columns that contains the selected features as well as the subject id and the activity label columns.
```{r}
#keep only the features containing "mean" or "std"
mean_features = grep("mean", features[,2]) #does not include angle features containing the term "Mean"
std_features = grep("std", features[,2])
#subset the features dataset to contain only the previous features
wanted_features = features[features[,1] %in% c(mean_features,std_features),]

#subset the original dataset to the features included in the wanted features + the id and the y output
data = data[,c(1,(wanted_features[,1]+1),563)]
dim(data)

```

### Naming the activities in the dataset
The last column in the dataset, corresponding to the y value, contains a numeric id that points to the activity done by the subject of the experiment. The label that corresponding to each activity id can be found in the "activity_labels.txt" file. After reading this file, I apply a merge between the two tables to assign the adequate label to each row. I then remove the unnecessary activity id column from the resulting dataset. Though it does not matter at this level of analysis, I sat the value of sort to false, in order to keep the original order of the rows.

```{r}
activity_labels = read.table("UCI HAR Dataset\\activity_labels.txt")
names(activity_labels)=c("id", "label")
ncol(data)
names(data)[81] = "activity"
data_labeled = merge(data,activity_labels, by.x="activity", by.y="id", sort = F)
dim(data_labeled)

data_labeled = data_labeled[,c(2:82)]

```

### Labelling data with descriptive variable names
Here, I am using the same original features names obtained previously since these are the descriptions that were chosen by the original dataset providers.

```{r}
names(data_labeled)=c("subjectID", as.character(wanted_features[,2]),"label")
```

### Independent tidy dataset
Using the aggregate function, I calaculate the mean of every variable, where the aggregation is done over the subject and the activity label variables.

```{r}
new_data = aggregate(.~subjectID+label, data = data_labeled, mean)
head(new_data)

```

### Writing the resulting tidy dataset
```{r}
write.table(new_data, "tidy_data.txt", sep=" ")

```


