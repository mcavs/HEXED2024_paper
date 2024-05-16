moc_evals     <- read_csv("moc_evals.csv")
nice_pr_evals <- read_csv("nice_pr_evals.csv")
nice_sp_evals <- read_csv("nice_sp_evals.csv")
wi_evals      <- read_csv("wi_evals.csv")

evals <- rbind(data.frame(method = rep("MOC",     dim(moc_evals)[1]),     moc_evals),
               data.frame(method = rep("NiCE_pr", dim(nice_pr_evals)[1]), nice_pr_evals),
               data.frame(method = rep("NiCE_sp", dim(nice_sp_evals)[1]), nice_sp_evals),
               data.frame(method = rep("WhatIf",  dim(wi_evals)[1]),      wi_evals))

evals_filtered <- evals |> 
  select(method, dist_x_interest, no_changed, dist_train, dist_target, minimality) |>
  rename(proximity    = dist_x_interest,
         sparsity     = no_changed,
         plausibility = dist_train,
         validity     = dist_target) |>
  pivot_longer(!method, names_to = "metric", values_to = "value")

write.csv(evals_filtered, "combined_evals.csv", row.names = FALSE)
