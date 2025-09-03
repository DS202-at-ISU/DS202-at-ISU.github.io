library(classdata)

fbi

crime_counts <- fbi[fbi$type == "homicide", "count"]
mean(crime_counts, na.rm = TRUE)
sd(crime_counts, na.rm = TRUE)

crime_counts <- fbi[fbi$type == "robbery", "count"]
mean(crime_counts, na.rm = TRUE)
sd(crime_counts, na.rm = TRUE)

compute_mean_sd <- function(crime_type, na.rm = FALSE) {
  crime_counts <- 
    fbi[fbi$type == crime_type, "count"]
  mean_result <- mean(crime_counts, na.rm = na.rm)
  sd_result <- sd(crime_counts, na.rm = na.rm)
  
  result <- data.frame(
    type = crime_type,
    mean = mean_result,
    sd = sd_result
  )
  
  return(result)
}
unique(fbi$type)
compute_mean_sd("homicide")
compute_mean_sd("robbery")
compute_mean_sd("motor_vehicle_theft")

# for loop solution
result <- NULL
for (type in unique(fbi$type)) {
  df <- compute_mean_sd(type, na.rm = TRUE)
  result <- rbind(result, df)
}
View(result)

# apply function solution
result_list <- lapply(unique(fbi$type), 
       compute_mean_sd, na.rm = TRUE)
result <- do.call(rbind, result_list)
View(result)

library(tidyverse)
fbi |> 
  group_by(type) |> 
  summarise(
    mean = mean(count, na.rm = TRUE),
    sd = sd(count, na.rm = TRUE)
  )





