#1. Merges the training and the test sets to create one data set.
#read training data
subjectID_Train=read.table("UCI HAR Dataset\\train\\subject_train.txt", sep='\n')
xTrain = read.table("UCI HAR Dataset\\train\\X_train.txt", strip.white=T)
yTrain = read.table("UCI HAR Dataset\\train\\y_train.txt", sep='\n')

#merge the training data into one dataset
trainDataset = cbind(subjectID_Train, xTrain, yTrain)

#read test data
subjectID_Test=read.table("UCI HAR Dataset\\test\\subject_test.txt", sep='\n')
xTest = read.table("UCI HAR Dataset\\test\\X_test.txt", strip.white=T)
yTest = read.table("UCI HAR Dataset\\test\\y_test.txt", sep='\n')

#merge the test data into one dataset
testDataset = cbind(subjectID_Test, xTest, yTest)

#merge the train and test datasets
data = rbind(trainDataset, testDataset)
dim(data)

#-----------------------------------

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#read the features file
features = read.table("UCI HAR Dataset\\features.txt")

#keep only the features containing "mean" or "std"
mean_features = grep("mean", features[,2]) #does not include angle features containing the term "Mean"
std_features = grep("std", features[,2])
#subset the features dataset to contain only the previous features
wanted_features = features[features[,1] %in% c(mean_features,std_features),]

#subset the original dataset to the features included in the wanted features + the id and the y output
data = data[,c(1,(wanted_features[,1]+1),563)]
dim(data)

#-----------------------------------

#3. Uses descriptive activity names to name the activities in the data set
#read the activity labels
activity_labels = read.table("UCI HAR Dataset\\activity_labels.txt")
names(activity_labels)=c("id", "label")
ncol(data)
names(data)[81] = "activity"
data_labeled = merge(data,activity_labels, by.x="activity", by.y="id", sort = F)
dim(data_labeled)

data_labeled = data_labeled[,c(2:82)]

#4. Appropriately labels the data set with descriptive variable names. 
#I am using the same original features names but I am also using the "make.names" 
#function that transforms a character string list into names that is legal in R. 
#I also sat unique to true since I want the elements of the resulting list to be unique.
new_features = make.names(as.character(wanted_features[,2]), unique=T)
names(data_labeled)=c("subjectID", as.character(new_features[,2]),"label")

#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
new_data = aggregate(.~subjectID+label, data = data_labeled, mean)
head(new_data)
write.table(new_data, "tidy_data.txt", sep=" ")
