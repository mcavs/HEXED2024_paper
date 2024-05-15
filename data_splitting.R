set.seed(123)
data_split <- initial_split(data = data, prop = 0.80) 
train_data <- data_split |> training()
test_data  <- data_split |> testing()