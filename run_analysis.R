library(reshape2)
#set working directory
setwd("C:/Users/braden.c.glover/Desktop/Coursera/Getting and Cleaning Data/Course Project")

#unzip data
unzip("data.zip")

#read in test data
setwd("UCI HAR Dataset/test")
xtest <- read.table("X_test.txt")
ytest <- read.table("y_test.txt")
subjecttest <- read.table("subject_test.txt")

#read in train data
setwd("C:/Users/braden.c.glover/Desktop/Coursera/Getting and Cleaning Data/Course Project/UCI HAR Dataset/train")
xtrain <- read.table("x_train.txt")
ytrain <- read.table("y_train.txt")
subjecttrain <- read.table("subject_train.txt")

#read in activity data
setwd("C:/Users/braden.c.glover/Desktop/Coursera/Getting and Cleaning Data/Course Project/UCI HAR Dataset")
labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

#avg_std_rows finds row numbers for features for means/std.
#avoids strings that are of the form "meanf..." so that weighted means are not taken
avg_std_rows <- grep("mean[^F]|std",features[,2])

#rbind all test and train sets. Then filter by avg_std_rows
all_x <- rbind(xtrain, xtest)
meanstd_all_x <- all_x[,avg_std_rows]
all_y <- rbind(ytrain, ytest)
all_subject <- rbind(subjecttrain, subjecttest)

#Adjusted variable names for x
avgstdnames<-features[avg_std_rows,2]
avgstdnames<-tolower(avgstdnames)
avgstdnames<-gsub("[()]","",avgstdnames)
avgstdnames<-gsub("[-]","",avgstdnames)
names(meanstd_all_x)<-avgstdnames

# Names are given to the all_subject and all_y columns.
names(all_subject) <- "subject"
names(all_y) <- "active"

#adjust other variable names
names(labels)<-c("number","activity")
labels$activity<-tolower(labels$activity)
labels$activity<-gsub("[_]","",labels$activity)

# cbind new dataframes together
# merge is used to replace activity numbers with activity names.
tidy <- cbind(meanstd_all_x, all_subject, all_y)
tidy <- merge(tidy, labels,by.x="active",by.y="number",sort=FALSE)
tidy$activ <- NULL

#melt tidy data set together and write it out to a csv
tidymelt <- melt(tidy,id=c("subject","activity"))
tidymeltcast <- dcast(tidymelt,subject + activity~variable,mean)
write.csv(tidymeltcast,file="tidy.csv",row.names=FALSE)
