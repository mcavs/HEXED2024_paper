# The Supplemental Materials of the Paper "The Actionable Explanations for Student Success Prediction Models: A Benchmark Study on the Quality of Counterfactual Methods"

This repository consists the supplemental materials of the paper "". 

1. Install the essential packages [install_packages.R](https://github.com/mcavs/HEXED2024_paper/blob/main/install_packages.R)
2. Import datasets [import_datasets.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/import_dataset.R)
3. Run the essential functions to calculate Rashomon metrics [ambiguity.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/ambiguity.R) and [discrepancy.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/discrepancy.R)
4. Run the `balance()` function to balance the imbalanced datasets [balance.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/balance.R)
5. Run the `rashomon_set()` function to create a Rashomon set for a dataset [rashomon_set.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/rashomon_set.R)
6. Run the experiments on the datasets for various resampling ratios [experiments.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/experiments.R)
    - This step may takes long regarding to the computation power.
    - For this, we stored the results of experiments as `data_rashomon.csv` and `data_VDisc.csv`.
    - These files can be used to reproduce the following plots.
  
## Data 
We used the Open University Learning Analytics dataset - information about 22 courses, 32,593 students, their assessment results, and logs of their interactions with the virtual learning environment. It is collected in the Open University from 2013 and 2014. We followed the same way in the variable and data selection in [Ramos et al. (2023)](). We used the dataset for a STEM course, named `FFF` in the original data source, conducted in 2013 with 2,283 students. It consists of 14 predictors, 6 of which are categorical variables encoded numerically given in the following table. The target is a binary variable `status` consisting of `pass` and `fail`. It is converted from the `score` variable in the original dataset which ranges between 0 and 100. A score lower than 40 is coded as a `fail`.

| Variable                | Description                                                                         | Class        | Values          |
|-------------------------|-------------------------------------------------------------------------------------|--------------|-----------------|
| gender                  | student’s gender                                                                    | categorical  | {0, 1}          |
| region                  | the geographic region, where the student lived while taking the module presentation | categorical  | {1, 2, ..., 13} |
| education               | the highest student education level on entry to the module presentation             | categorical  | {1, 2, ..., 5}  |
| imd_band                | the IMD band of the place where the student lived during the module presentation    | categorical  | {1, 2, ..., 10} |
| age_band                | a band of student’s age                                                             | categorical  | {1, 2, 3}       |
| num_of_prev_attempts    | the number of how many times the student has attempted this module                  | numeric      | [0, 4]          |
| credits                 | the total number of credits for the modules the student is currently studying       | numeric      | [60, 360]       |
| disability              | indicates whether the student has declared a disability                             | categorical  | {0, 1}          |
| assessment_results      | the weighted sum of all previous assessments                                        | numeric      | [24.25, 72.75]  |
| n\_clicks\_disc\_forum  | the number of clicks on discussion forum                                            | numeric      | [0, 7670]       |
| n\_clicks\_disc\_hpage  | the number of clicks on discussion homepage                                         | numeric      | [4, 3150]       |
| n\_clicks\_assignments  | the number of clicks on assignments                                                 | numeric      | [0, 7193]       |
| n\_clicks\_quizzes      | the number of clicks on quizzes                                                     | numeric      | [0, 4857]       |
| n\_clicks\_course\_page | the number of clicks on course page                                                 | numeric      | [0, 1196]       |



## Plots
There are two plots `Figures 3` and `4` in the paper. 

You can used pre-saved experiments results in the files `data_rashomon.csv` and `data_VDisc.csv` if you do not have enough computation power to re-run the experiments.


### Figure 3
The averages of the quality metrics for the methods.

<img src="https://github.com/mcavs/HEXED2024_paper/blob/main/Plots/plot1.png" width="800">

Run [rashomon_plots.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/rashomon_plots.R) to reproduce `Figure 2`.

(!) This figure can be repruduced using the `data_rashomon.csv`.


### Figure 4 
The distributions of the quality metrics for the methods

<img src="https://github.com/mcavs/HEXED2024_paper/blob/main/Plots/plot2.png" width="800">

Run [ggstatsplots_on_Rash_stats.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/ggstatsplots_on_Rash_stats.R) to reproduce `Figure 3`.

(!) This figure can be repruduced using the `data_rashomon.csv`.

