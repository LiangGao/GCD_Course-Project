###############################################################
# Liang's code for 'Getting and Cleaning Data' Course Project #
#                     July 23rd. 2015                         #
#   Please refer to the readme.md and codebook.md for detial  #
###############################################################

fts = read.csv('./UCI HAR Dataset/features.txt', header = FALSE, sep = '')     # load the feature names
ftnames = fts$V2

subj1 = read.csv('./UCI HAR Dataset/test/subject_test.txt', header = FALSE)    # load the subjects' IDs from test data
SID1 = subj1$V1
dat1 = read.csv('./UCI HAR Dataset/test/X_test.txt', header = FALSE, sep = '') # load the main test data
names(dat1) = ftnames
lab1 = read.csv('./UCI HAR Dataset/test/y_test.txt', header = FALSE)           # activity labels in test data
ActLabel = lab1$V1
Act_list = c('1-WALKING', '2-WALKING_UPSTAIRS', '3-WALKING_DOWNSTAIRS', '4-SITTING', '5-STANDING', '6-LAYING')
Act = ActLabel
for (n in 1:6) {                                               # add the activity name
    Act[Act == n] = Act_list[n]
}
# combine subject ID, activity name, and main test data in to one data frame:
dftmp = data.frame(Subject.ID = SID1, Activity = Act)
dat1new = cbind(dftmp, dat1)
paste('size of dat1new:', format(object.size(dat1new), units = 'MB'))

subj2 = read.csv('./UCI HAR Dataset/train/subject_train.txt', header = FALSE)  # repeat for training data
SID2 = subj2$V1
dat2 = read.csv('./UCI HAR Dataset/train/X_train.txt', header = FALSE, sep = '')
names(dat2) = ftnames
lab2 = read.csv('./UCI HAR Dataset/train/y_train.txt', header = FALSE)
ActLabel = lab2$V1
Act = ActLabel
for (n in 1:6) {
  Act[Act == n] = Act_list[n]
}
dftmp = data.frame(Subject.ID = SID2, Activity = Act)
dat2new = cbind(dftmp, dat2)
paste('size of dat2new:', format(object.size(dat2new), units = 'MB'))

dat0raw = rbind(dat1new, dat2new)                                              # combined training and test sets

# Extracts only the measurements on the mean and standard deviation for each measurement.
idx_m = grep('mean', colnames(dat0raw))
idx_std = grep('std', colnames(dat0raw))
idx = sort(c(1, 2, idx_m, idx_std))
dat0 = dat0raw[,idx]                                                           # data set for step 4
head(dat0)

############### the code below is for step 5 ###############
library(plyr)
result = ddply(dat0, .(Subject.ID, Activity), function(x) colMeans(x[,3:length(dat0)]))
head(result[,1:5], n = 14)
write.table(result, 'GCD_Assignment_Part_5_LG.txt', row.names = FALSE)

