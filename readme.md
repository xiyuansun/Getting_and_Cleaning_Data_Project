The script "run_analysis.R" is developed to meet all the requirements of the course project for the coursera course "Getting_and_Cleaning_Data".
It takes two data sets, test and train data, that represents the recording of some biometrical parameters from a Samsung mobile. The objective is to merge them into an unique data set, add information about the activity related and the subject performing each observation and associating each label to the corresponding variable.
Then the script will produce an output dataset which contains the average value, grouped by the couple Subject-Activity, for every "mean" and "standard deviation" variable.

This readme.md file contains the instruction to run the script prepared for the project of the Getting and Cleaning Data course.

1. Download all the content of the repository "Getting_and_Cleaning_Data_Project" in the local machine
2. Set the downloaded folder as the working directory in R
3. Run the command "source('run_analysis.R')" in R to load the function "run_analysis" in the global environment
4. Run the command "run_analysis()" and wait for the message "Elaboration complete. The file is ready in the working folder"
5. The result of the elaboration is now in the working folder and it's called "tidy_dataset.txt"