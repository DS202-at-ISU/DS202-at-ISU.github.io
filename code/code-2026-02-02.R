library(classdata)
head(fbi)


compute_mean_sd <- function(input_type, na.rm = TRUE) {
  bool_vec <- fbi$type == input_type 
  input_type_count <- fbi$count[bool_vec]
  
  mean_val <- mean(input_type_count, na.rm = na.rm)
  sd_val <- sd(input_type_count, na.rm = na.rm)
  
  result <- data.frame(
    type = input_type,
    mean = mean_val,
    sd = sd_val
  )
  result
}

compute_mean_sd("homicide")
compute_mean_sd("rape_revised")

unique(fbi$type)

# simplest way
result1 <- compute_mean_sd("homicide")
result2 <- compute_mean_sd("rape_legacy")
result9 <- compute_mean_sd("arson")
rbind(result1, result2, result9)

# for loop
result <- NULL
for (crime in unique(fbi$type)) {
  tmp_result <- compute_mean_sd(crime)
  result <- rbind(result, tmp_result)
}
result

# apply function
result_list <- lapply(unique(fbi$type),
                      compute_mean_sd) 
result <- do.call(rbind, result_list)
result

# tidyverse function
library(tidyverse)
fbi |> 
  group_by(type) |> 
  summarise(
    mean_value = mean(count, na.rm = TRUE),
    sd_value = sd(count, na.rm = TRUE)
  )

#####################

# load dataset
brfss <- read.csv("data/brfss_iowa.csv")
nrow(brfss)
str(brfss)
dim(brfss)

brfss$WEIGHT2
brfss$HEIGHT3

sum(colnames(brfss) == "WEIGHT2")
which(colnames(brfss) == "WEIGHT2")
colnames(brfss)[65]

colnames(brfss)[which(colnames(brfss) == "HEIGHT3")]

# we can find these two variables inside the dataset

# find correlation between height and weight

# we'll first separate the data into male's and female's

# male:
male_data <- brfss[brfss$SEX == 1, ]
# female:
female_data <- brfss[brfss$SEX == 2, ]

# calculate correlation:
## for males:
cor(male_data$HEIGHT3, male_data$WEIGHT2,
    use = "pairwise")
## for females:
cor(female_data$HEIGHT3, female_data$WEIGHT2,
    use = "pairwise")

# visualize height and weight
library(ggplot2)
library(tidyverse)
ggplot(brfss, aes(x = HEIGHT3, y = WEIGHT2)) +
  geom_point()

# this result is not correct since ...
# xxx
# xxx 

# so, for the next step, we want to ...





