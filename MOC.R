# install.packages("counterfactuals")
# install.packages("iml")
library(counterfactuals)
library(iml)

predictor <- Predictor$new(model)

pred  <- predict(model, test_data[,-15])
index <- which(pred$predictions[,1] > 0.5)

x_interest <- test_data[index,]
predictor$predict(x_interest)

moc_classif <- MOCClassif$new(
  predictor,
  epsilon = NULL,
  fixed_features = c("gender", 
                     "disability", 
                     "region",
                     "age_band",
                     "highest_education"),
  max_changed = NULL,
  mu = 20L,
  termination_crit = "gens",
  n_generations = 10L,
  p_rec = 0.71,
  p_rec_gen = 0.62,
  p_mut = 0.73,
  p_mut_gen = 0.5,
  p_mut_use_orig = 0.4,
  k = 1L,
  weights = NULL,
  lower = NULL,
  upper = NULL,
  init_strategy = "icecurve",
  use_conditional_mutator = FALSE,
  quiet = FALSE,
  distance_function = "gower"
)

eval          <- list()
moc_cfactuals <- list()
for(i in 1:dim(x_interest)[1]){
  set.seed(i)
  moc_cfactuals[[i]] <- moc_classif$find_counterfactuals(x_interest[i,], 
                                                    desired_class = "X1", 
                                                    desired_prob = c(0.5, 1))
  eval[[i]] <- moc_cfactuals[[i]]$evaluate()
}

moc_evals <- do.call(rbind, eval)
setwd("/cloud/project/eval_files")
write.csv(moc_evals, "moc_evals.csv", row.names = FALSE)
setwd("/cloud/project")
