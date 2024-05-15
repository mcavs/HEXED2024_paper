average_evals <- combined_evals |> 
  group_by(method, metric) |>
  summarise(mean_val = mean(value))

kruskal.test(combined_evals$value, combined_evals$method)

pairwise.wilcox.test(combined_evals$value, 
                     combined_evals$method,
                     p.adjust.method = "BH")

