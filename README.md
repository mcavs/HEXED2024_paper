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
The Rashomon set is created on the tasks within the imbalanced benchmark dataset provided in the following table. 

| Dataset            | Imbalanced ratio | #Samples | #Variables |
|--------------------|------------------|----------|------------|
| spambase           | 1.54             | 4601     | 55         |
| MagicTelescope     | 1.84             | 19020    | 10         |
| steel-plates-fault | 1.88             | 1941     | 13         |
| qsar-biodeg        | 1.96             | 1055     | 17         |
| phoneme            | 2.41             | 5404     | 5          |
| jm1                | 4.17             | 10880    | 17         |
| SpeedDating        | 4.63             | 1048     | 18         |
| kc1                | 5.47             | 2109     | 17         |
| churn              | 6.07             | 5000     | 8          |
| pc4                | 7.19             | 1458     | 12         |
| pc3                | 8.77             | 1563     | 14         |
| abalone            | 9.68             | 4177     | 7          |
| us_crime           | 12.29            | 1994     | 100        |
| yeast_ml8          | 12.58            | 2417     | 103        |
| pc1                | 13.40            | 1109     | 17         |
| ozone-level-8hr    | 14.84            | 2534     | 72         |
| wilt               | 17.54            | 4839     | 5          |
| wine_quality       | 25.77            | 4898     | 11         |
| yeast_me2          | 28.10            | 1484     | 8          |
| mammography        | 42.01            | 11183    | 6          |
| abalone_19         | 129.53           | 4177     | 7          |

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
