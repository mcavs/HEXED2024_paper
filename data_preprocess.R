data <- FFF_2013J_data |> 
  filter(final_result != "Distinction") |>
  select(gender, region, highest_education,
         imd_band, age_band, num_of_prev_attempts,
         studied_credits, disability,
         cummulative_assessment_results,
         clicks_forumng,
         clicks_homepage,
         clicks_oucontent,
         clicks_quiz,
         clicks_subpage,
         final_result)

data <- na.omit(data)

data$final_result      <- ifelse(data$final_result == "Pass", "1", "0")
data$disability        <- ifelse(data$disability == "TRUE", 1, 0)
data$age_band          <- ifelse(data$age_band == "0-35", 1, 
                          ifelse(data$age_band == "35-55", 2, 3))
data$imd_band          <- as.numeric(as.factor(data$imd_band))
data$highest_education <- as.numeric(as.factor(data$highest_education))
data$region            <- as.numeric(as.factor(data$region))
data$gender            <- as.numeric(as.factor(data$gender))




