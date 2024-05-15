train_data$final_result <- as.factor(train_data$final_result)
test_data$final_result  <- as.factor(test_data$final_result)

set.seed(123)
model <- ranger(final_result ~., 
                data = train_data,
                probability = TRUE)
