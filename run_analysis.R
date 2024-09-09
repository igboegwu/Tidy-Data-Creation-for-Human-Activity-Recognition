# Load necessary library
library(dplyr)

# 1. Merge the training and test sets to create one data set
print("Loading training data...")
train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
print("Merging data...")
merged_data <- rbind(train_data, test_data)

# Load the features and extract mean and std features
print("Loading features...")
features <- read.table("UCI HAR Dataset/features.txt")
mean_std_indices <- grep("mean|std", features$V2)

# Subset data to include only mean and std measurements
print("Filtering data...")
filtered_data <- merged_data[, mean_std_indices]

# 2. Use descriptive activity names to name the activities in the data set
print("Loading activity labels...")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Load activity data and merge
print("Loading activity data...")
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt")
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt")
print("Merging activity data...")
merged_activity <- rbind(train_activity, test_activity)

# Replace activity numbers with descriptive names
print("Mapping activity names...")
merged_activity <- activity_labels[merged_activity[, 1], 2]

# 3. Appropriately label the data set with descriptive variable names
print("Labeling data...")
names(filtered_data) <- features$V2[mean_std_indices]

# 4. Load subject data and merge
print("Loading subject data...")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
print("Merging subject data...")
merged_subject <- rbind(train_subject, test_subject)

# Combine all data into one dataset
print("Combining data...")
final_data <- cbind(Subject = merged_subject[,1], Activity = merged_activity, filtered_data)

# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject
print("Summarizing data...")
tidy_data <- final_data %>%
  group_by(Subject, Activity) %>%
  summarise_all(mean)

# Write out the tidy data set to a text file
print("Writing output...")
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
print("Script completed.")
