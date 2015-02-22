Xtest<-read.table("X_test.txt")
Ytest<-read.table("y_test.txt")
Xtra<-read.table("X_train.txt")
Ytra<-read.table("y_train.txt")
subtrain<-read.table("subject_train.txt")
subtest<-read.table("subject_test.txt")

test<-cbind(Ytest,Xtest)
test<-cbind(subtest,test)

train<-cbind(Ytra,Xtra)
train<-cbind(subtrain,train)

set <- rbind(train,test)


set[,2] <- gsub("1","WALKING",set[,2])
set[,2] <- gsub("2","WALKING_UPSTAIRS",set[,2])
set[,2] <- gsub("3","WALKING_DOWNSTAIRS",set[,2])
set[,2] <- gsub("4","SITTING",set[,2])
set[,2] <- gsub("5","STANDING",set[,2])
set[,2] <- gsub("6","LAYING",set[,2])

values <-subset(set, select = c(3:563))
set$mean <- rowMeans(values, na.rm = TRUE)
set$stddev <- apply(values,1,sd)
matrix <-subset(set, select = c(1,2,564,565))
x<-matrix
Output <- data.frame()
for (n in 1:30) {
  WALKING <- x[(x[,1]==n & x[,2]=="WALKING"),]
  stddev1 <- mean(WALKING[,4])
  mean1 <- mean(WALKING[,3])
  WALKING_U <- x[(x[,1]==n & x[,2]=="WALKING_UPSTAIRS"),]
  stddev2 <- mean(WALKING_U[,4])
  mean2 <- mean(WALKING_U[,3])
  WALKING_D <- x[(x[,1]==n & x[,2]=="WALKING_DOWNSTAIRS"),]
  stddev3 <- mean(WALKING_D[,4])
  mean3 <- mean(WALKING_D[,3])
  SITTING <- x[(x[,1]==n & x[,2]=="SITTING"),]
  stddev4 <- mean(SITTING[,4])
  mean4 <- mean(SITTING[,3])
  STANDING <- x[(x[,1]==n & x[,2]=="STANDING"),]
  stddev5 <- mean(STANDING[,4])
  mean5 <- mean(STANDING[,3])
  LAYING <- x[(x[,1]==n & x[,2]=="LAYING"),]
  stddev6 <- mean(LAYING[,4])
  mean6 <- mean(LAYING[,3])
  
  a<-cbind(n,"WALKING",stddev1,mean1)
  b<-cbind(n,"WALKING_U",stddev2,mean2)
  c<-cbind(n,"WALKING_D",stddev3,mean3)
  d<-cbind(n,"SITTING",stddev4,mean4)
  e<-cbind(n,"STANDING",stddev5,mean5)
  f<-cbind(n,"LAYING",stddev6,mean6)
  
  colnames(a) <- c("identifier", "activity","Std Dev","Mean")
  colnames(b) <- c("identifier", "activity","Std Dev","Mean")
  colnames(c) <- c("identifier", "activity","Std Dev","Mean")
  colnames(d) <- c("identifier", "activity","Std Dev","Mean")
  colnames(e) <- c("identifier", "activity","Std Dev","Mean")
  colnames(f) <- c("identifier", "activity","Std Dev","Mean")


  Output<-rbind(Output,a,b,c,d,e,f)
  
  
}
  
return(Output)


