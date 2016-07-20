## load and merge X_train and X_test files

X_train <- read.table("X_train.txt")
X_test <- reat.table("X_test.txt")
merge_X <- rbind(X_train,X_test)

## load and merge y_train and y_test files
y_test <- read.table("y_test.txt")
y_train <- read.table("y_train.txt")
merge_y <- rbind(y_train,y_test)

## load and merge subject_train and subject_test files
merge_subject <- rbind(subject_train,subject_test)

## merge subject file with y file
sub_y <- cbind(merge_subject,merge_y)

## extract needed variable names from the features file
 features <- read.table("features.txt")
features_names <- features$V2
 fea_names_sub <- features_names[grepl("mean|std",features_names)]

## put variable names on merge_X that only contain mean or std
names(merge_X) <- features_names
merge_X_sub <- merge_X[,names(merge_X) %in% fea_names_sub]

## put variable names sub_y
 names(sub_y) <- c("subject #","activity")

## merge all together sub_y and merge_X_sub
data_set <- cbind(sub_y,merge_X_sub)

##insert descriptive activity names to name the activities in the data set and arrange
activity_labels <- read.table("activity_labels.txt")
names(activity_labels) <- c("activity","activity_label")
data_set1 <- merge(activity_labels,data_set, by="activity")
data_set1 <- data_set1[,-1] ## remove unnecesary column
data_set1 <- data_set1[c(2,1,3:81)] ## reoder columns with subject as the first column , then activity
data_set1 <- arrange(data_set1,subject,activity_label) ##using arrange function from dplyr

##create second data set
data_set2 <- ddply(data_set1,.(subject,activity_label),numcolwise(mean, na.rm=TRUE)) ## using ddply from plyr library
