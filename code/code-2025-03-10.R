library(tidyverse)

data <- data.frame(
  treatment = c("a", "b", "a", "b", "a", "b"),
  patient = c("John Smith", "John Smith", "Jane Doe", "Jane Doe", "Mary Johnson", "Mary Johnson"),
  score = c(NA, 18, 4, 1, 6, 7)
)

data %>% 
  pivot_wider(
    names_from = patient, 
    values_from = score
  )

# data$unique_id <- 1:6
# data %>% 
#   pivot_wider(
#     names_from = patient, 
#     values_from = score
#   )
