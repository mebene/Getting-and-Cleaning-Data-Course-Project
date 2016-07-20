# Getting-and-Cleaning-Data-Course-Project


From the orginal file , we derived two data sets named:

data_set1 : contains 81 variables with 10,299 rows

data_set2 : contains 81 variables with 180 rows

the R script  explaining how both data set were derived is in the file run_analysis.R

also attached a codebook that describes every variable. 

To derive the datasets we:

1)loaded and merged X_train and X_test files from the original files

2)loaded and merged y_train and y_test files

3)loaded and merged subject_train and subject_test files

4)merged subject file with y file

5)extracted variable names that cointain the word mean or std from the features file

6) merged all files together

7)inserted descriptive activity names to name the activities in the data set and arrange
8) created second dataset

the R code along with the above steps is in the run_analysis.R file

we didn't use the inertial files for test or train. 
