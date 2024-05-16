nice_classif <- NICEClassif$new(
  predictor,
  optimization = "proximity", # sparsity (default), proximity or plausibility.
  x_nn_correct = FALSE,
  return_multiple = TRUE,
  finish_early = TRUE,
  distance_function = "gower")


eval           <- list()
nice_cfactuals <- list()
for(i in 1:dim(x_interest)[1]){
  set.seed(i)
  nice_cfactuals[[i]] <- nice_classif$find_counterfactuals(x_interest[i,], 
                                                           desired_class = "X1", 
                                                           desired_prob = c(0.5, 1))
  eval[[i]] <- nice_cfactuals[[i]]$evaluate()
}
nice_pr_evals <- do.call(rbind, eval)
write.csv(nice_pr_evals, "nice_pr_evals.csv", row.names = FALSE)
