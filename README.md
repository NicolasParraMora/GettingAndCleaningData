# GettingAndCleaningData
A repository with the development of the Getting and Cleaning Data Course Project for Coursera

Firstly, the working directory was setted according where the files downloaded from the course site where saved.
The dyplyr package was loaded.
The datasets where loaded indepently, changing the column names according if the subject or the activity file was being loaded. Then each dataframe (test and train) were formed. 
For the merge, each data set had different number of subjects, none of them repeated, so the rbind operation was enough. 

For the renaming of the activity factors, the corrrespondent column of the data frame had to be coerced as a factor so the levels operation could be done. 

For the descriptive variable names, the "features.txt" file was loaded and, since the variables from the train and the test dataframes kept the same order, the renaming was done taking into account that the first two rows of the data frame were subject and activity.

In order to select the measurements on the mean and the sd for each measument, the function select was used, keeping the subject and the activity variables and usin the contains function, which output is a boolean vector returning true if the condition is fulfilled and the selection was done. 

The result of these operations is the first dataframe requested.

Then, the subject variable was coerced into a factor so that the grouping operation could be performed and, using the summarise_all function the mean by factor and by subject was calculated obtaining the final dataframe requested.

Finally, the file requested on the course site was written, as requested. 

Thank you. 
