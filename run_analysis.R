
setwd("C:/Users/nparr/Desktop/Cursos Complementarios/Data Science (Johns Hopkins)/3. Getting and Cleaning Data/getdata_projectfiles_UCI HAR Dataset")
library(dplyr)

##### READING TEST DATASET #####

A <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(A)[1] <- "subject"
B <- read.table("UCI HAR Dataset/test/y_test.txt")
names(B)[1] <- "activity"
C <- read.table("UCI HAR Dataset/test/X_test.txt")
test <- cbind(A,B,C)
rm(A,B,C)

##### READING TRAIN DATASET #####

A <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(A)[1] <- "subject"
B <- read.table("UCI HAR Dataset/train/y_train.txt")
names(B)[1] <- "activity"
C <- read.table("UCI HAR Dataset/train/X_train.txt")
train <- cbind(A,B,C)
rm(A,B,C)

## Reviewing the subjects
unique(test$subject)
unique(train$subject)

## Merge by rows

data <- rbind(test,train)
rm(test,train)

## Renamimg the activity factors

data$activity <- as.factor(data$activity)
levels(data$activity) <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

## Label the data set with descriptive variable names

variable_names <- read.table("UCI HAR Dataset/features.txt")
names(data)[3:length(names(data))] <- variable_names$V2
rm(variable_names)

## Extracting only the measurements on the mean and standard deviation for each measurement

result_1 <- select(data, subject, activity, contains("mean")|contains("std"))
View(result_1)

## Independent tidy data set with the average of each variable for each activity and each subject

result_1$subject <- as.factor(result_1$subject)
result_2 <- result_1 %>% group_by(subject,activity) %>% summarise_all(mean)
View(result_2)

## File to load 
write.table(result_2,file = "tidy_dataframe.txt",row.name = FALSE)
