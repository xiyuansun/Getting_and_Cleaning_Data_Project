Experimental design and background:
The data set come from <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">UCI</a> repository.
It contains information about biometric values recorded by Samsung smartphones devices in use to 30 subject involved in the experiment. Each of them performed 6 basilar activities such as WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.
For every observation the devices recorded the following information:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

The data from the volunteer were used to generate for the 70% the train set and for the 30% the test set.


Raw data:
The data used by the script consists of X, Y and subject data file for each kind of set (train and test), an activity_labels data table and a features data table:
- the "X" data file contains the observations of every biometric parameter
- the "Y" data file contains the activity performed for every observation
- the "subject" data file contains the ID of the person who performed that specific activity
- the "activity_labels" contains the name of every activity associated to an ID (the "Y" table contains just  numeric ID, not the description)
- the "features" data table contains the name of each biometric variable recorded for every observation

Tidy data:
The objective of this script is to transform the Raw Data to have just an output table containing every possible couple of subject-activity and, for each of them, the average value of every mean and standard deviation measure. Considering 30 volunteers and 6 different activities this table should contain 180 observations.

Process:
1. First all of the Raw Data was imported into data frames in R.
2. Then I filtered only the biometric values of our interested from the "features" data frame
3. I created an unique data frame of the X observation binding rows of both the "X" data frames
4. I filtered from this new X data frame just the variables of our interested obtained from the 2nd step
5. I changed the names of the variables using the "features" second column substituting the "names" array of the new X data frame
6. I merged both the "Y" and the subject test and data frames to let them ready to be bound with the X data frame
7. I created an unique data frame bindind the columns of the X, Y and subject data frames. Now I have all the needed information for each observation in the same row
8. I set the names of ActivityID and Subject to the corresponding columns of this new data frame (I didn't changed before the Y and subject DF cols names)
9. Using the "merge" function I associated the activity labels to each observation, taking it from the "activity_labels" data and I remove the ActivityID variable because unuseful from now on
10. I create the output tidy data grouping by subject and activity and calculating the mean of every variable. I use on this purpose the summarise_each function from the library dplyr
11. I create the output txt file containings the tidy data using the write.table function. The file is created in the working directory and I use explicity the options quote=FALSE and row.names = FALSE because I don't want in the output file neither the quotes for string variables nor the name of the row observation.