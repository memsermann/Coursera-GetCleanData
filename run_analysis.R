CreateTidy<-function(state, outcome,num = "best"){
        #Read raw training data
        training_raw_data <- read.table("train/X_train.txt")  
        #Read training activities
        training_activities <- read.table("train/y_train.txt")
        #Read training subject IDs
        training_subjects <- read.table("train/subject_train.txt")  
        #Read test training data
        test_raw_data <- read.table("test/X_test.txt")  
        #Read test activities
        test_activities <- read.table("test/y_test.txt")
        #Read test subject IDs
        test_subjects <- read.table("test/subject_test.txt")
        
        #Read activity lables and associate the descriptive lables
        activity_labels<-read.table("activity_labels.txt")
        descriptive_train_activity_labels<-activity_labels[training_activities[,1],2]
        descriptive_test_activity_labels<-activity_labels[test_activities[,1],2]
        
        #Supply column names 
        colnames<-c("Subject","Activity",as.character(features[,2]))
        training_raw_data <- cbind(training_subjects,descriptive_train_activity_labels,training_raw_data)
        colnames(training_raw_data)<- colnames
        test_raw_data <-cbind(test_subjects,descriptive_test_activity_labels,test_raw_data)
        colnames(test_raw_data)<- colnames
        
        #Merge training and test data
        Stack<-rbind(training_raw_data,test_raw_data)
        features<-read.table("features.txt")
        
        #Extract only the measurements on the mean and standard deviation for each measurement
        colnames<-as.character(features[,2])
        MeanAndStd_features <- grepl("mean|std", colnames)
        Stack<-Stack[,c(TRUE,TRUE,MeanAndStd_features)]
        
        #Find mean of each variable for each activity and each subject
        MeanData<-(aggregate(Stack[-c(1,2)], by = Stack[c("Subject","Activity")], FUN = "mean"))
        colnames<-names(MeanData)     
        
        #Clean up column namesgetwd
        colnames<-gsub("()","",colnames,fixed=TRUE)
        colnames(MeanData)<-colnames
        MeanData<-MeanData[order(MeanData[,1],MeanData[,2]),]
        write.table(MeanData,file="tidy.txt",row.name=FALSE)
}


