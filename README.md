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

It is one of the imbalanced benchmark datasets consists several data from the various domains. The imbalance ratio (`#Samples in majority class` / `#Samples in minority class`) of the datasets varies between $1.54$ and $129.53$.


## Plots
There are five plots `Figures 2-6` in the paper. You can used pre-saved experiments results in the files `data_rashomon.csv` and `data_VDisc.csv` if you do not have enough computation power to re-run the experiments.


### Figure 2 
The zone plot of the Rashomon metrics ambiguity and discrepancy for different balancing methods and various resampling ratios. The zones show two-dimensional regions where metrics’ values are dense. The value of 1.25 means the frequency of the majority class over the frequency of the minority class. Zones being close to zero on both axes indicate low severity of multiplicity, and moving away from them indicates increasing severity of multiplicity.

<img src="https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/plots/plot1.png" width="800">

Run [rashomon_plots.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/rashomon_plots.R) to reproduce `Figure 2`.

(!) This figure can be repruduced using the `data_rashomon.csv`.


### Figure 3 
The distribution plots of the Rashomon metrics ambiguity and discrepancy for different balancing methods. The plots consist of the results of the statistical tests Kruskal Wallis and Dunn’s Pairwise tests. The reference bars above each violin indicate statistically significant differences between the medians of groups and the corresponding statistical information.

<img src="https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/plots/comparison_amb_disc.png" width="800">

Run [ggstatsplots_on_Rash_stats.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/ggstatsplots_on_Rash_stats.R) to reproduce `Figure 3`.

(!) This figure can be repruduced using the `data_rashomon.csv`.

### Figure 4 
The distribution plots of the Rashomon metric variable importance order discrepancy for different balancing methods. The plots consist of the results of the only Kruskal-Wallis test. Because there is no difference between groups, no need to conduct any pairwise comparison test.

<img src="https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/plots/VIO_disc.png" width="800">

Run [VI_disc_plot.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/VI_disc_plot.R) to reproduce `Figure 4`.

(!) This figure can be repruduced using the `data_VDisc.csv`.


### Figure 5
The distribution plots of the Rashomon metric variable importance order discrepancy for different balancing methods and varying partial resampling ratios.

<img src="https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/plots/partial_resampling_plot.png" width="800">

Run [partial_resampling_plots.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/partial_resampling_plots.R) to reproduce `Figure 5`.

(!) This figure can be repruduced using the `data_rashomon.csv` and `data_VDisc.csv`.

### Figure 6
The performance gain plots of ambiguity, discrepancy, variable importance order discrepancy for different balancing methods and varying partial resampling ratios. The horizontal axis shows the performance gain in terms of AUC. The zero indicates no gain, and the negative values indicate the performance loss. The vertical axes are limited between zero and one for ambiguity and discrepacny, but it is between minus one and one for variable importance order discrepancy. The moving of the zones towards the positive way on the horizontal axis indicates an increase in performance gain, and moving towards the negative way on the vertical axis indicates a decrease in the multiplicity.

<img src="https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/plots/performance_gain_plot.png" width="800">

Run [performance_gain_plot.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/performance_gain_plot.R) to reproduce `Figure 6`.

(!) This figure can be repruduced using the `data_rashomon.csv` and `data_VDisc.csv`.
