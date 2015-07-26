
# Variables
###Naming of Downloaded files
* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test`

###Variables and data created in futher workings
* `x`, `y` and `subject_data` merge the previous datasets to further analysis.
* `features` contains the correct names for the `x` dataset, which are applied to the column names stored in `mean_and_std_features`, a numeric vector used to extract the desired data.
* A similar approach is taken with activity names through the `activities` variable.
* `all_data` is created by merging  `x`, `y` and `subject_data` into a big dataset.
* `average_data.txt` is the final clean data file created in step 5 
