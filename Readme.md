READ ME


Here I describe the process by which I went about organizing the dataset to achieve the targets described 
by the project discussion.

First I read the files into R using simple and recognizable names:

Xtest<-read.table("X_test.txt")
Ytest<-read.table("y_test.txt")
Xtra<-read.table("X_train.txt")
Ytra<-read.table("y_train.txt")
subtrain<-read.table("subject_train.txt")
subtest<-read.table("subject_test.txt")

I then bind the files together to add the subject identifier as well as the activity identifier to the data 
recorded from the sensors.

I then substituted the activity numbers with real descriptors. 
We then calculate the means and standard deviations by subsetting and using colMeans.
Finally I create the tidy data set by subsetting conditionally on activity and identifier and averaging the data from the sensors.

