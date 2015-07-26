library(plyr)

# Step 1
# Merging the datasets
##---------------------------------------------------------------------##


x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# create 'x' data set
x <- rbind(x_train, x_test)

# create 'y' data set
y <- rbind(y_train, y_test)

# create 'subject' data set
subject_data <- rbind(subject_train, subject_test)

# Step 2
# Extracting only the mean and standard deviation for each measurement
##---------------------------------------------------------------------##

features <- read.table("features.txt")

# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
x <- x[, mean_and_std_features]

# correct the column names
names(x) <- features[mean_and_std_features, 2]

# Step 3
# Use descriptive activity names to name the activities in the data set
##----------------------------------------------------------------------##
activities <- read.table("activity_labels.txt")

# update values with correct activity names
y[, 1] <- activities[y[, 1], 2]

# correct column name
names(y) <- "activity"

# Step 4
##---------------------------------------------------------------------##

# correct column name
names(subject_data) <- "subject"

# create a single data set
all_data <- cbind(x, y, subject_data)

# Step 5
# create a the final clean dataset and output as a txt file
##---------------------------------------------------------------------##

average_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(average_data, "average_data.txt", row.name=FALSE)