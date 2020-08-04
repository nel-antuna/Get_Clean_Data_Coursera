### Libraries used

library(readr)
library(tidyverse)
library(reshape2)

### Downloading files 

temp <- tempfile(fileext = ".zip")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", temp)

features <- read.table(unz(temp, "UCI HAR Dataset/features.txt"))
subjects_tr <- read.table(unz(temp, "UCI HAR Dataset/train/subject_train.txt"), col.names = "subjects")
labels_tr <- read.table(unz(temp, "UCI HAR Dataset/train/y_train.txt"), col.names = "labels")
measures_tr <- read.table(unz(temp, "UCI HAR Dataset/train/X_train.txt"), col.names = features$V2)
subjects_test <- read.table(unz(temp, "UCI HAR Dataset/test/subject_test.txt"), col.names = "subjects")
labels_test <- read.table(unz(temp, "UCI HAR Dataset/test/y_test.txt"), col.names = "labels")
measures_test <- read.table(unz(temp, "UCI HAR Dataset/test/X_test.txt"), col.names = features$V2)

# Selecting variables with mean and std data
measures_tr <- select(measures_tr,grep("mean()|std()", features$V2))
measures_test <- select(measures_test, grep("mean()|std()", features$V2))


### Merging files

#Creating ID variable for each data frame

subjects_tr$id <- seq_along(subjects_tr$subjects)
labels_tr$id <- seq_along(labels_tr$labels)
measures_tr$id <- seq_along(measures_tr$tBodyAcc.mean...X)
subjects_test$id <- seq_along(subjects_test$subjects)
labels_test$id <- seq_along(labels_test$labels)
measures_test$id <- seq_along(measures_test$tBodyAcc.mean...X)

#Merging test and train datas separately

test <- subjects_test %>%
        left_join(labels_test, by = "id") %>%
        left_join(measures_test, by = "id")

train <- subjects_tr %>%
        left_join(labels_tr, by = "id") %>%
        left_join(measures_tr, by = "id")

#Merging test with train file

TestTrain <- rbind(test, train)


### Renaming variables with descriptive variable names

colnames(TestTrain) <- gsub("\\.","",colnames(TestTrain))


### Create new dataset with average of each variable for each activity and each subject

TestTrainMelt <- melt(TestTrain, id=c("subjects","labels"), measure.vars=4:82)
SubjectLabelData <- dcast(TestTrainMelt, subjects + labels ~ variable, mean)

write.table(SubjectLabelData,"./SubjectLabelData.txt", row.name=FALSE)