wi_classif <- WhatIfClassif$new(predictor, n_counterfactuals = 10L) 

eval         <- list()
wi_cfactuals <- list()
for(i in 1:dim(x_interest)[1]){
  set.seed(i)
  wi_cfactuals[[i]] <- wi_classif$find_counterfactuals(x_interest[i,], 
                                                      desired_class = "X1", 
                                                      desired_prob = c(0.5, 1))
  eval[[i]] <- wi_cfactuals[[i]]$evaluate()
}

wi_evals <- do.call(rbind, eval)
write.csv(wi_evals, "wi_evals.csv", row.names = FALSE)
