## Merges the training and the test sets to create one data set.
tmp<-read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")
tmp_y<-read.table("UCI HAR Dataset/test/Y_test.txt", header = FALSE, sep = "")
tmp_subject<-read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "")
tmp2<-read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")
tmp2_y<-read.table("UCI HAR Dataset/train/Y_train.txt", header = FALSE, sep = "")
tmp2_subject<-read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "")

## Appropriately labels the data set with descriptive variable names. 
col_names<-read.table("UCI HAR Dataset/features.txt", header = FALSE, sep = "", stringsAsFactors = FALSE)
col_names_vector<-as.vector(col_names$V2)
names(tmp2)<-col_names_vector
names(tmp)<-col_names_vector

test_merged<-cbind(tmp_y, tmp)
colnames(test_merged) [1] <- "activity"
test_merged<-cbind(tmp_subject, test_merged)
colnames(test_merged) [1] <- "subject"

train_merged<-cbind(tmp2_y, tmp2)
colnames(train_merged) [1] <- "activity"
train_merged<-cbind(tmp2_subject, train_merged)
colnames(train_merged) [1] <- "subject"

tmp_merged<-rbind(tmp_build, tmp2_build)

## Extracts only the measurements on the mean and standard deviation
## for each measurement. 
tmp_merged2<-select(tmp_merged, subject, activity, contains("mean()"), contains("std()"))

## Uses descriptive activity names to name the activities in the data set
tmp_acts<-read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
acts_vector<-as.vector(tmp_acts$V2)
for(i in 1:6) {
     tmp_merged2[tmp_merged2$activity == i, 2] <- acts_vector[i]
}     


## From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.
tmp_merged2 %>%
     group_by(activity, subject) %>%
     summarise_each(funs(mean)) %>% 
     write.table("run_analysis.txt", row.name=FALSE)
