
This repository contains R script `run_analysis.R` that preprocesses data from Human Activity Recognition data set.

`run_analysis.R`

The script requires dplyr, magrittr and reshape2 libraries.

The script expects to be above the unzipped data archive. The download and decompress parts are included in the script but disabled through `if (FALSE)` condition to avoid unnecessary activity.

The processing steps are:
- read training and test sets
- merge them, attach column information with subject and activity
- assign feature names and activity labels
- extract -mean() and -sd() features
- calculate mean of those columns for each subject and each activity
- write output data as tidy.txt file

The full description of original data [can be found here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
