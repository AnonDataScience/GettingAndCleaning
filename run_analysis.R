library(plyr)

#assumption is that all the file/folder structure within the zip is preserved
#and extracted to the working directory

#links the activity name with the class labels
activity_labels<-read.table("activity_labels.txt")
activity_labels[, 2] = gsub("_", "", tolower(as.character(activity_labels[, 2])))

#features looks like it needs normalising
features<-read.table("features.txt")
toMatch <- c("std\\(\\)", "mean\\(\\)")
matches <- grep(paste(toMatch,collapse="|"), features[,2])
rm(toMatch)

#list of the subject for each test
subject_test<-read.table("test/subject_test.txt")
subject_train<-read.table("train/subject_train.txt")
subject <- rbind(subject_train, subject_test)
rm(subject_test,subject_train)
names(subject)<-c("subject")


#x
x_test<-read.table("test/X_test.txt")
x_train<-read.table("train/X_train.txt")
x <- rbind(x_train, x_test)
rm(x_test,x_train)

#y
y_test<-read.table("test/y_test.txt")
y_train<-read.table("train/y_train.txt")
y <- rbind(y_train, y_test)
rm(y_test,y_train)
y[,1] = activity_labels[y[,1], 2]
rm(activity_labels)
names(y) <- "activity"


#x tidy
X<-x[,matches]
names(X) <- features[matches, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))
rm(matches,features)

merged <- cbind(subject, y, X)
rm(subject,x,X,y)
write.table(merged, "tidy_data.txt")


exclude = which(names(merged) %in% c("subject", "activity"))
result <- ddply(merged, .(subject, activity), .fun=function(x){ colMeans(x[,-exclude]) })
write.table(result, "average_data.txt")

rm(merged,result,exclude)
