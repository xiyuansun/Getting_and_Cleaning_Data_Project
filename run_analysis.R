run_analysis <- function(){
      library(dplyr)
      #Read all the necessary data files and put into data.frames:
            #the data.frame features contains the variable labels
            #the "X" data.frames contains the observation frames for both test and train sets
            #the "Y" data.frames contains the activity ID for each observation in the X DFs for both test and train sets
            #the S"S data.frames contains the subjects ID for each observation in the X DFs for both test and train sets
      features <- read.table(paste(getwd(), "/UCI_HAR_Dataset/features.txt", sep=""))
      
      testSetX <- read.table(paste(getwd(), "/UCI_HAR_Dataset/test/X_test.txt", sep=""))
      trainSetX <- read.table(paste(getwd(), "/UCI_HAR_Dataset/train/X_train.txt", sep=""))
      
      testSetY <- read.table(paste(getwd(), "/UCI_HAR_Dataset/test/Y_test.txt", sep=""))
      trainSetY <- read.table(paste(getwd(), "/UCI_HAR_Dataset/train/Y_train.txt", sep=""))
      
      testSetS <- read.table(paste(getwd(), "/UCI_HAR_Dataset/test/subject_test.txt", sep=""))
      trainSetS <- read.table(paste(getwd(), "/UCI_HAR_Dataset/train/subject_train.txt", sep=""))
      
      
      #I filter only the necessary variables as required in the assignment: means and standard deviations
      filteredFeatures <- filter(features, grepl("mean\\(\\)|std\\(\\)", V2))
      
      #bind in an unique data.frame the train and test sets
      setX <- rbind(testSetX, trainSetX)
      
      #select from this DF only the variables that I need as the assignment
      setXNew <- select(setX, filteredFeatures[,1])
      
      #set the variables names as required by step 4 of the assignment
      names(setXNew) <- filteredFeatures[, 2]
      
      #bind in an unique DF both the "Y" and "S" data
      setYNew <- rbind(testSetY, trainSetY)
      setSNew <- rbind(testSetS, trainSetS)
      
      #I create a DF containings the two test and train set merged and with the activity ID and subject ID associated for each observation
      newSet <- cbind(setYNew, setSNew, setXNew)

      #I set the names of variables for ActivityID and Subject
      names(newSet)[1:2] <- c("ActivityID", "Subject")
      
      #read the data table containing the name for each ActivityID
      activities <- read.table(paste(getwd(), "/UCI_HAR_Dataset/activity_labels.txt", sep=""))
      names(activities) <- c("ActivityID", "ActivityName")
      
      #associate the name for each activity as required by the step 3 of the assignment. I remove the ID because unuseful from now on
      merged <- merge(activities, newSet, by.x="ActivityID", by.y="ActivityID")
      merged2 <- select(merged, -ActivityID)
      
      #I create the output table as required by step 5: the mean of each variable for the pairs Subject-Activity
      output <- merged2 %>% group_by(Subject, ActivityName) %>% summarise_each(funs(mean))
      
      #Write the output table to a txt file
      write.table(output, "tidy_dataset.txt", quote=FALSE, row.names = FALSE)
      
      print("Elaboration complete. The file is ready in the working folder")
}