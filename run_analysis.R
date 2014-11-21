library(plyr)

# Step 1
# Merge the training and test sets to create one data set
###############################################################################

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# create 'x' data set
x_data <- rbind(x_train, x_test)

# create 'y' data set
y_data <- rbind(y_train, y_test)

# create 'subject' data set
subject_data <- rbind(subject_train, subject_test)

names(subject_data)<-"subject"
features <- read.table("features.txt")
names(x_data)<-features$V2

#combine all data sets
dataCombine <- cbind(x_data, y_data)
Data <- cbind(subject_data, dataCombine)



# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement
###############################################################################



# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
all_data<-Data[,mean_and_std_features ]

#step3
##Uses descriptive activity names to name the activities in the data set
###########################################################
names(y_data) <- "activity"

#step 4
## Appropriately labels the data set with descriptive variable names


selectedNames<-c("subject", "activity" )
Data2<-subset(Data,select=selectedNames)
all_data<-cbind(Data2,all_data)


# Step 5 Creates a second,independent tidy data set and ouput it
###########################################################

mean_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(mean_data, "mean_data.txt", row.name=FALSE)

library(knitr)
knit2html("codeBook.Rmd");
knit2html("ReadMe.Rmd");
