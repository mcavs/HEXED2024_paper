combined_evals <- read_csv("combined_evals.csv")

summarised_data <- combined_evals |> 
  group_by(method, metric) |>
  summarise(mean_val = mean(value),
            std_val  = sd(value))

ggplot(summarised_data, aes(x     = method,
                            y     = mean_val,
                            group = metric,
                            color = metric)) + 
  geom_point(size = 2) + 
  geom_line(linewidth = 1.4) + 
  labs(x     = "Counterfactual Generation Methods",
       y     = "Average Metric Values",
       color = "") +
  theme_bw() +
  theme(legend.position = "bottom",
        panel.grid.minor.x = element_blank(),
        panel.grid.major.x = element_blank(),
        text = element_text(size = 20), 
        axis.text = element_text(size = 20), 
        axis.title = element_text(size = 20), 
        plot.title = element_text(size = 20),
        legend.text = element_text(size = 20), 
        legend.title = element_text(size = 20))

ggplot(combined_evals, aes(x = method, y = value, fill = method)) + 
  geom_boxplot(outliers = FALSE, staplewidth = 0.5) + 
  coord_flip() + 
  facet_wrap(~ metric, nrow = 5, scales = "free_x") + 
  theme_bw() + 
  theme(legend.position = "bottom",
        axis.title.y    = element_blank(),
        axis.text.y     = element_blank(),
        axis.ticks.y    = element_blank(),
        text = element_text(size = 20), 
        axis.text = element_text(size = 20), 
        axis.title = element_text(size = 20), 
        plot.title = element_text(size = 20),
        legend.text = element_text(size = 20), 
        legend.title = element_text(size = 20)) 
